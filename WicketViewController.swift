//
//  WicketViewController.swift
//  cricscorerios
//
//  Created by TemasekJC on 8/11/19.
//  Copyright © 2019 ctssstudent. All rights reserved.
//

import UIKit

class WicketViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let array = ["Bowled","Catch out","Run out striker", "Run out non-striker","Stumping", "LBW", "Hit wicket"]
    var batsmen1: Batsmen!
    var batsmen2: Batsmen!
    var strikepos: Int!
    var bowler: Bowler!
    var match: Match!
    var overUp: Bool!
    var winnerScreen: Bool!
    var batsmenList: [String:Batsmen]!
    var bowlers: [String:Bowler]!
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textfield2: UITextField!
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var wicketMethodPicker: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.wicketMethodPicker.dataSource = self
        self.wicketMethodPicker.delegate = self
        textfield1.isHidden = true
        label.isHidden = true
        if winnerScreen {
            textfield2.isHidden = true
        }
        // Do any additional setup after loading the view.
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 1 || row == 2 || row == 3 || row == 4 {
            if row == 2 || row == 3 {
                label.isHidden = false
                textfield1.isHidden = false
            } else {
                textfield1.isHidden = false
            }
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
