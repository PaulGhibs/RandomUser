//
//  BasicTableViewController.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 23/02/2022.
//


import Foundation
import UIKit


class BasicTableViewController: UITableViewController, UITextFieldDelegate, UINavigationControllerDelegate  {
    
    // MARK: - Properties
    var viewModel: ViewModel?
    // MARK: - Init viewmodels
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "BasicTableViewController", bundle: nil)
    }
    let controlRefresh = UIRefreshControl()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard (self.viewModel as? CellViewModel) != nil else {
            let tabBarOffset = -(self.tabBarController?.tabBar.frame.size.height ?? 0)
            let emptyLoader = EmptyLoader(tabBarOffset: tabBarOffset)
            self.tableView.updateEmptyScreen(emptyReason: emptyLoader)
            self.refreshTableView()
            return
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
                    self.refreshTableView()
                case .returnBack:
                    self.navigationController?.popViewController(animated: true)
                case .navigation :
                    self.tabBarController?.selectedIndex = 0
            }
            
        }
        
        self.tableView.updateEmptyScreen(emptyReason: empty)
        self.tableView.reloadData()
    }
   
    
    @objc func refreshTableView() {
        self.viewModel?.loadData { [weak self] error in
            if let error = error {
                DispatchQueue.main.async {
                    let tabBar = -(self?.tabBarController?.tabBar.frame.size.height ?? 0)
                    self?.displayEmptyPage(error: error, tabBarOffSet: tabBar)
                    
                }
                  
            } else {
                
                DispatchQueue.main.async {
                    self?.registerCells()
                    self?.controlRefresh.endRefreshing()
                    self?.tableView.reloadData()
                }
               
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        let tabBarOffset = -(self.tabBarController?.tabBar.frame.size.height ?? 0)
        let emptyLoader = EmptyLoader(tabBarOffset: tabBarOffset)
        self.tableView.updateEmptyScreen(emptyReason: emptyLoader)
        self.refreshTableView()
        
        controlRefresh.addTarget(self, action: #selector(self.refreshTableView), for: .valueChanged)
        tableView.addSubview(controlRefresh)
        navigationItem.title = viewModel?.titleTabBar
        
    }
    // MARK: - Register Cells
    public func registerCells() {
        // vm sections
        guard let sections = self.viewModel?.sections else { return }
        
        
        for i in 0..<sections.count {
            var section = sections[i]
            
            // We store section position
            section.position = i
            
            let items = section.cellsVM
            
            for j in 0..<items.count {
                let item = items[j]
                
                // We store index path for item
                item.indexPath = IndexPath(row: j,
                                           section: i)
                
                // If we don't have a nibName, we use the default UITableViewCell
                guard let nibName = item.nibName else {
                    tableView.register(UITableViewCell.self,
                                       forCellReuseIdentifier: item.reuseIdentifier)
                    continue
                }
                
                
                // Otherwise we use the one from the xib
                let nib = UINib(nibName: nibName,
                                bundle: Bundle(for: type(of: item)))
                self.tableView.register(nib,
                                        forCellReuseIdentifier: item.reuseIdentifier)
            }
            
        }
    }
    
    
    
    // MARK: - Datasource / delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        // vm functions protocols
        guard let vm = self.viewModel else {
            return 0
        }
        return vm.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vm = self.viewModel else {
            return 0
        }
        // vm functions protocols
        
        
        return vm.numberOfItems(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // vm functions protocols
        
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return UITableViewCell()
        }
        
        let reuseIdentifier = cellVM.reuseIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,
                                                 for: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cellVM = self.viewModel?.item(at: indexPath),
              let configurableCell = cell as? CellConfigurable else {
                  return
              }
        configurableCell.configure(cellViewModel: cellVM,
                                   from: self)
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellVM.reuseIdentifier)
        let configurableCell = cell as? CellConfigurable
        configurableCell?.cellPressed(cellViewModel: cellVM,
                                      from: self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellVM = self.viewModel?.item(at: indexPath) as? TableCellViewModel else {
            return UITableView.automaticDimension
        }
        // cell vm configure protocol
        
        return CGFloat(cellVM.height)
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellVM = self.viewModel?.item(at: indexPath) as? TableCellViewModel else {
            return 0
        }
        // cell vm table view section configure protocol
        
        return CGFloat(cellVM.height)
    }
    
    
}
