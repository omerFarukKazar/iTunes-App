//
//  MainViewController.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 16.12.2022.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemTeal
        
        iTunesAPI.shared.fetchPodcasts() { response, error in
            if let error = error {
                print(error)
                return
            }
            guard let response = response else { return }
            print(response)
        }
    }
}

