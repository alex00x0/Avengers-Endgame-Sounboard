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
//        Chars(name: "SPIDER-MAN", image: UIImage(imageLiteralResourceName: "all avengers"), sounds: [
//            Sounds(statement: "A", file: Bundle.main.url(forResource: "A", withExtension: "aifc")!)]),
//        Chars(name: "SHURI", image: UIImage(imageLiteralResourceName: "all avengers"), sounds: [
//            Sounds(statement: "A", file: Bundle.main.url(forResource: "A", withExtension: "aifc")!)])
        Chars(name: "SPIDER-MAN", image: UIImage(imageLiteralResourceName: "all avengers"), sounds: [
            Sounds(statement: "A")]),
        Chars(name: "SHURI", image: UIImage(imageLiteralResourceName: "all avengers"), sounds: [
            Sounds(statement: "A")])
    ]
        
//      ["SPIDER-MAN"  , "SHURI", "BLACK PANTHER", "DR.STRANGE", "NICK FURY", "VISION", "SCARLET WITCH", "GAMORA", "DRAX", "WINTER SOLDIER", "FALCON", "STAR-LORD", "LOKI", "GROOT"]

    @IBOutlet var rightSwipeRecognizer: UISwipeGestureRecognizer!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func swipeRightDone(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let width = (view.frame.width - 40) / 2
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
    }
    var lastRowSelected : Int?

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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        lastRowSelected = indexPath.item
        self.performSegue(withIdentifier: "openToChar", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        
        switch identifier{
        case "openToChar":
            
            guard let indexPath = collectionView.indexPathsForSelectedItems else {return}
            let sounds = fallen[indexPath.count].sounds
            
            let destination = segue.destination as! CharViewController
            destination.sounds = sounds
            destination.charName = fallen[lastRowSelected!].name
        default:
            print("unexpected segue identifier")
        }
    }
    
}
