//
//  File.swift
//  cricscorerios
//
//  Created by TemasekJC on 7/11/19.
//  Copyright © 2019 ctssstudent. All rights reserved.
//

import Foundation

class Batsmen {
    var name: String
    var r: Int
    var b: Int
    var fours: Int
    var sixes: Int
    var sr: Double
    
    init(name:String, r:Int, b:Int, fours:Int, sixes: Int, sr:Double) {
        self.name = name
        self.r = r
        self.b = b
        self.fours = fours
        self.sixes = sixes
        self.sr = sr
    }
}

class Bowler {
    var name: String
    var r: Int
    var b: Int
    var m: Int
    var w: Int
    var er: Double
    
    init(name:String, r:Int, b:Int, m:Int, w:Int, er:Double) {
        self.name = name
        self.r = r
        self.b = b
        self.m = m
        self.w = w
        self.er = er
    }
}

struct Over {
    // fill in each bowler for each over
    // fill in each batsmen
    var bowler: Bowler
    var runs: Int
    var wickets: Int
    
}

class Match {
    var numberOfOvers: Int
    //var overs: [Over] // bowlers for each over
    var team1: String
    var team2: String
    var numberPlayers: Int
    var team1Score: Int
    var team2Score: Int
    var winners: String
    var team1players: [String]
    var team2players: [String]
    
    init(team1:String, team2:String, numberPlayers:Int, team1Score: Int, team2Score: Int, numberofOvers:Int, winners: String, team1Players: [String], team2Players: [String]) {
        self.team1 = team1
        self.team2 = team2
        self.numberPlayers = numberPlayers
        self.numberOfOvers = numberofOvers
        self.team1Score = team1Score
        self.team2Score = team2Score
        self.winners = winners
        self.team1players = team1Players
        self.team2players = team2Players
        
    }
}
