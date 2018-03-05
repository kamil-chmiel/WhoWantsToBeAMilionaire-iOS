//
//  SettingsViewController.swift
//  Milionerzy
//
//  Created by Kamil Chmiel on 01.03.2018.
//  Copyright © 2018 Kamil Chmiel. All rights reserved.
//

import UIKit

class InstructionViewController: UIViewController {

    @IBOutlet weak var instructionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        instructionLabel.adjustsFontSizeToFitWidth = true
    }

    @IBAction func acceptPressed(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: false)

    }
    

}
