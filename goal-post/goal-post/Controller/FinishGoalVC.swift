//
//  FinishGoalVC.swift
//  goal-post
//
//  Created by Gurpreet Bhoot on 7/16/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet weak var pointsTextField: UITextField!
    @IBOutlet weak var createGoalBtn: UIButton!
    
    // Varibales
    var goalName: String!
    var goalType: GoalType!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        createGoalBtn.bindToKeyboard()
        
        pointsTextField.delegate = self
    }
    
    func initData(description: String, type: GoalType) {
        self.goalName = description
        self.goalType = type
    }
    
    func save(completion: CompletionHandler) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        
        goal.goalName = goalName
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgressValue = Int32(0)
        
        do {
            try managedContext.save()
            print("Successfully saved data")
            completion(true)
        } catch  {
            debugPrint("Could not save: \(error)")
            completion(false)
        }
    }
    
    // IB-Actions
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func createGoalBtnPressed(_ sender: Any) {
        if pointsTextField.text != nil {
            save { (success) in
                if success {
                    dismiss(animated: true, completion: nil)
                } else {
                    print("Problems son")
                }
            }
        }
    }
}
