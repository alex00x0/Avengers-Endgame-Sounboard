//
//  FallenViewController.swift
//  Avengers: Endgame Sounboard
//
//  Created by Alexander Niehaus on 3/29/19.
//  Copyright © 2019 AlexanderNiehaus. All rights reserved.
//

import UIKit

class FallenViewController: UIViewController {
    
    var fallen : [Chars] = [
        Chars(name: "SPIDER-MAN", image: UIImage(imageLiteralResourceName: "Spider Man"), color: UIColor.red, sounds: [
            Sounds(statement: "C", file: "C")]),
        Chars(name: "BLACK PANTHER", image: UIImage(imageLiteralResourceName: "Black Panther"), color: UIColor.purple, sounds: [
            Sounds(statement: "D", file: "D")]),
        Chars(name: "DR.STRANGE", image: UIImage(imageLiteralResourceName: "dr.strange"), color: UIColor.red, sounds: [
            Sounds(statement: "C", file: "C")]),
        Chars(name: "GROOT", image: UIImage(imageLiteralResourceName: "Groot"), color: UIColor.purple, sounds: [
            Sounds(statement: "D", file: "D")]),
        Chars(name: "LOKI", image: UIImage(imageLiteralResourceName: "Loki"), color: UIColor.red, sounds: [
            Sounds(statement: "C", file: "C")]),
        Chars(name: "SCARLETT WITCH", image: UIImage(imageLiteralResourceName: "Scarlett Witch"), color: UIColor.purple, sounds: [
            Sounds(statement: "D", file: "D")]),
        Chars(name: "STAR LORD", image: UIImage(imageLiteralResourceName: "Star Lord"), color: UIColor.red, sounds: [
            Sounds(statement: "C", file: "C")]),
        Chars(name: "VISION", image: UIImage(imageLiteralResourceName: "Vision"), color: UIColor.purple, sounds: [
            Sounds(statement: "D", file: "D")]),
        Chars(name: "WAR MACHINE", image: UIImage(imageLiteralResourceName: "War Machine"), color: UIColor.purple, sounds: [
            Sounds(statement: "D", file: "D")])
    ]
        

    @IBOutlet var rightSwipeRecognizer: UISwipeGestureRecognizer!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func swipeRightDone(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = (view.frame.width - 60) / 2
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
    }


}

extension FallenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fallen.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FallenCell", for: indexPath) as! FallenCollectionViewCell
        let chars = fallen[indexPath.item]
        
        cell.fallenNameLabel.text = chars.name
        cell.fallenImage.image = chars.image
        
        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openToCharF" {
            let cell = sender as! UICollectionViewCell
            let indexPath = collectionView.indexPath(for: cell)!
            let destination = segue.destination as! CharViewController
            destination.cellColor = fallen[indexPath.item].color
            destination.charName = fallen[indexPath.item].name
            destination.sounds = fallen[indexPath.item].sounds
        }
    }
}
