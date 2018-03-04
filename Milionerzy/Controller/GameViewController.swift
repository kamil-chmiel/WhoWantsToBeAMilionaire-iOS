//
//  ViewController.swift
//  Milionerzy
//
//  Created by Kamil Chmiel on 28.02.2018.
//  Copyright © 2018 Kamil Chmiel. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var seconds = 60
    var timer = Timer()
    @IBOutlet weak var secondsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
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

