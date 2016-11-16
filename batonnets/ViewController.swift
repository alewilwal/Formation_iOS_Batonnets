//
//  ViewController.swift
//  batonnets
//
//  Created by imac on 10/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var _matchesCount:Int!
    var _currentPlayer:String = "Joueur 1"
    let userDefaultsManager:UserDefaults = UserDefaults.standard
    var player1:String = "Joueur 1"
    var player2:String = "Joueur 2"
    var playersArray:[String:Int] = [:]
    
    @IBOutlet weak var ui_newGameButton: UIButton!
    @IBOutlet weak var ui_currentPlayerLabel: UILabel!
    @IBOutlet weak var ui_matchesCountLabel: UILabel!
    @IBOutlet weak var ui_pick1MatchesButton: UIButton!
    @IBOutlet weak var ui_pick2MatchesButton: UIButton!
    @IBOutlet weak var ui_pick3MatchesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDefaultsManager.set(120, forKey: Player.SCORE_KEY)
    }
    
    // Load UserDefaults Number of Matches and Players
    override func viewWillAppear(_ animated: Bool) {
        _matchesCount = userDefaultsManager.integer(forKey: Settings.MATCHES_KEY)
        player1 = userDefaultsManager.object(forKey: Player.PLAYER1_KEY) as! String
        player2 = userDefaultsManager.object(forKey: Player.PLAYER2_KEY) as! String
        playersArray = userDefaultsManager.object(forKey: Player.PLAYER_KEY) as! [String:Int]
        beginNewGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        let userDefaultsManager:UserDefaults = UserDefaults.standard
        let score:Int = userDefaultsManager.integer(forKey: Player.SCORE_KEY)
        ui_currentPlayerLabel.text = "Score : \(score)"
    }
    
    // Display All Changes
    func updateDisplay() {
        ui_matchesCountLabel.text = "\(_matchesCount!)"
        if _matchesCount <= 0 {
            playersArray[_currentPlayer]? += 10
            userDefaultsManager.set(playersArray, forKey: Player.PLAYER_KEY)
            ui_currentPlayerLabel.text = "\(_currentPlayer) a gagné"
            ui_newGameButton.isHidden = false
        } else {
            ui_currentPlayerLabel.text = _currentPlayer
            ui_newGameButton.isHidden = true
        }
        
        // Hide Buttons when the number of matches is less than button value
        ui_pick3MatchesButton.isHidden = _matchesCount < 3
        ui_pick2MatchesButton.isHidden = _matchesCount < 2
        ui_pick1MatchesButton.isHidden = _matchesCount < 1
    }
    
    @IBAction func pickMatches(_ button: UIButton) {
        let matchesToRemove:Int = button.tag
        _matchesCount = _matchesCount - matchesToRemove
        _matchesCount = max(_matchesCount, 0)
        if _currentPlayer == player1 {
            _currentPlayer = player2
        } else {
            _currentPlayer = player1
        }
        
        // Timer for simulate the robot reflection
        Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector  (ViewController.updateDisplay), userInfo: nil, repeats: false)
    }
    
    // Load UserDefaults values
    @IBAction func beginNewGame() {
        _matchesCount = userDefaultsManager.integer(forKey: Settings.MATCHES_KEY)
        _currentPlayer = player1
        
        updateDisplay()
    }
    
    // Hide View
    @IBAction func hiddenGame() {
        dismiss(animated: true, completion: nil)
    }
}

