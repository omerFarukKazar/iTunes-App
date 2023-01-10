//
//  DetailViewController.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 10.01.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - Properties
    var podcast: Podcast? { // Model data will be passed from MainViewController to DetailViewController when CollectionViewCell tapped.
        didSet {
            title = podcast?.trackName
            detailView.imageView.downloadImage(url: podcast?.artworkLarge)
            detailView.artistName = podcast?.artistName
            detailView.releaseDate = podcast?.releaseDate
            detailView.country = podcast?.country
            detailView.genre = podcast?.genres?.reduce("") {$1 + ", " + $0 } // Got rid of the braces that comes from array
        }
    }
    
    private let detailView = DetailView()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
    }
    
}
