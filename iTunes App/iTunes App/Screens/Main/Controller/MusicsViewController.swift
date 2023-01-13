//
//  ViewController.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 12.01.2023.
//

import UIKit

final class MusicsViewController: UIViewController {
    
    // MARK: - Properties
    private let mainView = MainView()
    private var musicResponse: MusicResponse? {
        didSet {
            mainView.refresh()
        }
    }
    private var service: MusicsService?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        fetchMusics()
    }
    
    init(service: MusicsServiceable) {
        self.service = service as? MusicsService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func fetchMusics() {

        Task(priority: .background) {
            guard let service = service else { return }
            let result = await service.getMusics()
            switch result {
            case .success(let musicResponse):
                self.musicResponse = musicResponse
            case .failure(let error):
                fatalError(error.customMessage)
            }
        }
    }
    
}

extension MusicsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.music = musicResponse?.results?[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension MusicsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        musicResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        let music = musicResponse?.results?[indexPath.row]
        let url = music?.artworkUrl100
        
        cell.title = music?.trackName
        cell.imageView.downloadImage(url: url)
        return cell
    }
    
    
}
