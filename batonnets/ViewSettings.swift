//
//  ViewSettings.swift
//  batonnets
//
//  Created by imac on 14/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit

class ViewSettings: UIViewController {

    
    @IBOutlet weak var ui_setMatchesCountLabel: UILabel!
    @IBOutlet weak var ui_setMatchesCountSlider: UISlider!
    
    let step: Float = 5
    let userDefaultsManager:UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Load UserDefaults Number of Matches
    override func viewWillAppear(_ animated: Bool) {
        ui_setMatchesCountSlider.value = Float(userDefaultsManager.integer(forKey: Settings.MATCHES_KEY))
        ui_setMatchesCountLabel.text = "\(Int(ui_setMatchesCountSlider.value))"
    }
    
    // Save UserDefaults Number of Matches
    override func viewWillDisappear(_ animated: Bool) {
        userDefaultsManager.set(ui_setMatchesCountLabel.text, forKey: Settings.MATCHES_KEY)
    }

    // Change Number of Matches when slider changed
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        ui_setMatchesCountLabel.text = "\(Int(roundedValue))"

    }
    
    // Reset Data
    @IBAction func reinitializationData() {
        let playersArray:[String:Int] = [:]
        userDefaultsManager.set(playersArray, forKey: Player.PLAYER_KEY)
        userDefaultsManager.set("20", forKey: Settings.MATCHES_KEY)
        print("Deleted")
    }
    
    // Hide View
    @IBAction func hideSettingsButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    


}
