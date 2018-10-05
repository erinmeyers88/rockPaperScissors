//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Erin Vincent on 10/5/18.
//  Copyright © 2018 Erin Vincent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentGameState = GameState.start
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(gameState: currentGameState)
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var appSignLabel: UILabel!
    
    @IBOutlet weak var gameStatusLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    
    @IBOutlet weak var paperButton: UIButton!
    
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func selectRock(_ sender: Any) {
        play(playerSign: .rock)
    }
    
    @IBAction func selectPaper(_ sender: Any) {
        play(playerSign: .paper)
    }
    
    @IBAction func selectScissors(_ sender: Any) {
        play(playerSign: .scissors)
    }
    
    @IBAction func selectPlayAgain(_ sender: Any) {
        updateUI(gameState: currentGameState)
    }
    
    func updateUI(gameState: GameState) {
        gameStatusLabel.text = gameState.text
        appSignLabel.text = "🤖"
        
        if gameState == .start {
            playAgainButton.isHidden = true
            rockButton.isHidden = false
            rockButton.isEnabled = true
            paperButton.isHidden = false
            paperButton.isEnabled = true
            scissorsButton.isHidden = false
            scissorsButton.isEnabled = true
            
        }
        switch gameState {
        case .lose:
            mainView.backgroundColor = UIColor.red
        case .win:
            mainView.backgroundColor = UIColor.green
        default:
            mainView.backgroundColor = UIColor.blue
        }
    }
    
    func play(playerSign: Sign) {
        let appSign = randomSign()
        
        let updatedGameState = appSign.getResult(playerSign: playerSign)
        
        updateUI(gameState: updatedGameState)
        
        appSignLabel.text = appSign.emoji
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        if playerSign == .rock {
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        }
        
        if playerSign == .paper {
            rockButton.isHidden = true
            scissorsButton.isHidden = true
        }
        
        if playerSign == .scissors {
            rockButton.isHidden = true
            paperButton.isHidden = true
        }
        
        playAgainButton.isHidden = false
    }
    
}

