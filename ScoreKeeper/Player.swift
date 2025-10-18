//
//  Player.swift
//  ScoreKeeper
//
//  Created by Amari Duran on 10/17/25.
//

import Foundation

struct Player: Identifiable {
    let id = UUID()
    var name: String
    var score: Int
}
