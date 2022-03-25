//
//  GenericTableViewController.swift
//  MVPC_Architecture
//
//  Created by Esteban Sánchez on 24/05/2021.
//

import UIKit
//import SkeletonView

// MARK:- Generic Table View Controller
class GenericTableViewController<cell: GenericTableViewCell<cellViewModel>, cellViewModel>: UITableViewController {
    var viewModels = [cellViewModel]() {
        didSet {
            DispatchQueue.main.async {[weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    let cellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Only available if SkeletonView pod installed
//        UIView.setSkeletonableViews(views: tableView)
        tableView.register(cell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.refreshControl = UIRefreshControl()
        setupTableView()
        setupAppearence()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! cell
        cell.viewModel = viewModels[indexPath.row]
        return cell
    }
    
    
    // MARK:- Setup
    private func setupTableView(){
        refreshControl!.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
    }
    
    private func setupAppearence() {
        tableView.backgroundColor = .clear
    }
    
    // MARK:- Objc Functions
    @objc func refresh(_ sender: AnyObject) {
    }
}

// MARK:- Generic Table View Cell
class GenericTableViewCell<U>: UITableViewCell {
    var viewModel: U!
}

// MARK:- Generic Table View with Diffable Data Source
class GenericDiffableTableViewController<viewModel: Hashable, sections: Hashable>: UITableViewController {
    let cellIdentifier = "cell"
    var dataSource: UITableViewDiffableDataSource<sections, viewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupAppearence()
    }
    
    // MARK:- Setup
    private func setup(){
        tableView.refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
    }
    
    private func setupDataSource() {
        /// Here you setup the cells with the example code:
//        tableView.register(CellClass.self, forCellReuseIdentifier: ReuseIdentifier)
//        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { (tableView, indexPath, viewModel) in
//            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier) as! CellClass
//            return cell
//        })
    }
    
    private func setupAppearence() {
        tableView.backgroundColor = .clear
    }
    
    // MARK:- Objc Functions
    @objc func refresh(_ sender: AnyObject) {
    }
    
    func updateDataSource(sections: [sections], items: [viewModel], animatingDifferences: Bool = true) {
        refreshControl!.endRefreshing()
        var snapshot = NSDiffableDataSourceSnapshot<sections, viewModel>()
        snapshot.appendSections(sections)
        snapshot.appendItems(items)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences, completion: nil)
    }
    
    func updateDataSource(items: [viewModel], toSection: sections, animatingDifferences: Bool = true) {
        refreshControl!.endRefreshing()
        var snapshot = NSDiffableDataSourceSnapshot<sections, viewModel>()
        if snapshot.indexOfSection(toSection) == nil {
            snapshot.appendSections([toSection])
        }
        
        for item in items {
            if snapshot.indexOfItem(item) == nil {
                snapshot.appendItems([item], toSection: toSection)
            }
        }
        
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences, completion: nil)
    }
}

// MARK:- Editable Table View Diffable Data Source
class EditableTableViewDataSource<SectionIdentifierType: Hashable, ItemIdentifierType: Hashable>: UITableViewDiffableDataSource<SectionIdentifierType, ItemIdentifierType> {
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
