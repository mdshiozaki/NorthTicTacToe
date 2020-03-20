//
//  GameState.swift
//  NorthTicTacToe
//
//  Created by Mshiozaki on 2020-03-18.
//  Copyright © 2020 Michael Shiozaki. All rights reserved.
//
// *** 4x4 and 5x5 tictactoe were considered, but it would just show I can count a larger box and
// there wasn't much else to it other than a different set of combinations

import Foundation

class GameState {
    enum GameCode: Int {
        case ongoing
        case playerOneWon
        case playerTwoWon
        case draw
    }
    
    // Model for MVC, all game data, states and player wins are stored here
    
    var boardState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var turnsLeft = 9 // 0 when board is full
    var allowPlace = false
    
    var player1Turn = Bool.random() 
    var player1Wins = 0
    var player2Wins = 0
    var gameCode: GameCode = .ongoing // 0 = ongoing game 1 = p1 wins, 2 = p2 wins, 3 = draw
    
    func checkBoardState() -> (gameCode: GameCode, player1Wins: Int, player2Wins: Int){
        if gameCode == .ongoing {
            for combo in winningCombos {
                if boardState[combo[0]] != 0 && boardState[combo[0]] == boardState[combo[1]] && boardState[combo[1]] == boardState[combo[2]] {
                    
                    if boardState[combo[0]] == 1 {
                        player1Wins += 1
                        gameCode = .playerOneWon
                    }
                    else {
                        player2Wins += 1
                        gameCode = .playerTwoWon
                    }
                }
                if turnsLeft == 0 {
                    gameCode = .draw
                }
            }
        }
        return (gameCode, player1Wins, player2Wins)
    }

    func gameAction(tile: Int) -> (player1Turn: Bool, allowPlace: Bool) {
        allowPlace = false
        if boardState[tile] == 0 && gameCode == .ongoing {
            turnsLeft -= 1
            if (player1Turn == true) {
                boardState[tile] = 1
                player1Turn = false
            } else {
                boardState[tile] = 2
                player1Turn = true
            }
            allowPlace = true
        }
        return (player1Turn, allowPlace)
    }
    
    func resetGame() -> Bool {
        player1Turn = Bool.random()
        boardState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        turnsLeft = 9
        gameCode = .ongoing
        return player1Turn
    }
}
