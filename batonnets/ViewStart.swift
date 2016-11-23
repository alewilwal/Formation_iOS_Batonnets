//
//  ViewStart.swift
//  batonnets
//
//  Created by imac on 15/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit

class ViewStart: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerPlayer1: UIPickerView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var ui_selectNbPlayers: UISegmentedControl!
    @IBOutlet weak var ui_startGame: UIButton!
    
    let userDefaultsManager:UserDefaults = UserDefaults.standard
    
    var nbPlayers = 1
    var playersArray:[String:Int] = [:]

    var playersArray1player:[String] = ["Player 1"]
    var playersArray2players:[[String]] = [["Player 1"],["Player 2"]]
    var player1:String = "Player 1"
    var player2:String = "Robot"
    
    // Load UserDefaults in Arrays
    override func viewWillAppear(_ animated: Bool) {
        userDefaultsManager.register(defaults: ["Player" : [:]])
        userDefaultsManager.register(defaults: ["Matches" : 20])
        playersArray = SettingsManager.instance.getPlayerArray()

        // For 1 Player an Array List
        playersArray1player = ["Player 1"]
        for (name, score) in playersArray {
            playersArray1player.append("\(name)")
            _ = score
            
        }
        
        // For 2 Players an Multidimensional Array (2D Array)
        playersArray2players = [["Player 1"],["Player 2"]]
        print("playersArray2players :before: \(playersArray2players)")
        for (name, score) in playersArray{
            playersArray2players[0].append("\(name)")
            playersArray2players[1].append("\(name)")
            _ = score
        }
        
        print("playersArray :: \(playersArray)")
        print("playersArray1player :: \(playersArray1player)")
        print("playersArray2players :: \(playersArray2players)")
        
        display()
        
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let settingsVC = segue.destination as! ViewSettings {
            settingsVC.game = _game
        }

    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize Display
        pickerPlayer1.delegate = self
        pickerPlayer1.dataSource = self
        ui_startGame.isHidden = true
    }
    
    // Save UserDefaults Number of Matches
    override func viewWillDisappear(_ animated: Bool) {
        userDefaultsManager.set(player1, forKey: Player.PLAYER1_KEY)
        userDefaultsManager.set(player2, forKey: Player.PLAYER2_KEY)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Select number of player(s)
    @IBAction func changeNbPlayers(_ sender: AnyObject) {
        if ui_selectNbPlayers.selectedSegmentIndex == 0 {
            nbPlayers = 1
            player2 = "Robot"
            
        }
        if ui_selectNbPlayers.selectedSegmentIndex == 1 {
            nbPlayers = 2
            player2 = "Player 2"
        }
        display()
        // Refresh the UIPickerView
        self.pickerPlayer1.reloadAllComponents()
    }

    // UIPickerView - Display of data according to the number of players
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if nbPlayers == 2 {
            return 2
        } else{
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if nbPlayers == 2 {
            return playersArray2players[component][row]
        } else{
            return playersArray1player[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if nbPlayers == 2 {
            return playersArray2players[component].count
        } else{
            return playersArray1player.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if nbPlayers == 2 {
            switch (component) {
            case 0:
                player1 = playersArray2players[component][row]
            case 1:
                player2 = playersArray2players[component][row]
            default:
                break
            }
        } else{
            player1 = playersArray1player[row]
        }
        display()
    }

    // Display All Changes
    func display(){
        ui_startGame.isHidden = player1 == "Player 1" || player2 == "Player 2"
        label.text = player1
        label2.text = player2
        // Refrech Players List
        self.pickerPlayer1.reloadAllComponents()

    }
    
}


