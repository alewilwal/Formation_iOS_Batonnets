//
//  ViewController.swift
//  batonnets
//
//  Created by imac on 10/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var _matchesCount:Int = 20
    var _currentPlayer:String = "Joueur 1"
    
    @IBOutlet weak var ui_newGameButton: UIButton!
    @IBOutlet weak var ui_currentPlayerLabel: UILabel!
    @IBOutlet weak var ui_matchesCountLabel: UILabel!
    @IBOutlet weak var ui_pick1MatchesButton: UIButton!
    @IBOutlet weak var ui_pick2MatchesButton: UIButton!
    @IBOutlet weak var ui_pick3MatchesButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginNewGame()
        
        let userDefaultsManager:UserDefaults = UserDefaults.standard
        userDefaultsManager.set(120, forKey: Player.SCORE_KEY)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        let userDefaultsManager:UserDefaults = UserDefaults.standard
        let score:Int = userDefaultsManager.integer(forKey: Player.SCORE_KEY)
        ui_currentPlayerLabel.text = "Score : \(score)"
    }
    
    private func updateDisplay() {
        ui_matchesCountLabel.text = "\(_matchesCount)"
        if _matchesCount <= 0 {
            ui_currentPlayerLabel.text = "\(_currentPlayer) a gagné"
            ui_newGameButton.isHidden = false
        } else {
            ui_currentPlayerLabel.text = _currentPlayer
            ui_newGameButton.isHidden = true
        }
        
        ui_pick3MatchesButton.isHidden = _matchesCount < 3
        ui_pick2MatchesButton.isHidden = _matchesCount < 2
        ui_pick1MatchesButton.isHidden = _matchesCount < 1
    }
    
    @IBAction func pickMatches(_ button: UIButton) {
        let matchesToRemove:Int = button.tag
        _matchesCount = _matchesCount - matchesToRemove
        _matchesCount = max(_matchesCount, 0)
        if _currentPlayer == "Joueur 1" {
            _currentPlayer = "Joueur 2"
        } else {
            _currentPlayer = "Joueur 1"
        }
        
        updateDisplay()
    }
    
    @IBAction func beginNewGame() {
        _matchesCount = 20
        _currentPlayer = "Joueur 1"
        
        updateDisplay()
    }
    
}

