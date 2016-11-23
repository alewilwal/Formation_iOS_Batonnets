//
//  Player.swift
//  batonnets
//
//  Created by imac on 14/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import Foundation
class Player {
    
    public static let PLAYER1_KEY:String = "Player1"
    public static let PLAYER2_KEY:String = "Player2"
    
    var nickname:String {
        return _nickname
    }
    
    private var _nickname:String
    var playedGames:Int = 0
    var score:Int = 0
    
    init(nickname:String) {
        _nickname = nickname
    }
    
    func win()  {
        score += 10
        playedGames += 1
    }
    
    func loss() {
        score -= 5
        score = max(0,score)
        playedGames += 1
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.nickname == rhs.nickname
    }
}
