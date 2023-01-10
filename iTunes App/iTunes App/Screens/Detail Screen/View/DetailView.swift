//
//  DetailView.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 10.01.2023.
//

import UIKit

final class DetailView: UIView {
    // MARK: - Properties
    var artistName: String? {
        didSet {
            artistNameLabel.text = "Artist: \(artistName ?? "-")"
        }
    }
    var releaseDate: String? {
        didSet {
            releaseDateLabel.text = "Release Date: \(releaseDate ?? "-")"
        }
    }

    var country: String? {
        didSet {
            countryLabel.text = "Country: \(country ?? "-")"
        }
    }

    var genre: String? {
        didSet {
            genreLabel.text = "Genre: \(genre ?? "-")"
        }
    }

    lazy var labelArray = [artistNameLabel, releaseDateLabel, countryLabel, genreLabel]
    
    // MARK: - UI Elements
    lazy var imageView = UIImageView()  
    private lazy var artistNameLabel = UILabel()
    private lazy var releaseDateLabel = UILabel()
    private lazy var countryLabel = UILabel()
    private lazy var genreLabel = UILabel()
    private lazy var stackView: UIStackView = {
        let s = UIStackView(frame: self.bounds)
        s.axis = .vertical
        s.distribution = .fillEqually
        s.alignment = .fill
        s.spacing = 8.0
        
        for label in labelArray { // It's easier.
            label.numberOfLines = 0
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
