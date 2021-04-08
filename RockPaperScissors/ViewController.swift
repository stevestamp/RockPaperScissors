//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Stephen Stamp on 4/8/21.
//

import UIKit

class ViewController: UIViewController {
//MARK: - IB OUTLETS
    
    @IBOutlet weak var opponentLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(forState: .start)
    }

    //MARK: - IB ACTIONS
    
    @IBAction func rockChosenButton(_ sender: Any) {
        player(userSign: .rock)
    }
    
    @IBAction func paperButtonChosen(_ sender: Any) {
        player(userSign: .paper)
    }
    
    @IBAction func scissorButtonChosen(_ sender: Any) {
        player(userSign: .scissors)
    }
    
    
    @IBAction func playAgainButton(_ sender: Any) {
        updateUI(forState: .start)
    }
    
    //MARK: - HELPER METHODS
    
    func updateUI(forState state: GameState) {
        statusLabel.text = state.status
        switch state {
        case .start:
            view.backgroundColor = .lightGray
            
            opponentLabel.text = "👾"
            playAgainButton.isHidden = true
            
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorButton.isHidden = false
            
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorButton.isEnabled = true
            
        case .win:
            view.backgroundColor = UIColor(red: 0.651, green: 0.792, blue: 0.651, alpha: 1)
        case .lose:
            view.backgroundColor = UIColor(red: 0.851, green: 0.424, blue: 0.412, alpha: 1)
        case .tie:
            view.backgroundColor = UIColor(red: 0.663, green: 0.663, blue: 0.663, alpha: 1)
        }
    }
    //Method to handle player choices
    func player(userSign: Sign) {
        let computerSign = randomSign()
        
        let gameState = userSign.gameState(against: computerSign)
        updateUI(forState: gameState)
        
        opponentLabel.text = computerSign.emoji
        
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorButton.isHidden = true
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorButton.isEnabled = false
        
        switch userSign {
        case .rock:
            rockButton.isHidden = false
        case .paper:
            paperButton.isHidden = false
        case .scissors:
            scissorButton.isHidden = false
        }
        playAgainButton.isHidden = false
    }
    
}

