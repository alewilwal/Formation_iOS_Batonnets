//
//  ViewPlayers.swift
//  batonnets
//
//  Created by imac on 14/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit

class ViewPlayers: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var ui_newPlayer: UITextField!
    @IBOutlet weak var ui_pickerPlayers: UIPickerView!

    var playersArray:[String:Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize Display
        ui_pickerPlayers.delegate = self
        ui_pickerPlayers.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // Load UserDefaults
    override func viewWillAppear(_ animated: Bool) {
        playersArray = SettingsManager.instance.getPlayerArray()
    
    }
    
    
    // Add New Player
    @IBAction func ui_btnAddNewPlayer() {
        let newPlayer:String! = ui_newPlayer.text
        if newPlayer != "" {
            playersArray[newPlayer] = 0
            SettingsManager.instance.setPlayerArray(playersArray: playersArray)
        }

        // Hide Focus
        ui_newPlayer.resignFirstResponder()
        
        // Refrech Players List
        self.ui_pickerPlayers.reloadAllComponents()
        
    }
    
    // Show Focus
    @IBAction func openKeyboard() {
        ui_newPlayer.becomeFirstResponder()
    }

    
    // Display Players list
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        return "\(Array(playersArray.keys)[row]) : \(Array(playersArray.values)[row])"
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return playersArray.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    // Hide View
    @IBAction func hiddenViewPlayers() {
        dismiss(animated: true, completion: nil)
    }

}
