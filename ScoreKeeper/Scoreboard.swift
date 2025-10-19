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
    var doesHighestScoreWin = true
    var winningPoint = 10
    
    var players: [Player] = [
        Player(name: "Elisha", score: 0),
        Player(name: "Andre", score: 0),
        Player(name: "Jasmine", score: 0)
    ]
    
    var winners: [Player] {
        guard state == .gameOver else { return [] }
        
        var winningScore = 0
        if doesHighestScoreWin {
            winningScore = Int.min
            for player in players {
                winningScore = max(player.score, winningScore)
            }
        } else {
            winningScore = Int.max
            for player in players {
                winningScore = min(player.score, winningScore)
            }
        }
        
        /// This filer(_:) method is an example of functional programming.
        return players.filter { $0.score == winningScore }
    }
        
    mutating func resetScores(to newValue: Int) {
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}
