//
//  Student.swift
//  MyCreditManager
//
//  Created by 염성필 on 2023/04/22.
//

import Foundation

struct Student {
    var name: String
    var grade: [String:Score]
    var score: Double {
        var totalScore: Double = 0.0
        for i in grade {
            totalScore += i.value.rawValue
        }
        totalScore = totalScore/Double(grade.count)
        return totalScore
    }
}
