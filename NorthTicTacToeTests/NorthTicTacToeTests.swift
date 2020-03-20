//
//  NorthTicTacToeTests.swift
//  NorthTicTacToeTests
//
//  Created by Mshiozaki on 2020-03-19.
//  Copyright © 2020 Michael Shiozaki. All rights reserved.
//

import XCTest
@testable import NorthTicTacToe

class NorthTicTacToeTests: XCTestCase {
    var sut = GameState()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = GameState()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGameIsReset() {
        // tests if the game properly resets
        // given
        sut.boardState = [1,2,1,0,1,0,1,2,2]
        sut.gameCode = .playerTwoWon
        sut.turnsLeft = 1
        
        // when
        _ = sut.resetGame()
        
        // then
        XCTAssertTrue(sut.boardState == [0, 0, 0, 0, 0, 0, 0, 0, 0], "Boardstate not reset")
        XCTAssertTrue(sut.gameCode == .ongoing, "Gamecode not reset")
        XCTAssertTrue(sut.turnsLeft == 9, "Turns left is not reset")
    }
    
    func testTileTappedActionAllowed() {
        // tests if the tapped button changes the board correctly
        // given
        sut.boardState = [1,0,0,0,0,0,0,0,0]
        sut.gameCode = .ongoing
        sut.player1Turn = false
        
        // when
        let dummy = sut.gameAction(tile: 1)
        
        // then
        XCTAssertTrue(sut.boardState == [1,2,0,0,0,0,0,0,0], "Board state does not match button pressed")
        XCTAssertTrue(sut.player1Turn, "Player turn did not switch")
        XCTAssertTrue(dummy.allowPlace, "Tile cannot be changed")
    }
    
    func testTileAlreadyTapped() {
        // tests if a tile does not change 
        // given
        sut.boardState = [1,1,2,2,0,0,0,0,0]
        sut.player1Turn = true
        sut.gameCode = .ongoing
        
        // when
        sut.gameAction(tile: 1)
        
        // then
        XCTAssertTrue(sut.boardState == [1,1,2,2,0,0,0,0,0], "Board state changed")
        XCTAssertFalse(sut.allowPlace, "Tile could be changed")
        XCTAssertTrue(sut.player1Turn, "Player turn switched")
    }
    
    func testTileTapAfterGameOver() {
        // given
        sut.boardState = [1,2,2,1,0,0,1,0,0]
        sut.gameCode = .playerOneWon
        sut.player1Wins = 1
        sut.player1Turn = false
        
        // when
        sut.gameAction(tile: 1)
        
        // then
        XCTAssertTrue(sut.boardState == [1,2,2,1,0,0,1,0,0], "Board state changed")
        XCTAssertFalse(sut.allowPlace, "Tile could be changed")
        XCTAssertFalse(sut.player1Turn, "Player turn switched")
        XCTAssertTrue(sut.player1Wins == 1, "Player wins did not change")
        
        
    }
    
    func testPlayer2Wins() {
        // given
        sut.boardState = [1,2,0,1,2,0,0,2,1]
        sut.player2Wins = 1
        
        // when
        sut.checkBoardState()
        
        // then
        XCTAssertTrue(sut.gameCode == .playerTwoWon, "Gamecode did not register player 2 win")
        XCTAssertTrue(sut.player2Wins == 2, "Gamecode did not register player 2 win")
        
    }
    
    func testGameStateDraw() {
        // given
        sut.boardState = [0,2,1,1,2,1,2,1,2]
        sut.turnsLeft = 1
        sut.player1Turn = true
        sut.player1Wins = 1
        sut.player2Wins = 0
        
        // when
        sut.gameAction(tile: 0)
        sut.checkBoardState()
        
        // then
        XCTAssertTrue(sut.gameCode == .draw, "Gamecode is not a draw")
        XCTAssertTrue(sut.player1Wins == 1, "Player 1 wins changed")
        XCTAssertTrue(sut.player2Wins == 0, "Player 2 wins changed")
        XCTAssertTrue(sut.turnsLeft == 0, "There are apparently more turns than board spaces")
        
    }
    

}
