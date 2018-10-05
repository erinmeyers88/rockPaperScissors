//
//  Sign.swift
//  RockPaperScissors
//
//  Created by Erin Vincent on 10/5/18.
//  Copyright © 2018 Erin Vincent. All rights reserved.
//

import Foundation
import GameplayKit
let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "🖐"
        case .scissors:
            return "✌️"
        }
    }
    
    func getResult(playerSign: Sign) -> GameState {
        
        switch self {
            
        case .rock:
            switch playerSign {
            case .rock:
                return GameState.draw
            case .paper:
                return GameState.win
            case .scissors:
                return GameState.lose
            }
            
        case .paper:
            switch playerSign {
            case .rock:
                return GameState.lose
            case .paper:
                return GameState.draw
            case .scissors:
                return GameState.win
            }
            
        case .scissors:
            switch playerSign {
            case .rock:
                return GameState.win
            case .paper:
                return GameState.lose
            case .scissors:
                return GameState.draw
            }
            
        }
    }
    
}
