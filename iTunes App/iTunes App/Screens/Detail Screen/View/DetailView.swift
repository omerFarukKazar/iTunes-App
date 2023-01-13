//
//  DetailView.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 10.01.2023.
//

import UIKit

enum LabelKeys: String, CaseIterable {
    case artist = "Artist:"
    case releaseDate = "Release Date:"
    case country = "Country:"
    case genre = "Genres:"
    
    /*  func KeyType() -> String { // Could be done this way without using Raw Values
        switch self {
        case .artist:
            return "Artist:"
        case .releaseDate:
            return "Release Date:"
        case .country:
            return "Country:"
        case .genre:
            return "Genres:"
        }
    }
*/
}

final class DetailView: UIView {
    // MARK: - Properties
    var artistName: String? {
        didSet {
            artistNameLabel.valueLabel.text =  artistName
        }
    }
    var releaseDate: String? {
        didSet {
            releaseDateLabel.valueLabel.text =  releaseDate
        }
    }
    var country: String? {
        didSet {
            countryLabel.valueLabel.text =  country
        }
    }
    var genre: String? {
        didSet {
            genreLabel.valueLabel.text =  genre
        }
    }
    
    lazy var labelArray = [artistNameLabel, releaseDateLabel, countryLabel, genreLabel]
    
    // MARK: - UI Elements
    lazy var imageView = UIImageView()  
    private lazy var artistNameLabel = iTALabelStack(key: LabelKeys.artist.rawValue, value: artistName ?? "-")
    private lazy var releaseDateLabel = iTALabelStack(key: LabelKeys.releaseDate.rawValue, value: releaseDate ?? "-")
    private lazy var countryLabel = iTALabelStack(key: LabelKeys.country.rawValue, value: country ?? "-")
    private lazy var genreLabel = iTALabelStack(key: LabelKeys.genre.rawValue, value: genre ?? "-")
    private lazy var stackView: UIStackView = {
        let s = UIStackView(frame: self.bounds)
        s.axis = .vertical
        s.distribution = .fillEqually
        s.alignment = .fill
        s.spacing = 8.0
        
        for label in labelArray { // It's easier.
            s.addArrangedSubview(label)
        }
        
        return s
    }()

    // MARK: - Lifecycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
                                     imageView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
                                     imageView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2.5)])
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([stackView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
                                    stackView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
                                     stackView.layoutMarginsGuide.topAnchor.constraint(equalTo: imageView.bottomAnchor)])
    }
}
