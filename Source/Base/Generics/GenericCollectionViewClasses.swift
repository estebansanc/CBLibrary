//
//  GenericClasses.swift
//  MVPC_Architecture
//
//  Created by Esteban Sánchez on 24/05/2021.
//

import Foundation
import UIKit

// MARK:- Generic Collection View Controller
class GenericCollectionViewController<Cell: GenericCollectionViewCell<ViewModel>, ViewModel>: UICollectionViewController {
    var viewModels = [ViewModel]() {
        didSet {
            DispatchQueue.main.async {[weak self] in
                self?.collectionView.reloadData()
            }
        }
    }
    let cellIdentifier = "cell"
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Only available if SkeletonView pod installed
//        view.setSkeletonableViews(views: collectionView)
        collectionView.backgroundColor = .black
        collectionView!.register(Cell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! Cell
        
        cell.viewModel = viewModels[indexPath.row]
        
        return cell
    }
    
    // MARK:- Setup
    private func setupCollectionView(){
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        collectionView.addSubview(refreshControl)
    }
    
    // MARK:- Objc Functions
    @objc func refresh(_ sender: AnyObject) {
    }
}

// MARK:- Generic Collection View Cell
class GenericCollectionViewCell<ViewModel>: UICollectionViewCell {
    var viewModel: ViewModel!
}
