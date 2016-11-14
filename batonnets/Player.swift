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
    var score:Int = 0
    
    func win()  {
        score += 10
    }
}
