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
    var answers: [UIButton] = []
    var prizes: [Int] = [500,1000,2000,5000,10000,20000,40000,75000,125000,250000,500000,1000000]
    var currentPrize = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion(index: questionIndex)
        answers.append(answer1Button)
        answers.append(answer2Button)
        answers.append(answer3Button)
        answers.append(answer4Button)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        runTimer()
    }

    
    func showQuestion(index: Int) {
        
        questionLabel.text = questions[index].questionBody
        answer1Button.setTitle("A: \(questions[index].answers[0])", for: .normal)
        answer2Button.setTitle("B: \(questions[index].answers[1])", for: .normal)
        answer3Button.setTitle("C: \(questions[index].answers[2])", for: .normal)
        answer4Button.setTitle("D: \(questions[index].answers[3])", for: .normal)
    }
    
    func runTimer() {
        seconds = 60
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(GameViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if seconds == 0 {
            timer.invalidate()
            performSegue(withIdentifier: "goToGameOver", sender: nil)
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
        
        let ansTranslate = [ "A" : 1, "B" : 2, "C" : 3, "D" : 4 ]
        let correct = questions[questionIndex].correctAnswer // B
    
        if sender.tag == ansTranslate[correct!] {
            currentPrize = prizes[questionIndex]
            moneyLabel.title = "\(currentPrize)zł"
            questionIndex = questionIndex + 1
            showQuestion(index: questionIndex)
            for answer in answers {
                answer.isEnabled = true
            }
            seconds = 60
        }
        else {
            performSegue(withIdentifier: "goToGameOver", sender: nil)
        }
        
    }
    
    func animateCell() {
        var images: [UIImage] = []
        images.append(UIImage(named: "Check_Cell.png")!)
        images.append(UIImage(named: "Milionerzy_cell.png")!)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToGameOver" {
            timer.invalidate()
            seconds=60
        }
    }
    
    
    @IBAction func fiftyPressed(_ sender: UIButton) {
        
        let ansTranslate = [ "A" : 1, "B" : 2, "C" : 3, "D" : 4 ]
        let correct = questions[questionIndex].correctAnswer
        
        var notCorrect: [Int] = []
        print("Correct: \(ansTranslate[correct!])")
        for i in 0...3 {
            if i != (ansTranslate[correct!]!-1) {
                notCorrect.append(i)
            print("Odrzucamy: \(i)")
            }
        }
        let indexToDisable = Int(arc4random_uniform(2))
        print("Indext: \(indexToDisable)")
        answers[notCorrect[indexToDisable]].setTitle("", for: UIControlState.normal)
        answers[notCorrect[indexToDisable]].isEnabled = false
        answers[notCorrect[indexToDisable]+1].setTitle("", for: UIControlState.normal)
        answers[notCorrect[indexToDisable]+1].isEnabled = false
        
        sender.isEnabled = false
    }
}

