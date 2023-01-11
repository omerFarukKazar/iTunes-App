//
//  iTALabel.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 10.01.2023.
//

import UIKit

final class iTALabelStack: UIStackView {
    
    var keyString: String?
    var valueString: String?
    var keyLabel = UILabel()
    var valueLabel = UILabel()

    
    init(frame: CGRect = .zero, key: String, value: String) {
        super.init(frame: .zero)
        self.keyString = key
        self.valueString = value
        
        keyLabel.numberOfLines = 0
        valueLabel.numberOfLines = 0
        
        keyLabel.text = keyString
        valueLabel.text = valueString
        
        self.addArrangedSubview(keyLabel)
        self.addArrangedSubview(UIView())
        self.addArrangedSubview(valueLabel)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
