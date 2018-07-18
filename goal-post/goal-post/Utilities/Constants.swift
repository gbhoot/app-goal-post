//
//  Constants.swift
//  goal-post
//
//  Created by Gurpreet Bhoot on 7/16/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit
import CoreData

typealias CompletionHandler = (_ completion: Bool) -> ()

let appDelegate = UIApplication.shared.delegate as? AppDelegate

// Identifiers - Storyboard Segues
let ID_SEGUE_TO_ADD_GOALS_VC        =   "toAddGoalsVC"
let ID_SEGUE_TO_FINISH_GOALS_VC     =   "toFinishGoalsVC"

// Identifiers - Storyboard ID
let ID_SB_GOALS_VC                  =   "GoalsVC"
let ID_SB_CREATE_GOAL_VC            =   "CreateGoalVC"
let ID_SB_FINISH_GOAL_VC            =   "FinishGoalVC"

// Identifiers - Cells
let ID_REUSE_ID_GOAL_CELL           =   "goalCell"

// Types


