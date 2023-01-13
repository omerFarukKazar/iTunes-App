//
//  ViewController.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 12.01.2023.
//

import UIKit

final class EBooksViewController: UIViewController {

    // MARK: - Properties
    private let mainView = MainView()
    private let service: EBooksServiceable?
    private var eBookResponse: EBookResponse? {
        didSet {
            mainView.refresh()
        }
    }
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        fetchEBooks()
    }
    
    init(service: EBooksServiceable) {
        self.service = service as? EBooksService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func fetchEBooks() {
        Task(priority: .background) {
            guard let service = service else { return }
            let result = await service.getBooks()
            switch result {
            case .success(let eBooksResponse):
                self.eBookResponse = eBooksResponse
            case .failure(let error):
                fatalError(error.customMessage)
            }
        }
    }
}

extension EBooksViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.eBook = eBookResponse?.results?[indexPath.row] // Passing the data
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension EBooksViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        eBookResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        let eBook = eBookResponse?.results?[indexPath.row]
        let url = eBook?.artworkUrl100
        
        cell.title = eBook?.trackName
        cell.imageView.downloadImage(url: url)
        return cell
    }
    
}
