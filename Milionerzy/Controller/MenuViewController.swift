//
//  MenuViewController.swift
//  Milionerzy
//
//  Created by Kamil Chmiel on 01.03.2018.
//  Copyright © 2018 Kamil Chmiel. All rights reserved.
//

import UIKit
import Firebase

class MenuViewController: UIViewController {
    
    var questionSet : [Question] = []
    let categories = ["Easy", "Medium", "Hard"]
    override func viewDidLoad() {
        super.viewDidLoad()
        getQuestions()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame" {
            let destinationVC = segue.destination as! GameViewController
            destinationVC.questions = questionSet
        }
    }

    func getQuestions() {

        let messageDB = Database.database().reference().child("Questions")
        messageDB.observe(.value) { (snapshot) in
            
            // iteracja przez wszystkie kategorie pytan
            for i in 0...self.categories.count-1 {
                for _ in 0...(12/self.categories.count) {
                    let amount = snapshot.childSnapshot(forPath: self.categories[i]).childrenCount
                    let randomNum = Int(arc4random_uniform(UInt32(amount))) + 1
                    let currentQuestion = snapshot.childSnapshot(forPath: self.categories[i]).childSnapshot(forPath: "Q\(randomNum)")
                    
                    let newQuestion = Question()
                    guard let q = currentQuestion.childSnapshot(forPath: "Q").value as? String else { fatalError("Question receiving fail")}
                    guard let a = currentQuestion.childSnapshot(forPath: "A").value as? String else { fatalError("Question receiving fail")}
                    guard let b = currentQuestion.childSnapshot(forPath: "B").value as? String else { fatalError("Question receiving fail")}
                    guard let c = currentQuestion.childSnapshot(forPath: "C").value as? String else { fatalError("Question receiving fail")}
                    guard let d = currentQuestion.childSnapshot(forPath: "D").value as? String else { fatalError("Question receiving fail")}
                    guard let ans = currentQuestion.childSnapshot(forPath: "ans").value as? String else { fatalError("Question receiving fail")}
                    guard let lvl = currentQuestion.childSnapshot(forPath: "lvl").value as? Int else { fatalError("Question receiving fail")}
                    
                    newQuestion.questionBody = q
                    newQuestion.answers.append(a)
                    newQuestion.answers.append(b)
                    newQuestion.answers.append(c)
                    newQuestion.answers.append(d)
                    newQuestion.correctAnswer = ans
                    newQuestion.difficultyLvl = lvl
                    
                    self.questionSet.append(newQuestion)
                    
                    print(self.categories[i], newQuestion.questionBody)
                }
            }
            
        }
    }
    
    
    // MARK - UI Setting
    
    @IBAction func newGamePressed(_ sender: Any) {
        performSegue(withIdentifier: "goToGame", sender: nil)
    }
    
    @IBAction func resultsPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToResults", sender: nil)
    }
    
    @IBAction func instructionPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToInstruction", sender: nil)
    }
}
