//
//  PodcastCollectionViewCell.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 23.12.2022.
//

import UIKit

final class PodcastCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    var image: UIImage? {
        didSet{
//            DispatchQueue.main.async {
                self.imageView.image = self.image
//            }
        }
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    // Instantiate view elements
    lazy var imageView = UIImageView()
    private lazy var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("coder: NSCoder has not been implemented")
    }
    
    // MARK: - Layout
    private func setupLayout() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     imageView.topAnchor.constraint(equalTo: self.topAnchor),
                                     imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
        
        imageView.addSubview(titleLabel) //TODO: Add a gradient layer at the bottom of the image and titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([titleLabel.bottomAnchor.constraint(equalTo: imageView.layoutMarginsGuide.bottomAnchor),
                                     titleLabel.leadingAnchor.constraint(equalTo: imageView.layoutMarginsGuide.leadingAnchor),
                                     titleLabel.trailingAnchor.constraint(equalTo: imageView.layoutMarginsGuide.trailingAnchor)])
        titleLabel.textAlignment = .center
        
    }
}

