//
//  AllPlayersTableViewController.swift
//  cricscorerios
//
//  Created by TemasekJC on 7/11/19.
//  Copyright © 2019 ctssstudent. All rights reserved.
//

import UIKit

class AllPlayersTableViewController: UITableViewController {
    
    var match:Match?
    
    var cellsBySection: [[PlayerTableViewCell]] = [[], []]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return match!.team1
        } else if section == 1 {
            return match!.team2
        }
        
        return "Start"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 2 {
            return 1
        } else {
            return match!.numberPlayers
        }
    }

    @IBAction func onStart(_ sender: Any) {
        for i in 0...cellsBySection.count - 1 {
            let cells = cellsBySection[i]
            for cell in cells {
                if cell.textBox.text == "" {
                    let alert = UIAlertController(title: "Missing or invalid input!", message: "One or more fields are either missing or invalid.", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                } else {
                    let name = cell.textBox.text!;
                    if i == 0 {
                        match?.team1players.append(name)
                    } else if i == 1 {
                        match?.team2players.append(name)
                    }
                }
            }
        }
        print(match)
        performSegue(withIdentifier: "stateOpeningPlayers", sender: self)
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section != 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! PlayerTableViewCell
            cell.titleLabel!.text = "Player \(indexPath.row + 1)";
            
            cellsBySection[indexPath.section].append(cell);
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath)
            return cell
        }

        // Configure the cell...
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "stateOpeningPlayers" {
            let dest = segue.destination as! OpeningPlayersTableViewController
            dest.match = match;
        }
    }
    

}
