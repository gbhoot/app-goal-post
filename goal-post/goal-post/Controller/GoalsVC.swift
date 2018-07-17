//
//  ViewController.swift
//  goal-post
//
//  Created by Gurpreet Bhoot on 7/16/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var welcomeLblStack: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        welcomeLblStack.isHidden = true
        tableView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // IB-Actions
    @IBAction func addGoalBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: ID_SEGUE_TO_ADD_GOALS_VC, sender: self)
    }
}

