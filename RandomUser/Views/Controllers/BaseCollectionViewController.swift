//
//  BaseCollectionViewController.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 28/02/2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class BaseCollectionViewController: UICollectionViewController {
    
    var viewModel: ViewModel?
    var compositionalLayout: CompositionalLayoutProtocol?
    let controlRefresh = UIRefreshControl()

    fileprivate var activityIndicator: LoadMoreActivityIndicator!

    init(viewModel: ViewModel,
         compositionalLayout: CompositionalLayoutProtocol) {
        self.viewModel = viewModel
        self.compositionalLayout = compositionalLayout
        super.init(nibName: "BaseCollectionViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard (self.viewModel as? UserPageViewModel) != nil else {
        let tabBarOffset = -(self.tabBarController?.tabBar.frame.size.height ?? 0)
        let emptyLoader = EmptyLoader(tabBarOffset: tabBarOffset)
        self.collectionView.updateEmptyScreen(emptyReason: emptyLoader)
        navigationItem.title = viewModel?.titleTabBar
        return
        }
        
        
    }
    
    
    override func viewDidLoad() {
        
        navigationItem.title = viewModel?.titleTabBar
        let tabBarOffset = -(self.tabBarController?.tabBar.frame.size.height ?? 0)
        let emptyLoader = EmptyLoader(tabBarOffset: tabBarOffset)
        self.collectionView.updateEmptyScreen(emptyReason: emptyLoader)
        
        activityIndicator = LoadMoreActivityIndicator(scrollView: collectionView, spacingFromLastCell: 10, spacingFromLastCellWhenLoadMoreActionStart: 60)
        controlRefresh.addTarget(self, action: #selector(self.refreshCollection), for: .valueChanged)
        collectionView.addSubview(controlRefresh)
        
        collectionView.prefetchDataSource = self

        
        // Set layout if we have one
        if let layout = self.compositionalLayout {
            collectionView.collectionViewLayout = layout.create()
        }
        
        // Load data and register cells
        self.viewModel?.loadData { error in
            self.registerCells()
            self.collectionView.reloadData()
        }
    }
    
    
    
    private func displayEmptyPage(error: EmptyError, tabBarOffSet: CGFloat) {
        let empty = EmptyTextAndButton(tabBarOffset: tabBarOffSet,
                                       customTitle: error.errorTitle ?? "",
                                       customDescription: error.errorDescription ?? "",
                                       image: UIImage(named: error.imageName ?? "noInternet")!,
                                       buttonTitle: error.buttonTitle ?? "Error"){
            
            switch error.errorAction {
                case .refresh:
                    self.refreshCollection()
                case .returnBack:
                    self.navigationController?.popViewController(animated: true)
                case .navigation :
                    self.tabBarController?.selectedIndex = 0
            }
            
        }
        
        self.collectionView.updateEmptyScreen(emptyReason: empty)
        self.collectionView.reloadData()
    }
    
    
    
    @objc func refreshCollection() {
        self.viewModel?.loadData { [weak self] error in
            if let error = error {
                let tabBar = -(self?.tabBarController?.tabBar.frame.size.height ?? 0)
                self?.displayEmptyPage(error: error, tabBarOffSet: tabBar)
                
            } else {
                self?.registerCells()
                self?.controlRefresh.endRefreshing()
                self?.collectionView.reloadData()
                
                
            }
        }
    }
    
    // MARK: - Register
    public func registerCells() {
        guard let sections = self.viewModel?.sections as? [CollectionSection] else { return }
        
        for i in 0..<sections.count {
            var section = sections[i]
            
            // Store section position
            section.position = i
            
            // Register header if needed
            if let headerVM = section.headerVM,
               let nibName = headerVM.nibName {
                self.registerSupplementaryView(kind: UICollectionView.elementKindSectionHeader,
                                               reuseIdentifier: headerVM.reuseIdentifier,
                                               nibName: nibName)
            }
            
            // Register footer if needed
            if let footerVM = section.footerVM,
               let nibName = footerVM.nibName {
                self.registerSupplementaryView(kind: UICollectionView.elementKindSectionFooter,
                                               reuseIdentifier: footerVM.reuseIdentifier,
                                               nibName: nibName)
            }
            
            let items = section.cellsVM
            
            for j in 0..<items.count {
                let item = items[j]
                
                // We store index path for item
                item.indexPath = IndexPath(row: j,
                                           section: i)
                
                // If we don't have a nibName, we use the default UICollectionViewCell
                guard let nibName = item.nibName else {
                    self.collectionView.register(UICollectionViewCell.self,
                                                 forCellWithReuseIdentifier: reuseIdentifier)
                    continue
                }
                
                // Otherwise we use the one from the xib
                let nib = UINib(nibName: nibName,
                                bundle: Bundle(for: type(of: item)))
                self.collectionView.register(nib,
                                             forCellWithReuseIdentifier: item.reuseIdentifier)
            }
            
        }
    }
    
    func registerSupplementaryView(kind: String,
                                   reuseIdentifier: String,
                                   nibName: String) {
        let nib = UINib(nibName: nibName,
                        bundle: Bundle(for: type(of: self)))
        self.collectionView.register(nib,
                                     forSupplementaryViewOfKind: kind,
                                     withReuseIdentifier: reuseIdentifier)
    }
    
    
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let vm = self.viewModel else {
            return 0
        }
        return vm.numberOfSections()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let vm = self.viewModel else {
            return 0
        }
        return vm.numberOfItems(in: section)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return UICollectionViewCell()
        }
        
        let reuseIdentifier = cellVM.reuseIdentifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath)

        // Configure the cell
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return
        }
        
        collectionView.prefetchDataSource = self
        cell.configure(cellViewModel: cellVM,
                       from: self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellVM.reuseIdentifier,
                                                      for: indexPath)
        cell.cellPressed(cellViewModel: cellVM,
                         from: self)
        
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
                
            case UICollectionView.elementKindSectionHeader:
                
                // Get Header ViewModel
                guard let section = self.viewModel?.sections[indexPath.section] as? CollectionSection,
                      let headerViewModel = section.headerVM else {
                          return UICollectionReusableView()
                      }
                
                // Dequeue the reusable view
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                 withReuseIdentifier: headerViewModel.reuseIdentifier,
                                                                                 for: indexPath)
                
                headerView.configure(cellViewModel: headerViewModel,
                                     from: self)
                
                //            headerView.cellPressed(cellViewModel: headerViewModel, from: self)
                
                
                
                
                return headerView
                
            case UICollectionView.elementKindSectionFooter:
                
                // Get footer ViewModel
                guard let section = self.viewModel?.sections[indexPath.section] as? CollectionSection,
                      let footerVM = section.footerVM else {
                          return UICollectionReusableView()
                      }
                
                // Dequeue the reusable view
                let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                 withReuseIdentifier: footerVM.reuseIdentifier,
                                                                                 for: indexPath)
                
                footerView.configure(cellViewModel: footerVM,
                                     from: self)
                
                return footerView
            default:
                assert(false, "Invalid element type")
        }
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        activityIndicator.start {
            DispatchQueue.global(qos: .utility).async {
                self.viewModel?.loadData { [weak self] error in
                    if let error = error {
                        let tabBar = -(self?.tabBarController?.tabBar.frame.size.height ?? 0)
                        self?.displayEmptyPage(error: error, tabBarOffSet: tabBar)
                        
                    } else {
                        self?.registerCells()
                        self?.controlRefresh.endRefreshing()
                        self?.collectionView.reloadData()
                        
                        
                    }
                }
                DispatchQueue.main.async { [weak self] in
                    self?.activityIndicator.stop()
                    
                    self?.collectionView.reloadData()
                }
            }
        }
    }
    
    
    
  
    
}

extension BaseCollectionViewController : UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView,
                        prefetchItemsAt indexPaths: [IndexPath]) {
        guard let vm = self.viewModel as? InfiniteViewModel else {
            return
        }
        
        if indexPaths.contains(where: vm.isLoadingSection) && vm.canLoadMore {
            vm.loadMore { [weak self] _ in
                DispatchQueue.main.async {
                    self?.registerCells()
                    self?.collectionView.reloadData()
                    
                }
               
            }
        }
    }
}
