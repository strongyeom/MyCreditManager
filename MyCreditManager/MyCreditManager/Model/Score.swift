//
//  Score.swift
//  MyCreditManager
//
//  Created by 염성필 on 2023/04/22.
//

import Foundation

enum Score: Double {
    case Ap = 4.5
    case A = 4.0
    case Bp = 3.5
    case B = 3.0
    case Cp = 2.5
    case C = 2.0
    case Dp = 1.5
    case D = 1.0
    case F = 0.0
    
    init?(grade: String) {
        switch grade {
        case "A+":
            self = .Ap
        case "A":
            self = .A
        case "B+":
            self = .Bp
        case "B":
            self = .B
        case "C+":
            self = .Cp
        case "C":
            self = .C
        case "D+":
            self = .Dp
        case "D":
            self = .D
        case "F":
            self = .F
            
        default:
            return nil
        }
    }
    
    func convertRawToString() -> String {
        switch self {
        case .Ap:
            return "A+"
        case .A:
            return "A"
        case .Bp:
            return "B+"
        case .B:
            return "B"
        case .Cp:
            return "C+"
        case .C:
            return "C"
        case .Dp:
            return "D+"
        case .D:
            return "D"
        case .F:
            return "F"
        }
    }
    
}

