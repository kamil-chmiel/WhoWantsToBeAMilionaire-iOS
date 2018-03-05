//
//  MenuViewController.swift
//  Milionerzy
//
//  Created by Kamil Chmiel on 01.03.2018.
//  Copyright © 2018 Kamil Chmiel. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

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
