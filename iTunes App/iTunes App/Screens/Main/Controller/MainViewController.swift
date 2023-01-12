//
//  MainViewController.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 16.12.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    private let mainView = MainView() // Instance
    private var podcastResponse: PodcastResponse? {
        didSet {
            mainView.refresh()
        }
    }
    private var service: PodcastsService?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView // mainView is now our view.
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        fetchPodcasts()
        
    }
    
    init(service: PodcastsServiceable) {
        self.service = service as? PodcastsService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    /// Fetches the parsed podcast model by using NetworkManager method.
    private func fetchPodcasts() {
//        iTunesAPI.shared.fetchPodcasts() { [weak self] response, error in
//            if let error = error { fatalError(error.localizedDescription) } // Error check comes before other operations because if there is an error, i want my app to crash or show error immediately in order not to make user wait.
//            // If error handling comes after some other operation, the user would have to wait for other operations to be done and if there is an error app would give error.
//            guard let response = response,
//                  let viewController = self else { return }
//            viewController.podcastResponse = response
//        }
        
        Task(priority: .background) {
            guard let service = service else { return }
            let result = await service.getPodcasts()
            switch result {
            case .success(let podcastResponse):
                self.podcastResponse = podcastResponse
            case .failure(let error):
                fatalError(error.customMessage)
            }
        }
    }
        
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.podcast = podcastResponse?.results?[indexPath.row] // Passing the data
        navigationController?.pushViewController(detailViewController, animated: true)
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
        cell.imageView.downloadImage(url: url)
        return cell
    }
}
