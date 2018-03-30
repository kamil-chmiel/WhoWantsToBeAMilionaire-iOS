//
//  GameOverViewController.swift
//  Milionerzy
//
//  Created by Kamil Chmiel on 05.03.2018.
//  Copyright © 2018 Kamil Chmiel. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    
    var endingLabel: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func exitPressed(_ sender: UIButton) {
        _ = navigationController?.popToRootViewController(animated: false)
    }
    
    @IBAction func playAgainPressed(_ sender: UIButton) {
        print(navigationController?.topViewController)
        navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navVC = segue.destination as? UINavigationController
        
        let gameVC = navVC?.viewControllers.first as! GameViewController
        print(navVC?.viewControllers.first)
        gameVC.runTimer()
    }
    
}
