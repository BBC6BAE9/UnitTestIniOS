//
//  person.swift
//  TryYiTry
//
//  Created by huang on 2021/1/16.
//

import Foundation

struct Person {
    var firstName:String
    var LasetName:String
    var score: Int
    
    mutating func newScore(score: Int) {
        self.score += score
        print(self.score)
    }
    
}
