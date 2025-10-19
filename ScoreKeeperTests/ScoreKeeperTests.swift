//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by Amari Duran on 10/16/25.
//

import Testing
@testable import ScoreKeeper

struct ScoreKeeperTests {

    @Test("Reset player scores", arguments: [0, 10, 20])
    func resetScores(to newValue: Int) async throws {
        var scoreboard = Scoreboard(players: [
            Player(name: "Elisha", score: 0),
            Player(name: "Andre", score: 5),
        ])
        scoreboard.resetScores(to: newValue)
        
        for player in scoreboard.players {
             #expect(player.score == newValue)
         }
    }
    
    @Test("Highest score wins")
    func highestScoreWins() {
        let scoreboard = Scoreboard(
            state: .gameOver,
            doesHighestScoreWin: true,
            players: [
                Player(name: "Elisha", score: 0),
                Player(name: "Andre", score: 4)
            ]
        )
        #expect(scoreboard.winners == [Player(name: "Andre", score: 4)])
    }
    
    @Test("Lowest score wins")
    func lowestScoreWins() {
        let scoreboard = Scoreboard(
            state: .gameOver,
            doesHighestScoreWin: false,
            players: [
                Player(name: "Elisha", score: 0),
                Player(name: "Andre", score: 4)
            ]
        )
        #expect(scoreboard.winners == [Player(name: "Elisha", score: 0)])
    }
    
    @Test("Tie Wins")
    func tieWins() {
        let scoreboard = Scoreboard(
            state: .gameOver,
            doesHighestScoreWin: true,
            players: [
                Player(name: "Elisha", score: 4),
                Player(name: "Andre", score: 4)
            ]
        )
        #expect(scoreboard.winners == [
            Player(name: "Elisha", score: 4),
            Player(name: "Andre", score: 4)
        ])
    }
}
