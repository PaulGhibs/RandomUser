//
//  TableHeaderSection.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 26/02/2022.
//

import UIKit

class TableHeaderSection: UITableViewCell, CellConfigurable {
  
    
    
    @IBOutlet weak var collectionUsers: UICollectionView!
    @IBOutlet weak var title: UILabel!
    
    
    var userPage : [UserInfos]?
    weak var cellVM : HorizontalHomeCellVM?
    weak var controller : UIViewController?
    
    @IBAction func showAll(_ sender: Any) {
        
        guard let cellVM = self.cellVM, let controller = self.controller else {
            return
        }
        let newRouting = Routing()
//        let route = SearchByURLRoutingEntry(url: cellVM.horizontalPage.seeAll, title: cellVM.horizontalPage.title)
//        _ = newRouting
//            .route(routingEntry: route, fromController: controller, animated: true)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionUsers.register(UserCell.nib(), forCellWithReuseIdentifier: UserCell.identifier)
        collectionUsers.delegate = self
        collectionUsers.dataSource = self
    }
    
    
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        
        guard let cellVM = cellViewModel as? HorizontalHomeCellVM else {
            
          
            return
        }
        self.userPage = cellVM.horizontalGrid.userPage
        self.title.text = cellVM.horizontalGrid.title
        self.cellVM = cellVM
        self.controller = controller
        self.collectionUsers.reloadData()
        
        
    }
    
   
    
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        // do nothing
        
    }
  
    
    

    
}

extension TableHeaderSection : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userPage?.count ?? 0
    }
    
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCell.identifier, for: indexPath) as! UserCell
        cell.configure(userPage : self.userPage![indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCell.identifier, for: indexPath) as! UserCell
        cell.cellPressed(userPage: self.userPage![indexPath.row], from: self.controller!)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexpath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 250)
    }
}
