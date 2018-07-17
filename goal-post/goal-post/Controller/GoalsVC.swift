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
        
        setupView()
        setupTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        tableView.isHidden = true
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // IB-Actions
    @IBAction func addGoalBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: ID_SEGUE_TO_ADD_GOALS_VC, sender: self)
    }
}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    // Table View Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ID_REUSE_ID_GOAL_CELL) as? GoalCell else { return UITableViewCell() }
        
        let goal = ""
//        cell.configureCell(name: goal, type: <#T##GoalType#>, goalProgressAmount: <#T##Int#>)
        
        return cell
    }

}

