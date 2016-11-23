//
//  ViewController.swift
//  batonnets
//
//  Created by imac on 10/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var _game:Game?

    var _matchesCount:Int!
    var _currentPlayer:String!
    let _userDefaultsManager:UserDefaults = UserDefaults.standard
    var _player1:String = "Player 2"
    var _player2:String = "Player 1"
    var _playersArray:[String:Int] = [:]
    
    @IBOutlet weak var ui_newGameButton: UIButton!
    @IBOutlet weak var ui_currentPlayerLabel: UILabel!
    @IBOutlet weak var ui_matchesCountLabel: UILabel!
    @IBOutlet weak var ui_pick1MatchesButton: UIButton!
    @IBOutlet weak var ui_pick2MatchesButton: UIButton!
    @IBOutlet weak var ui_pick3MatchesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDisplay()    }
    
    // Load UserDefaults Number of Matches and Players
    override func viewWillAppear(_ animated: Bool) {
        _matchesCount = SettingsManager.instance.getInitialMatchesCount()
        _player1 = _userDefaultsManager.object(forKey: Player.PLAYER1_KEY) as! String
        _player2 = _userDefaultsManager.object(forKey: Player.PLAYER2_KEY) as! String
        _playersArray = SettingsManager.instance.getPlayerArray()
        beginNewGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Display All Changes
    private func updateDisplay() {
        if let gameInProgress = _game {
            let matchesCount = gameInProgress.matchesCount
            ui_matchesCountLabel.text = "\(matchesCount)"
            if gameInProgress.isGameOver,
                let winner = gameInProgress.winner {
                ui_currentPlayerLabel.text = "\(winner.nickname) a gagné"
                
                //winner.win()
                print("New Score Winner : \(winner.nickname) == \(winner.score)")
                _playersArray[winner.nickname] = _playersArray[winner.nickname]! + 10
                
                ui_newGameButton.isHidden = false
                _game = nil
                
            } else {
                ui_currentPlayerLabel.text = gameInProgress.currentPlayer.nickname
                ui_newGameButton.isHidden = true
            }
            

            if gameInProgress.isGameOver,
                let looser = gameInProgress.looser {
                //looser.loss()
                print("New Score Looser : \(looser.nickname) == \(looser.score)")
                _playersArray[looser.nickname] = _playersArray[looser.nickname]! - 5
                
            }
            
            SettingsManager.instance.setPlayerArray(playersArray: _playersArray)
            
            ui_pick3MatchesButton.isHidden = matchesCount < 3
            ui_pick2MatchesButton.isHidden = matchesCount < 2
            ui_pick1MatchesButton.isHidden = matchesCount < 1
        } else {
            
            
        }
    }
    
    // Remove matches
    @IBAction func pickMatches(_ button: UIButton) {
        if let gameInProgress = _game {
            gameInProgress.removeMatches(matchesToRemove: button.tag)
        }
        updateDisplay()
    }
    
    // Load UserDefaults values
    @IBAction func beginNewGame() {
        let name1 = _player1
        let name2 = _player2
        
        _game = Game(p1: Player(nickname: name1), p2: Player(nickname: name2), matchesCount: SettingsManager.instance.initialMatchesCount)

        updateDisplay()
    }
    

}

