//
//  ViewController.swift
//  NorthTicTacToe
//
//  Created by Mshiozaki on 2020-03-17.
//  Copyright © 2020 Michael Shiozaki. All rights reserved.
//

import UIKit
import AVFoundation

class TicTacToeViewController: UIViewController {
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var playerTurnLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet var gameButtons: [UIButton]!
    
    var tapEffect: AVAudioPlayer?
    var victorySound: AVAudioPlayer?
    
    let state = GameState()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let plopEffect = Bundle.main.path(forResource: "Plop", ofType: "mp3"),
        let victoryFanfare = Bundle.main.path(forResource: "FFVIIfanfare", ofType: "mp3")
        else { return }
        
        do {
            tapEffect = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: plopEffect))
            victorySound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: victoryFanfare))
        }
        catch{ print(error) }
    }
    
    @IBAction func gameTileTapped(_ sender: UIButton) {
        let actionResult = state.gameAction(tile: sender.tag-1)
        
        if actionResult.allowPlace {
            if actionResult.player1Turn {
                 sender.setImage(UIImage(named: "circle"), for: .normal)
             } else {
                sender.setImage(UIImage(named: "cross"), for: .normal)
            }
            tapEffect?.play()
            
            let boardState = state.checkBoardState()
            
            if boardState.gameCode == .playerOneWon {
                playerTurnLabel.text = "Player 1 Wins!"
                player1Label.text = "P1 Wins: \(boardState.player1Wins)"
                victorySound?.play()
            }
            else if boardState.gameCode == .playerTwoWon {
                playerTurnLabel.text = "Player 2 Wins!"
                player2Label.text = "P2 Wins: \(boardState.player2Wins)"
                victorySound?.play()
            }
            else if boardState.gameCode == .draw {
                playerTurnLabel.text = "It's a Draw!"
            }
            else {
                togglePlayerTurnText(turn: actionResult.player1Turn)
            }
        }
    }
    
    @IBAction func resetBoard(_ sender: UIButton) {
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
        // ***tried for better practice below but wasn't able to debug it correctly
//        for button in gameButtons {
//            button.setImage(nil, for: UIControl.State())
//        }
        togglePlayerTurnText(turn: state.resetGame())
    }
    
    func togglePlayerTurnText(turn: Bool) {
        // states player's turn at the bottom
        playerTurnLabel.text = "Player \(turn ? 1 : 2)'s Turn"
    }
}

