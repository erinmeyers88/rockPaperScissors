//
//  GameState.swift
//  RockPaperScissors
//
//  Created by Erin Vincent on 10/5/18.
//  Copyright © 2018 Erin Vincent. All rights reserved.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    var text: String {
        switch self {
        case .start:
            return "Start"
        case .win:
            return "You win!"
        case .lose:
            return "You lose"
        case .draw:
            return "It's a draw"
        }
    }
}
