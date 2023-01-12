//
//  MainView.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 21.12.2022.
//

import UIKit

final class MainView: UIView {
    // MARK: - Properties
    private lazy var flowLayout: UICollectionViewFlowLayout = {
       let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2.2, height: UIScreen.main.bounds.width / 2.2) // TODO: Change size of items
        return flowLayout
    }() // lazy variables instantiation is delayed until it's called.
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        setupCollectionViewLayout()
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    // MARK: - Methods
    private func setupCollectionViewLayout() {
        addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: self.topAnchor),
                                     collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
        
        /* NSLayoutConstraint.activate([NSLayoutConstraint(item: collectionView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: .zero),
                                     NSLayoutConstraint(item: collectionView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: .zero),
                                     NSLayoutConstraint(item: collectionView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: .zero),
                                     NSLayoutConstraint(item: collectionView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: .zero)]) */
        
    // Her iki yöntem de kullanılabilir. Multiplier ya da constant'ı default kullanacaksak genelde üstteki tercih edilir.
    }
    
    /// This function's goal is to keep collectionView private but be able to set it's delegate and dataSource from outer scope.
    func setCollectionViewDelegate(_ delegate: UICollectionViewDelegate, andDataSource dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
     
    func refresh() {
        DispatchQueue.main.async { // All the UI Operations have to be on main thread
            self.collectionView.reloadData()
        }
    }
    
}
