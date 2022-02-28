//
//  ProtocolViewModel.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 22/02/2022.
//


import Foundation

// MARK: - ViewModel Protocol

protocol ViewModel {
    //each viewmodel have section and load data function
    var sections: [Section] { get set }
    func loadData(callback: @escaping (EmptyError?) -> ())
    var shouldDisplayBackButton : Bool { get  }
    var titleTabBar : String { get }
    
}

extension ViewModel {
    // each vm have a number of sections
    func numberOfSections() -> Int {
        return self.sections.count
    }
    // each vm have a number of items in each sections
    func numberOfItems(in section: Int) -> Int {
        guard self.sections.count > 0 else {
            return 0
        }
        return self.sections[section].cellsVM.count
    }
    // each item is located to an indexPath
    func item(at indexPath: IndexPath) -> CellViewModel {
        return self.sections[indexPath.section].cellsVM[indexPath.row]
    }
    // for editing tableeditedCellviewmodels
    mutating func remove(at indexPath : IndexPath) -> () {
        self.sections[indexPath.section].cellsVM.remove(at: indexPath.row)
    }
}

// infiniteScrollableView can load more infos
protocol InfiniteViewModel: ViewModel {
    // return true if we can load a next page
    var canLoadMore: Bool { get }
    // return true if a request is in progress
    var isFetchInProgress: Bool { get set }
    // Load the next Page Users
    func loadMore(callback: @escaping (EmptyError?) -> ())
}

extension InfiniteViewModel {
    // Called when we scroll at the end of the section
    func isLoadingSection(for indexPath: IndexPath) -> Bool {
        return indexPath.section == self.sections.count-1
    }
}
