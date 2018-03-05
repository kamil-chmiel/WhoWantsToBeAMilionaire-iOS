//
//  ViewController.swift
//  Milionerzy
//
//  Created by Kamil Chmiel on 28.02.2018.
//  Copyright © 2018 Kamil Chmiel. All rights reserved.
//

import UIKit
import Firebase

class GameViewController: UIViewController {
    
    var seconds = 60
    var timer = Timer()
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
        runTimer()
    }
    
    func loadQuestion() {
        
        let messageDB = Database.database().reference().child("Q1")
        
        messageDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as? String
            print(snapshotValue)
        }
    }
    
    
    func runTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(GameViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if seconds < 0 {
            timer.invalidate()
            print("Time's up!")
        }
        else {
            seconds -= 1
            secondsLabel.text = "\(seconds)"
        }
    }
}

