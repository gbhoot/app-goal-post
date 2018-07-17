//
//  FinishGoalVC.swift
//  goal-post
//
//  Created by Gurpreet Bhoot on 7/16/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var pointsTextField: UITextField!
    

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
    }
    
    // IB-Actions
    @IBAction func backBtnPressed(_ sender: Any) {
        
    }
}
