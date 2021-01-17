//
//  PersonInfo.swift
//  TryYiTry
//
//  Created by huang on 2021/1/16.
//

import Foundation

class PersonInfo: ObservableObject{
    
    @Published var person:Person = Person(firstName: "Kobe", LasetName:"Bryant", score:33643);

    var displayText:String{
        return person.firstName + " " + person.LasetName + "总得分" + "\(person.score)"
    }
    
    func newScore(score: Int) {
        person.newScore(score: score)
    }
    
}
