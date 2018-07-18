//
//  ViewController.swift
//  goal-post
//
//  Created by Gurpreet Bhoot on 7/16/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var welcomeLblStack: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    var goals = [Goal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupView()
        setupTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchCoreDataObjects()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        if goals.count > 0 {
            tableView.isHidden = false
            welcomeLblStack.isHidden = true
        } else {
            tableView.isHidden = true
            welcomeLblStack.isHidden = false
        }
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // IB-Actions
    @IBAction func addGoalBtnPressed(_ sender: Any) {
//        performSegue(withIdentifier: ID_SEGUE_TO_ADD_GOALS_VC, sender: self)
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: ID_SB_CREATE_GOAL_VC) else { return }
        presentDetail(createGoalVC)
    }
}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    // Table View Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ID_REUSE_ID_GOAL_CELL) as? GoalCell else { return UITableViewCell() }
        let goal = goals[indexPath.row]
        cell.configureCell(goal: goal)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // Style .destructive -> what you use when data is going to be destroyed
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let addAction = UITableViewRowAction(style: .normal, title: "ADD 1") { (rowAction, indexPath) in
            self.changeProgressValue(atIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 0.9739622474, green: 0.7060521245, blue: 0.1640433371, alpha: 1)
        
        return [deleteAction, addAction]
    }
    
}

extension GoalsVC {
    
    func removeGoal(atIndexPath indexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        managedContext.delete(goals[indexPath.row])
        
        do {
            try managedContext.save()
            print("Successfully removed goal")
        } catch {
            debugPrint("Could not remove: \(error.localizedDescription)")
        }
    }
    
    func changeProgressValue(atIndexPath indexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let chosenGoal = goals[indexPath.row]
        if chosenGoal.goalProgressValue < chosenGoal.goalCompletionValue {
            chosenGoal.goalProgressValue += 1
        } else {
            return
        }
        
        do {
            try managedContext.save()
            print("Successfully change progress!")
        } catch {
            debugPrint("Could not set progress: \(error.localizedDescription)")
        }
    }
    
    func fetch(completion: CompletionHandler) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            goals = try managedContext.fetch(fetchRequest)
            print("Successfully fetched data")
            completion(true)
        } catch  {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func fetchCoreDataObjects() {
        self.fetch { (success) in
            if success {
                setupView()
            }
        }
    }
}

