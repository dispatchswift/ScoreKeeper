//
//  Scoreboard.swift
//  ScoreKeeper
//
//  Created by Amari Duran on 10/17/25.
//

import Foundation

// Models the logic, keeping track of players, their scores, and the current state of the game.
struct Scoreboard {
    var state: GameState = .setup
    
    var players: [Player] = [
        Player(name: "Elisha", score: 0),
        Player(name: "Andre", score: 0),
        Player(name: "Jasmine", score: 0)
    ]
    
    mutating func resetScores(to newValue: Int) {
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}
