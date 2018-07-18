//
//  AddGoalVC.swift
//  goal-post
//
//  Created by Gurpreet Bhoot on 7/16/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {
    
    // Outlets
    
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        setGoalType(goalType: .ShortTerm)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        nextBtn.isEnabled = false
        nextBtn.bindToKeyboard()
        
        goalTextView.delegate = self
    }
    
    func setGoalType(goalType: GoalType) {
        if goalType == .LongTerm {
            longTermBtn.setSelectedColor()
            shortTermBtn.setDeselectedColor()
            self.goalType = goalType
        } else {
            shortTermBtn.setSelectedColor()
            longTermBtn.setDeselectedColor()
            self.goalType = goalType
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        nextBtn.isEnabled = true
    }
    
    // IB-Actions
    @IBAction func shortTermBtnSelected(_ sender: Any) {
        setGoalType(goalType: .ShortTerm)
    }
    
    @IBAction func longTermBtnSelected(_ sender: Any) {
        setGoalType(goalType: .LongTerm)
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is your goal?" {            
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: ID_SB_FINISH_GOAL_VC) as? FinishGoalVC else { return }
            finishGoalVC.initData(description: goalTextView.text, type: goalType)
            presentingViewController?.presentSecondaryDetail(finishGoalVC)
        }
    }
}
