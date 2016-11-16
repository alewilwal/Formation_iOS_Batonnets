//
//  Player.swift
//  batonnets
//
//  Created by imac on 14/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import Foundation
class Player {
    
    public static let SCORE_KEY:String = "Score"
    public static let PLAYER_KEY:String = "Player"
    public static let PLAYER1_KEY:String = "Player1"
    public static let PLAYER2_KEY:String = "Player2"
    
    var name:String
    var score:Int
    
    init(name:String, score:Int) {
        self.name = name
        self.score = score
    }
    
    func win()  {
        score += 10
    }
}
