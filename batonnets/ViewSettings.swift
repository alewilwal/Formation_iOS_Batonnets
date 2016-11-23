//
//  ViewSettings.swift
//  batonnets
//
//  Created by imac on 14/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit

class ViewSettings: UIViewController {
    
    private var _game:Game?
    var game:Game? {
        get {
            return _game
        }
        set {
            _game = newValue
        }
    }
    
    @IBOutlet weak var ui_setMatchesCountLabel: UILabel!
    @IBOutlet weak var ui_setMatchesCountSlider: UISlider!
    
    let step: Float = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Load UserDefaults Number of Matches
    override func viewWillAppear(_ animated: Bool) {
        updateDisplay()
    }
    
    // Save UserDefaults Number of Matches
    @IBAction func saveInitialMatchesCount() {
        if let text = ui_setMatchesCountLabel.text,
            let count = Int(text),
            count > 0 {
            SettingsManager.instance.initialMatchesCount = count
        }
    }

    // Change Number of Matches when slider changed
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        ui_setMatchesCountLabel.text = "\(Int(roundedValue))"

    }
    
    // Update Display
    func updateDisplay(){
        ui_setMatchesCountSlider.value = Float(SettingsManager.instance.getInitialMatchesCount())
        ui_setMatchesCountLabel.text = "\(Int(ui_setMatchesCountSlider.value))"
    }
    
    // Reset Data
    @IBAction func reinitializationData() {
        let playersArray:[String:Int] = [:]
        SettingsManager.instance.setPlayerArray(playersArray: playersArray)
        SettingsManager.instance.saveInitialMatchesCount(newCount: 20)
        updateDisplay()
        print("Deleted")
    }
    


}
