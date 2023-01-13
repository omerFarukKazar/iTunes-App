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
    
    var eBook: EBook? { // A generic model and generic data passes could be written 
        didSet {
            title = eBook?.trackName
            detailView.imageView.downloadImage(url: eBook?.artworkUrl100)
            detailView.artistName = eBook?.artistName
            detailView.releaseDate = eBook?.releaseDate
            detailView.country = eBook?.country
            detailView.genre = eBook?.primaryGenreName
        }
    }
    
    var music: Music? {
        didSet {
            title = music?.trackName
            detailView.imageView.downloadImage(url: music?.artworkUrl100)
            detailView.artistName = music?.artistName
            detailView.releaseDate = music?.releaseDate
            detailView.country = music?.country
            detailView.genre = music?.primaryGenreName
        }
    }
    
    private let detailView = DetailView()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
    }
    
}
