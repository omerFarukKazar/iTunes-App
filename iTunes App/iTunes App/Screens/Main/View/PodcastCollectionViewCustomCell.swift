//
//  PodcastCollectionViewCell.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 23.12.2022.
//

import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    var image: UIImage? {
        didSet{
            DispatchQueue.main.async {
                self.imageView.image = self.image
            }
        }
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    // Instantiate view elements
    private lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0.5, y: 0.0)
        layer.endPoint = CGPoint(x: 0.5, y: 1.0)
        layer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        layer.locations = [0.0, 1.0]
        return layer
    }()

    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8.0
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = .zero
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("coder: NSCoder has not been implemented")
    }

    // MARK: - Layout
    private func setupLayout() {

        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor)
        ])

        imageView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageView.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.layoutMarginsGuide.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: imageView.layoutMarginsGuide.bottomAnchor)
        ])

        gradientLayer.frame = bounds
        imageView.layer.insertSublayer(gradientLayer, at: .zero)

    }
}

