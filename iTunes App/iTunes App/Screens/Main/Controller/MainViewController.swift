//
//  MainViewController.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 16.12.2022.
//

import UIKit

final  class MainViewController: UIViewController {

    // MARK: - Properties
    private let mainView = MainView() // Instance
    private var podcastResponse: PodcastResponse? {
        didSet {
            mainView.refresh()
        }
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView // mainView is now our view.
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        fetchPodcasts()
        
    }
    
    // MARK: - Methods
    /// Fetches the parsed podcast model by using NetworkManager method.
    private func fetchPodcasts() {
        iTunesAPI.shared.fetchPodcasts() { [weak self] response, error in
            if let error = error { fatalError(error.localizedDescription) } // Error check comes before other operations because if there is an error, i want my app to crash or show error immediately in order not to make user wait.
            // If error handling comes after some other operation, the user would have to wait for other operations to be done and if there is an error app would give error.
            guard let response = response,
                  let viewController = self else { return }
            viewController.podcastResponse = response
        }
    }
    
    /// Fetches the image corresponds to the current cell's image url and changes that cell's imageview to fetched image.
    /// - Parameters:
    ///     - url: URL of the image which comes from Podcast model.
    ///     - cell: Current collectionviewcell when this function is called.
    private func fetchImageFrom(_ url: URL?, _ cell: PodcastCollectionViewCell) {
        iTunesAPI.shared.downloadImage(from: url) { image, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
            guard let image = image else { return }
            cell.image = image
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
        podcastResponse?.results?.count  ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PodcastCollectionViewCell
        let podcast = podcastResponse?.results?[indexPath.row] // Response from API for that indexPath
        let url = podcast?.artworkLarge // url of the image.
        
        cell.title = podcast?.trackName
        fetchImageFrom(url, cell)
        return cell
    }
}

