//
//  ViewController.swift
//  Avengers: Endgame Sounboard
//
//  Created by Alexander Niehaus on 3/28/19.
//  Copyright © 2019 AlexanderNiehaus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        aliveButton.layer.cornerRadius = 30
        deadButton.layer.cornerRadius = 30

    }
    @IBOutlet weak var aliveButton: UIButton!
    @IBOutlet weak var deadButton: UIButton!
    
//    @IBAction func dismissVC(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//    }
}
