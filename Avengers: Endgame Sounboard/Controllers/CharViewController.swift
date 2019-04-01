//
//  CharViewController.swift
//  Avengers: Endgame Sounboard
//
//  Created by Alexander Niehaus on 3/30/19.
//  Copyright © 2019 AlexanderNiehaus. All rights reserved.
//

import UIKit

//@IBOutlet weak var charNameHeader: UILabel!


class CharViewController: UIViewController {
    
    var sound: Sounds?
    var sounds = [Sounds]()
    var charName: String!
    var cellColor : UIColor!

    @IBOutlet weak var charCollectionView: UICollectionView!
    
    @IBOutlet weak var charNameLabel: UILabel!
    @IBAction func unwindWithSwipe(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charNameLabel.text = charName
        let layout = charCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let width = (view.frame.width - 60) / 2
        layout.itemSize = CGSize(width: width, height: width/1.8)
        
        charCollectionView.delegate = self
        charCollectionView.dataSource = self
        charCollectionView.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        charCollectionView.reloadData()
    }
    
}

extension CharViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sounds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "soundCell", for: indexPath) as! CharCollectionViewCell
        cell.layer.cornerRadius = 5

        cell.contentView.layer.masksToBounds = false
        cell.backgroundColor = cellColor

        
        let Soundz = sounds[indexPath.item]
        cell.statementSound.text = Soundz.statement
        cell.file = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("Selected cell named: \(sounds[indexPath.item])")

    }
}
