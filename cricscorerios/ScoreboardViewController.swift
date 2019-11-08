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
    @IBOutlet weak var RRR: UILabel!
    
    var batsmen1: Batsmen!
    var batsmen2: Batsmen!
    var bowler: Bowler!
    var match: Match!
    var onStrike: Int = 1
    var ballsBowled = 0
    var prevBall = ""
    var numRun = -1
    var battingTeam = "team1"
    var overHistory:[String]! = [] 
    var overCount: Int = 0
    var innings: Int!
    var bowlers:[String:Bowler]! = [:]
    var batsmenList:[String:Batsmen]! = [:]
    var batsmen: Batsmen!
    var batsmenNon: Batsmen!
    var target: Int!
    var overIsUp: Bool! = false
    var wicketDown: Bool! = false
    var previousBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if innings == 1 {
            self.RRR.text = ""
            self.rrrLabel.text = ""
            self.strikerLabel.text = "\(batsmen1.name)"
            self.nonStrikerLabel.text = "\(batsmen2.name)"
            self.bowlerLabel.text = "\(bowler.name)"
        }
        else {
            self.RRR.text = "RRR:"
            self.rrrLabel.text = "\(Double(match.team1Score + 1)/Double(match.numberOfOvers))"
            self.strikerLabel.text = "\(batsmen1.name)"
            self.nonStrikerLabel.text = "\(batsmen2.name)"
            self.bowlerLabel.text = "\(bowler.name)"
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonHandler(sender: UIButton) {
        previousBtn = sender
        batsmen = getBatsmen(strikepos: onStrike)
        batsmenNon = getNonBatsmen(strikepos: onStrike)
        
        switch sender
        {
        case sixButton:
            if battingTeam == "team1"{
                match.team1Score += 6
                ballsBowled += 1
                updateBatsmenStats(batsman: batsmen, runs: 6, extra: false)
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                numRun = 6
                bowler.b += 1
                bowler.r += 6
                overHistory.append("6")
            }
            else {
                match.team2Score += 6
                ballsBowled += 1
                updateBatsmenStats(batsman: batsmen, runs: 6, extra: false)
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                numRun = 6
                overHistory.append("6")
                bowler.b += 1
                bowler.r += 6
            }
        case fourButton:
            if battingTeam == "team1"{
                match.team1Score += 4
                ballsBowled += 1
                updateBatsmenStats(batsman: batsmen, runs: 4, extra: false)
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                numRun = 4
                overHistory.append("4")
                bowler.b += 1
                bowler.r += 4
            }
            else {
                match.team2Score += 4
                ballsBowled += 1
                updateBatsmenStats(batsman: batsmen, runs: 4, extra: false)
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                numRun = 4
                overHistory.append("4")
                bowler.b += 1
                bowler.r += 4
            }
        case twoButton:
            if battingTeam == "team1"{
                match.team1Score += 2
                ballsBowled += 1
                updateBatsmenStats(batsman: batsmen, runs: 2, extra: false)
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                numRun = 2
                overHistory.append("2")
                bowler.b += 1
                bowler.r += 2
            }
            else {
                match.team2Score += 2
                ballsBowled += 1
                updateBatsmenStats(batsman: batsmen, runs: 2, extra: false)
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                numRun = 2
                overHistory.append("2")
                bowler.b += 1
                bowler.r += 2
            }
        case zeroButton:
            if battingTeam == "team1"{
                match.team1Score += 0
                ballsBowled += 1
                updateBatsmenStats(batsman: batsmen, runs: 0, extra: false)
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                numRun = 0
                overHistory.append("0")
                bowler.b += 1
                bowler.r += 0
            }
            else {
                match.team2Score += 0
                ballsBowled += 1
                updateBatsmenStats(batsman: batsmen, runs: 0, extra: false)
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                numRun = 0
                overHistory.append("0")
                bowler.b += 1
                bowler.r += 0
            }
        case fiveButton:
            if battingTeam == "team1"{
                match.team1Score += 5
                ballsBowled += 1
                onStrike = swapStrike(Strike: onStrike)
                updateBatsmenStats(batsman: batsmen, runs: 6, extra: false)
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                numRun = 5
                overHistory.append("5")
                bowler.b += 1
                bowler.r += 5
            }
            else {
                match.team2Score += 5
                ballsBowled += 1
                onStrike = swapStrike(Strike: onStrike)
                updateBatsmenStats(batsman: batsmen, runs: 5, extra: false)
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                numRun = 5
                overHistory.append("5")
                bowler.b += 1
                bowler.r += 5
            }
        case threeButton:
            if battingTeam == "team1"{
                match.team1Score += 3
                ballsBowled += 1
                onStrike = swapStrike(Strike: onStrike)
                updateBatsmenStats(batsman: batsmen, runs: 3, extra: false)
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                numRun = 3
                overHistory.append("3")
                bowler.b += 1
                bowler.r += 3
            }
            else {
                match.team2Score += 3
                ballsBowled += 1
                onStrike = swapStrike(Strike: onStrike)
                updateBatsmenStats(batsman: batsmen, runs: 3, extra: false)
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                numRun = 3
                overHistory.append("3")
                bowler.b += 1
                bowler.r += 3
            }
        case oneButton:
            if battingTeam == "team1"{
                match.team1Score += 1
                ballsBowled += 1
                onStrike = swapStrike(Strike: onStrike)
                updateBatsmenStats(batsman: batsmen, runs: 1, extra: false)
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                numRun = 1
                overHistory.append("1")
                bowler.b += 1
                bowler.r += 1
            }
            else {
                match.team2Score += 1
                ballsBowled += 1
                onStrike = swapStrike(Strike: onStrike)
                updateBatsmenStats(batsman: batsmen, runs: 1, extra: false)
                numRun = 1
                overHistory.append("1")
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                bowler.b += 1
                bowler.r += 1
            }
        case wdButton:
            if battingTeam == "team1"{
                match.team1Score += 1
                ballsBowled -= 1
                overHistory.append("wd")
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                if numRun%2 == 0 {
                    batsmen.r -= numRun
                }
                else {
                    batsmenNon.r -= numRun
                }
                bowler.r += 1
            }
            else {
                match.team2Score += 1
                ballsBowled -= 1
                overHistory.append("wd")
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                bowler.r += 1
                if numRun%2 == 0 {
                    batsmen.r -= numRun
                }
                else {
                    batsmenNon.r -= numRun
                }
            }
        case wButton:
            if innings == 1 {
                overHistory.append("w")
                bowler.w += 1
                
            }
            else {
                overHistory.append("w")
                bowler.w += 1
            }
            
            
        case nbButton:
            if numRun != -1 {
                if battingTeam == "team1"{
                    match.team1Score -= 1
                    ballsBowled -= 1
                    overHistory.append("nb")
                    bowler.r += 1
                    refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                   
                }
                else {
                    match.team2Score += 1
                    ballsBowled -= 1
                    overHistory.append("nb")
                    bowler.r += 1
                    refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                }
            }
            
            else {
                let alert = UIAlertController(title: "Button cannot be used", message: "This button cannot be used until a runs button has been pressed", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
            
        case lbButton:
            if numRun != -1 {
                if battingTeam == "team1"{
                    match.team1Score += 0
                    ballsBowled += 0
                    overHistory.append("lb")
                    refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                    if numRun%2 == 0 {
                        batsmen.r -= numRun
                    }
                    else {
                        batsmenNon.r -= numRun
                    }
                }
                else {
                    match.team2Score += 0
                    ballsBowled += 0
                    overHistory.append("lb")
                    refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                    if numRun%2 == 0 {
                        batsmen.r -= numRun
                    }
                    else {
                        batsmenNon.r -= numRun
                    }
                }
            }
            else {
                let alert = UIAlertController(title: "Button cannot be used", message: "This button cannot be used until a runs button has been pressed", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        case bButton:
            if numRun != -1 {
                if battingTeam == "team1"{
                    match.team1Score += 0
                    ballsBowled += 0
                    overHistory.append("b")
                    refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                    if numRun%2 == 0 {
                        batsmen.r -= numRun
                    }
                    else {
                        batsmenNon.r -= numRun
                    }
                }
                else {
                    match.team2Score += 0
                    ballsBowled += 0
                    overHistory.append("b")
                    refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                    if numRun%2 == 0 {
                        batsmen.r -= numRun
                    }
                    else {
                        batsmenNon.r -= numRun
                    }
                }
            }
            else {
                let alert = UIAlertController(title: "Button cannot be used", message: "This button cannot be used until a runs button has been pressed", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        case sevenButton:
            if battingTeam == "team1"{
                match.team1Score += 7
                ballsBowled += 1
                onStrike = swapStrike(Strike: onStrike)
                updateBatsmenStats(batsman: batsmen, runs: 7, extra: false)
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                numRun = 7
                overHistory.append("7")
                bowler.b += 1
                bowler.r += 7
            }
            else {
                match.team2Score += 7
                ballsBowled += 1
                onStrike = swapStrike(Strike: onStrike)
                updateBatsmenStats(batsman: batsmen, runs: 7, extra: false)
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                numRun = 7
                overHistory.append("7")
                bowler.b += 1
                bowler.r += 7
            }
        case eightButton:
            if battingTeam == "team1"{
                match.team1Score += 8
                ballsBowled += 1
                updateBatsmenStats(batsman: batsmen, runs: 8, extra: false)
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                numRun = 8
                overHistory.append("8")
                bowler.b += 1
                bowler.r += 8
            }
            else {
                match.team2Score += 8
                ballsBowled += 1
                updateBatsmenStats(batsman: batsmen, runs: 8, extra: false)
                refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
                numRun = 8
                overHistory.append("8")
                bowler.b += 1
                bowler.r += 8
            }
        case undoButton:
            print("undo")
        default:
            print("unknown")
        }
        
        if ballsBowled == 6 {
            let alert = UIAlertController(title: "Over is up", message: "6 balls have been bowled and has any of this happened", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Wd", style: .default, handler: { (alert) in
                self.wd6ball(batsmen1: self.batsmen, batsmen2: self.batsmenNon, bowler: self.bowler, match: self.match)
            }))
            alert.addAction(UIAlertAction(title: "NB", style: .default, handler: { (alert) in
                self.nb6ball(batsmen1: self.batsmen, batsmen2: self.batsmenNon, bowler: self.bowler, match: self.match)
            }))
            alert.addAction(UIAlertAction(title: "W+Wd", style: .default, handler: { (alert) in
                
            } ))
            
            alert.addAction(UIAlertAction(title: "None", style: .default, handler: { (alert) in
                self.performSegue(withIdentifier: "overUp", sender: self)
            }))
            self.present(alert, animated: true)
        }
        
    }
    @IBAction func backPressed(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func swapStrike(Strike:Int) -> Int {
        var strike = Strike
        if strike == 1 {
            strike = 2
            return strike
        }
        else if strike == 2 {
            strike = 1
            return strike
        }
        else {
            print("u r gay")
            return Strike
        }
    }
    
    func getBatsmen(strikepos:Int) -> Batsmen{
        var batsman:Batsmen!
        if strikepos == 1 {
            batsman = batsmen1
        }
        else if strikepos == 2 {
            batsman = batsmen2
        }
        return batsman
    }
    
    func getNonBatsmen(strikepos:Int) -> Batsmen{
        var batsman:Batsmen!
        if strikepos == 1 {
            batsman = batsmen1
        }
        else if strikepos == 2 {
            batsman = batsmen2
        }
        return batsman
    }
    
    
    func nb6ball (batsmen1:Batsmen, batsmen2:Batsmen, bowler:Bowler, match:Match) {
        if battingTeam == "team1"{
            match.team1Score -= 1
            ballsBowled -= 1
            overHistory.append("nb")
            bowler.r += 1
            refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
            
        }
        else {
            match.team2Score += 1
            ballsBowled -= 1
            overHistory.append("nb")
            bowler.r += 1
            refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
        }
    }
    
    func updateBatsmenStats(batsman:Batsmen, runs: Int, extra: Bool) {
        var bats = batsman
        if runs >= 4 && runs <= 5  {
            bats.r += runs
            bats.fours += 1
        }
        else if runs >= 6 {
            bats.r  += runs
            bats.sixes += 1
        }
        else {
            bats.r += runs
        }
        if !extra {
            bats.b += 1
        }
        bats.sr = Double((bats.r/bats.b)*100)
    }
    
    func wd6ball(batsmen1:Batsmen, batsmen2:Batsmen, bowler:Bowler, match:Match) {
        if battingTeam == "team1"{
            match.team1Score += 1
            ballsBowled -= 1
            overHistory.append("wd")
            refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
        if numRun%2 == 0 {
            batsmen1.r -= numRun
        }
        else {
            batsmen2.r -= numRun
        }
        bowler.r += 1
    }
        else {
            match.team2Score += 1
            ballsBowled -= 1
            overHistory.append("wd")
            refreshPage(batsmen1: batsmen1, batsmen2: batsmen2, bowler: bowler, match: match)
            bowler.r += 1
            if numRun%2 == 0 {
                batsmen1.r -= numRun
            }
            else {
                batsmen2.r -= numRun
            }
        }
        
    }
    
    func refreshPage(batsmen1: Batsmen, batsmen2:Batsmen, bowler:Bowler, match:Match) {
        if innings == 1 {
            self.scoreLabel.text = "\(match.team1Score)"
            self.crrLabel.text = "\(String(format:"%.2f", Double(match.team1Score)/Double(overCount)))"
        }
        else {
            self.scoreLabel.text = "\(match.team2Score)"
            self.crrLabel.text = "\(String(format:"%.2f", Double(match.team1Score)/Double(overCount)))"
            self.rrrLabel.text = "\(String(format:"%.2f", Double(target-match.team2Score)/Double(overCount)))"
        }
        self.strikerScoreLabel.text = "\(batsmen1.r)"
        self.strikerBallLabel.text = "\(batsmen1.b)"
        self.striker4countLabel.text = "\(batsmen1.fours)"
        self.striker6Label.text = "\(batsmen1.sixes)"
        self.strikerSRLabel.text = "\(String(format: "%2f", (Double(batsmen1.r)/Double(batsmen1.b)*100.0)))"
        
        self.nonStrikerScoreLabel.text = "\(batsmen2.r)"
        self.nonStrikerBallLabel.text = "\(batsmen2.b)"
        self.nonStriker4Label.text = "\(batsmen2.fours)"
        self.nonStriker6Label.text = "\(batsmen2.sixes)"
        self.nonStrikerSRLabel.text = "\(String(format: "%2f", (Double(batsmen2.r)/Double(batsmen2.b)*100.0)))"
        self.bowlerRunsLabel.text = "\(bowler.r)"
        self.ballsBowledLabel.text = "\(bowler.b)"
        self.bowlerMaidenLabel.text = "\(bowler.m)"
        self.bowlerWicketLabel.text = "\(bowler.w)"
        self.bowlerERLabel.text = "\(String(format:"%2f", (Double(bowler.r)/(Double(bowler.b)/6.0))))"
    }
}
