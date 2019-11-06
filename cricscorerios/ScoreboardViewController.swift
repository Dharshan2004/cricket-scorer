//
//  ScoreboardViewController.swift
//  cricscorerios
//
//  Created by TemasekJC on 4/11/19.
//  Copyright © 2019 ctssstudent. All rights reserved.
//

import UIKit

class ScoreboardViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var strikerLabel: UILabel!
    @IBOutlet weak var nonStrikerLabel: UILabel!
    @IBOutlet weak var bowlerLabel: UILabel!
    @IBOutlet weak var crrLabel: UILabel!
    @IBOutlet weak var strikerScoreLabel: UILabel!
    @IBOutlet weak var nonStrikerScoreLabel: UILabel!
    @IBOutlet weak var bowlerRunsLabel: UILabel!
    @IBOutlet weak var striker4countLabel: UILabel!
    @IBOutlet weak var nonStriker4Label: UILabel!
    @IBOutlet weak var bowlerMaidenLabel: UILabel!
    @IBOutlet weak var strikerBallLabel: UILabel!
    @IBOutlet weak var nonStrikerBallLabel: UILabel!
    @IBOutlet weak var ballsBowledLabel: UILabel!
    @IBOutlet weak var rrrLabel: UILabel!
    @IBOutlet weak var striker6Label: UILabel!
    @IBOutlet weak var nonStriker6Label: UILabel!
    @IBOutlet weak var bowlerWicketLabel: UILabel!
    @IBOutlet weak var strikerSRLabel: UILabel!
    @IBOutlet weak var nonStrikerSRLabel: UILabel!
    @IBOutlet weak var bowlerERLabel: UILabel!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var wdButton: UIButton!
    @IBOutlet weak var wButton: UIButton!
    @IBOutlet weak var nbButton: UIButton!
    @IBOutlet weak var lbButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var undoButton: UIButton!
    @IBOutlet weak var ballsLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonHandler(sender: UIButton) {
        switch sender
        {
        case sixButton:
            print("6")
        case fourButton:
            print("4")
        case twoButton:
            print("2")
        case zeroButton:
            print("0")
        case fiveButton:
            print("5")
        case threeButton:
            print("3")
        case oneButton:
            print("1")
        case wdButton:
            print("wd")
        case wButton:
            print("W")
        case nbButton:
            print("NB")
        case lbButton:
            print("LB")
        case bButton:
            print("B")
        case sevenButton:
            print("7")
        case eightButton:
            print("8")
        case undoButton:
            print("undo")
        default:
            print("unknown")
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
