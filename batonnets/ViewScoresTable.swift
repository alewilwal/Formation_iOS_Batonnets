//
//  ViewScoresTable.swift
//  batonnets
//
//  Created by imac on 18/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit

class ViewScoresTable: UITableViewController {
    
    var _playersArray:[String:Int] = [:]
    var scoresTable:[Int]?
    var namesTable:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _playersArray = SettingsManager.instance.getPlayerArray()
        namesTable = [String](_playersArray.keys)
        scoresTable = [Int](_playersArray.values)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return _playersArray.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "player-score", for: indexPath)

        // Configure the cell...

        print("TableView : \(_playersArray)")
        cell.textLabel?.text = namesTable?[indexPath.row]
        if let scoresTableExtract = scoresTable {
            cell.detailTextLabel?.text = "Score : \(scoresTableExtract[indexPath.row])"
        }
        
        return cell
    }
  

}
