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
        Chars(name: "CAPTAIN AMERICA", image: UIImage(imageLiteralResourceName: "Captain America"), color: UIColor.red, sounds: [
            Sounds(statement: "A", file: "A")]),
        Chars(name: "IRON MAN", image: UIImage(imageLiteralResourceName: "Iron Man"), color: UIColor.yellow, sounds: [
            Sounds(statement: "B", file: "B")]),
        Chars(name: "BLACK WIDOW", image: UIImage(imageLiteralResourceName: "Black Widow"), color: UIColor.red, sounds: [
            Sounds(statement: "A", file: "A")]),
        Chars(name: "THOR", image: UIImage(imageLiteralResourceName: "Thor"), color: UIColor.yellow, sounds: [
            Sounds(statement: "B", file: "B")]),
        Chars(name: "HULK", image: UIImage(imageLiteralResourceName: "HULK"), color: UIColor.red, sounds: [
            Sounds(statement: "A", file: "A")]),
        Chars(name: "ANT-MAN", image: UIImage(imageLiteralResourceName: "Ant-Man"), color: UIColor.yellow, sounds: [
            Sounds(statement: "B", file: "B")]),
        Chars(name: "CAPTAIN MARVEL", image: UIImage(imageLiteralResourceName: "Captain Marvel"), color: UIColor.red, sounds: [
            Sounds(statement: "A", file: "A")]),
        Chars(name: "WAR MACHINE", image: UIImage(imageLiteralResourceName: "War Machine"), color: UIColor.yellow, sounds: [
            Sounds(statement: "B", file: "B")]),
        Chars(name: "ROCKET", image: UIImage(imageLiteralResourceName: "Rocket"), color: UIColor.red, sounds: [
            Sounds(statement: "A", file: "A")])
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

extension AvengersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avengers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvengerCell", for: indexPath) as! AvengerCollectionViewCell
        let chars = avengers[indexPath.item]

        cell.avengerNameLabel.text = chars.name
        //cell.avengerNameLabel.textColor = chars.color
        cell.avengerImage.image = chars.image
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openToCharA" {
            let cell = sender as! UICollectionViewCell
            let indexPath = collectionView.indexPath(for: cell)!
            let destination = segue.destination as! CharViewController
            destination.cellColor = avengers[indexPath.item].color
            destination.charName = avengers[indexPath.item].name
            destination.sounds = avengers[indexPath.item].sounds
        }
    }


}
