//
//  GameStatController.swift
//  RockPaperScissors
//
//  Created by appcamp on 26/07/15.
//  Copyright (c) 2015 Dawid Guze. All rights reserved.
//

import Foundation
import WatchKit

class GameStatController: WKInterfaceController {
    
    @IBOutlet weak var currentScoreLabel: WKInterfaceLabel!
    
    @IBOutlet weak var highScoreLabel: WKInterfaceLabel!
    
    @IBOutlet weak var gamesPlayedLabel: WKInterfaceLabel!
    
    var score = 0;
    var highscore = 0;
    var gamesCounter = 0;
    
    override func awakeWithContext(context: AnyObject?){
        if let dictionary = context as? [String: String],
        score = dictionary["currentScore"],
        highscore = dictionary["highscore"],
        gamesCounter = dictionary["gamesPlayed"]{
            currentScoreLabel.setText(score);
            highScoreLabel.setText(highscore);
            gamesPlayedLabel.setText(gamesCounter);
        }
        
    }
}
