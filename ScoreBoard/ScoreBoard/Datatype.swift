//
//  Datatype.swift
//  ScoreBoard
//
//  Created by Li Ju on 2018-08-02.
//  Copyright © 2018 Li Ju. All rights reserved.
//

import Foundation

enum BoardStyle : Int {
    case List = 0
    case Pie = 1
    case Block = 2
    case Donut = 3
}

struct Player {
    var id : Int
    var name : String
    var score : Int
    
    static var currId = 0
    
    static func getUniqueId() -> Int {
        currId += 1
        return currId
    }
    
    init() {
        self.id = Player.getUniqueId()
        self.name = "Player \(self.id)"
        self.score = 0
    }
}

class board {
    var boardStyle : BoardStyle
    var players = [Player]()
    
    init(playerNum : Int, boardStyle : BoardStyle) {
        self.boardStyle = boardStyle
        for _ in 1...playerNum {
            let player = Player()
            players += [player, player]
        }
    }
}
