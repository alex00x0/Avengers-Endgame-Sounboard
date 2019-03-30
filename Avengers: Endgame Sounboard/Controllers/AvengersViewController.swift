//
//  AvengersViewController.swift
//  Avengers: Endgame Sounboard
//
//  Created by Alexander Niehaus on 3/29/19.
//  Copyright © 2019 AlexanderNiehaus. All rights reserved.
//

import UIKit

class AvengersViewController: UIViewController {
    
    var avengers : [Chars] = [
        Chars(name: "CAPTAIN AMERICA", image: UIImage(imageLiteralResourceName: "all avengers"), sounds: [
            Sounds(statement: "A", file: Bundle.main.url(forResource: "A", withExtension: "aifc")!)]),
        Chars(name: "IRON MAN", image: UIImage(imageLiteralResourceName: "all avengers"), sounds: [
            Sounds(statement: "A", file: Bundle.main.url(forResource: "A", withExtension: "aifc")!)])
    ]
        
//        ["CAPTAIN AMERICA", "IRON MAN", "BLACK WIDOW", "THOR", "HULK", "HAWKEYE", "ANT-MAN", "CAPTAIN MARVEL", "NEBULA", "VALKYRIE", "WAR MACHINE", "ROCKET"]

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

extension AvengersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avengers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvengerCell", for: indexPath) as! AvengerCollectionViewCell
        let chars = avengers[indexPath.item]

        cell.avengerNameLabel.text = chars.name
        cell.avengerImage.image = chars.image
        return cell
    }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        lastRowSelected = indexPath.row
        self.performSegue(withIdentifier: "openToChar", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "openToChar":
            
            guard let indexPath = collectionView.indexPathsForSelectedItems else {return}
            let sounds = avengers[indexPath.count].sounds
            
            let destination = segue.destination as! CharViewController
            destination.sounds = sounds
            destination.charName = avengers[lastRowSelected!].name
        default:
            print("unexpected segue identifier")
        }

    }


}
