//
//  GameState.swift
//  RockPaperScissors
//
//  Created by Stephen Stamp on 4/8/21.
//

import Foundation

enum GameState {
    case start, win, lose, tie
    
    var status: String {
        switch self {
        case .start:
            return "The game has begun"
        case .win:
            return "You won!"
        case .lose:
            return "Sorry, you lost"
        case .tie:
            return "The round is a tie"
        }
    }
}
