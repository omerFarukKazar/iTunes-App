//
//  MainViewController.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 16.12.2022.
//

import UIKit

final  class MainViewController: UIViewController {

    private let mainView = MainView() // Instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView // mainView is now our view.
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        
        iTunesAPI.shared.fetchPodcasts() { response, error in
            if let error = error {
                print(error)
                return
            }
            guard let response = response else { return }
            print(response)
        }
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
}
// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

