//
//  ThanosViewController.swift
//  Avengers: Endgame Sounboard
//
//  Created by Alexander Niehaus on 4/4/19.
//  Copyright © 2019 AlexanderNiehaus. All rights reserved.
//

import UIKit
import AVFoundation

class ThanosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var avPlayer : AVAudioPlayer!
    var thanos : [Sounds] = [Sounds(statement: "A", file: "A")]
    
    @IBOutlet weak var thanosCollectionView: UICollectionView!
    
    @IBAction func unwindWithSwipe(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = thanosCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let width = (view.frame.width - 60) / 2
        layout.itemSize = CGSize(width: width, height: width/1.7)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thanos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thanosCell", for: indexPath) as! ThanosCollectionViewCell
        cell.layer.cornerRadius = 5
        
        cell.contentView.layer.masksToBounds = false
        //cell.backgroundColor = cellColor
        
        let Soundz = thanos[indexPath.item]
        cell.statementSound.text = Soundz.statement
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fileName = thanos[(indexPath as NSIndexPath).item].file
        let audioPlayer: AVAudioPlayer?
        let url = URL(
            fileURLWithPath: Bundle.main.path(
                forResource: fileName,
                ofType: "aifc")!)
        
        do {
            
            try audioPlayer = AVAudioPlayer(contentsOf: url)
            if let sound = audioPlayer {
                avPlayer = sound
                avPlayer.prepareToPlay()
                avPlayer.play()
            }
        } catch {
            print ("Could not create audio player.")
        }
        
    }
    
}
