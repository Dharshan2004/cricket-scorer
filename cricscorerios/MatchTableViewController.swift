//
//  MatchTableViewController.swift
//  cricscorerios
//
//  Created by ctssstudent on 02/11/2019.
//  Copyright © 2019 ctssstudent. All rights reserved.
//

import UIKit

class MatchTableViewController: UITableViewController {

    @IBOutlet weak var Hostteam: UITextField!
    @IBOutlet weak var Visitorteam: UITextField!
    @IBOutlet weak var Toss: UISegmentedControl!
    @IBOutlet weak var Opted: UISegmentedControl!
    @IBOutlet weak var numberoversField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var numberplayersField: UITextField!
    
    var match: Match?
    
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
        return 6
    }
    
    @IBAction func startMatch(_ sender: Any) {
        if Hostteam.text == "" || Visitorteam.text == "" || numberplayersField.text == "" || numberoversField.text == "" || Int(numberoversField.text!) == nil || Int(numberplayersField.text!) == nil || Int(numberplayersField.text!)! > 11 || Int(numberplayersField.text! )! < 1 || Int(numberoversField.text!)! < 0 {
            let alert = UIAlertController(title: "Missing or invalid input!", message: "One or more fields are either missing or invalid.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        } else {
            let toss = Toss.selectedSegmentIndex
            let opted = Opted.selectedSegmentIndex
            var team1 = ""
            var team2 = ""
            
            if toss == 0 && opted == 0 {
                team1 = Hostteam.text ?? "Host"
                team2 = Visitorteam.text ?? "Vistor"
            }
            
            else if toss == 0 && opted == 1 {
                team1 = Visitorteam.text ?? "Vistor"
                team2 = Hostteam.text ?? "Host"
            }
            else if toss == 1 && opted == 0 {
                team1 = Visitorteam.text ?? "Vistor"
                team2 = Hostteam.text ?? "Host"
            }
            
            else if toss == 1 && opted == 1 {
                team2 = Visitorteam.text ?? "Vistor"
                team1 = Hostteam.text ?? "Host"
            }
            match = Match(numberOfOvers: Int(numberoversField.text!)!, team1: team1, team2: team2, numberPlayers: Int(numberplayersField.text!)!, team1Score: 0, team2Score: 0, winners: "", team1players:[], team2players: [] )
            performSegue(withIdentifier: "startMatch", sender: self);
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rows = 0
        if (section == 0){
            rows = 2
        }
        else if (section > 6) {
            rows = 0
        }
        else {
            rows = 1
        }
        return rows
    }
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
        if segue.identifier == "startMatch" {
            let destination = segue.destination as! AllPlayersTableViewController;
            destination.match = match;
        }
    }
    

}
