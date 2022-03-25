//
//  NewScrollableTabView.swift
//  Activistory
//
//  Created by Esteban Sánchez on 31/08/2021.
//

import UIKit

protocol NewScrollableTabViewDelegate: AnyObject {
    func newScrollableTabView(didSelectItemAt index: Int)
}

class NewScrollableTabView<Cell: GenericCollectionViewCell<ViewModel>, ViewModel>: UICollectionViewController {
    // MARK:- Properties
    deinit {
        print("NewScrollableTabView Deinited")
    }
    
    let cellIdentifier = "cell"
    weak var delegate: NewScrollableTabViewDelegate?
    
    var viewModels: [ViewModel] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    // MARK:- Views
    
    // MARK:- Life Cycle
    init(viewModels: [ViewModel]) {
        self.viewModels = viewModels
        super.init(collectionViewLayout: NewScrollableTabView.createCompositionalLayout())
        setupCollectionView()
        setupAppearence()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Setup
    public static func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, environment) in
            let item = NSCollectionLayoutItem(
                layoutSize: .init(widthDimension: .estimated(100),
                                  heightDimension: .estimated(150)))
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: .init(widthDimension: .estimated(150),
                                  heightDimension: .estimated(150)),
                subitems: [item])
            group.interItemSpacing = .fixed(20)
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 20
            section.contentInsets = .init(top: 15, leading: 20, bottom: 15, trailing: 20)
            section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
            
            return section
        }
        
        return layout
    }
    
    private func setupCollectionView() {
        collectionView.register(Cell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupAppearence() {
        collectionView.backgroundColor = .clear
    }
    
    // MARK:- Objc Func
    
    // MARK:- Public Methods
    public func selectItemAt(index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    // MARK:- Data Source
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! Cell
        cell.viewModel = viewModels[indexPath.row]
        return cell
    }
    
    // MARK:- Collection View Delegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        delegate?.newScrollableTabView(didSelectItemAt: indexPath.row)
    }
}
