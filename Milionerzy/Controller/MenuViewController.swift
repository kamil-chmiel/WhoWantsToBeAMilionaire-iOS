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

    var questions : [Question] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getQuestions()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame" {
            let destinationVC = segue.destination as! GameViewController
            destinationVC.questions = questions
        }
    }

    func getQuestions() {
        
        let messageDB = Database.database().reference().child("Questions")
        messageDB.observe(.childAdded) { (snapshot) in
            
            let newQuestion = Question()
            guard let q = snapshot.childSnapshot(forPath: "Q").value as? String else { fatalError("Question receiving fail")}
            guard let a = snapshot.childSnapshot(forPath: "A").value as? String else { fatalError("Question receiving fail")}
            guard let b = snapshot.childSnapshot(forPath: "B").value as? String else { fatalError("Question receiving fail")}
            guard let c = snapshot.childSnapshot(forPath: "C").value as? String else { fatalError("Question receiving fail")}
            guard let d = snapshot.childSnapshot(forPath: "D").value as? String else { fatalError("Question receiving fail")}
            guard let ans = snapshot.childSnapshot(forPath: "ans").value as? String else { fatalError("Question receiving fail")}
            newQuestion.questionBody = q
            newQuestion.answers.append(a)
            newQuestion.answers.append(b)
            newQuestion.answers.append(c)
            newQuestion.answers.append(d)
            newQuestion.correctAnswer = ans
            self.questions.append(newQuestion)
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
