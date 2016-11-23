//
//  Game.swift
//  batonnets
//
//  Created by imac on 19/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import Foundation

class Game {
    private let _player1:Player
    private let _player2:Player
    private var _matchesCount:Int
    private var _currentPlayer:Player
    
    var isGameOver:Bool {
        return _matchesCount <= 0
    }
    
    var winner:Player? {
        var winner:Player? = nil
        if isGameOver {
            winner = _currentPlayer
        }
        return winner
    }
    
    var looser:Player? {
        var looser:Player? = nil
        if isGameOver {
            if _currentPlayer == _player1{
                looser = _player2
            }
            else {
                looser = _player1
            }
        }
        return looser
    }
    
    var currentPlayer:Player {
        return _currentPlayer
    }
    
    var matchesCount:Int {
        return _matchesCount
    }
    init(p1:Player,p2:Player,matchesCount:Int) {
        _player1 = p1
        _player2 = p2
        _matchesCount = matchesCount
        _currentPlayer = _player1
    }
    
    func removeMatches(matchesToRemove:Int) {
        _matchesCount = _matchesCount - matchesToRemove
        _matchesCount = max(_matchesCount, 0)
        if _currentPlayer === _player1 {
            _currentPlayer = _player2
        } else {
            _currentPlayer = _player1
        }
        
    }
}
