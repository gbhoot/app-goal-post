//
//  AddGoalVC.swift
//  goal-post
//
//  Created by Gurpreet Bhoot on 7/16/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
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
        nextBtn.isEnabled = false
    }
    
    func clearButtonStates() {
        setupView()
        shortTermBtn.isSelected = false
        longTermBtn.isSelected = false
    }
    
    func buttonSelected(whichBtn: UIButton) {
        if whichBtn.isSelected == false {
            clearButtonStates()
            whichBtn.isSelected = true
            nextBtn.isEnabled = true
        } else {
            clearButtonStates()
        }
    }

    // IB-Actions
    @IBAction func shortTermBtnSelected(_ sender: Any) {
        buttonSelected(whichBtn: shortTermBtn)
    }
    
    @IBAction func longTermBtnSelected(_ sender: Any) {
        buttonSelected(whichBtn: longTermBtn)
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: ID_SEGUE_TO_FINISH_GOALS_VC, sender: self)
    }
}
