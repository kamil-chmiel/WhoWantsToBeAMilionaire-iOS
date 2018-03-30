//
//  ResultsViewController.swift
//  Milionerzy
//
//  Created by Kamil Chmiel on 05.03.2018.
//  Copyright © 2018 Kamil Chmiel. All rights reserved.
//

import UIKit

class ResultsViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var resultsTable: UITableView!
    var resultsArray: [Result] = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let record1 = Result()
        record1.name = "Marta"
        record1.score = 500
        resultsArray.append(record1)
        resultsTable.delegate = self
        resultsTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customResultCell", for: indexPath)
        cell.backgroundColor = UIColor.blue
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = "\(indexPath.row+1). \(resultsArray[indexPath.row].name) - \(resultsArray[indexPath.row].score)zl"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsArray.count
    }
    
    @IBAction func backToMenuPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
