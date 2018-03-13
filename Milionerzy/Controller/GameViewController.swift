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
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    @IBOutlet weak var moneyLabel: UIBarButtonItem!
    
    var questions: [Question] = []
    var questionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
        showQuestion(index: questionIndex)
    }

    
    func showQuestion(index: Int) {
        
        questionLabel.text = questions[index].questionBody
        answer1Button.setTitle("A: \(questions[index].answers[0])", for: .normal)
        answer2Button.setTitle("B: \(questions[index].answers[1])", for: .normal)
        answer3Button.setTitle("C: \(questions[index].answers[2])", for: .normal)
        answer4Button.setTitle("D: \(questions[index].answers[3])", for: .normal)
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
    
    @IBAction func exitPressed(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        
        
        
        questionIndex = questionIndex + 1
        showQuestion(index: questionIndex)
    }
    
    
}

