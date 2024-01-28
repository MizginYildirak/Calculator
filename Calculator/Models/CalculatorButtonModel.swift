//
//  CalculatorButtonModel.swift
//  Calculator
//
//  Created by MİZGİN YILDIRAK on 28.01.2024.
//

import Foundation

struct CalculatorButtonModel {
    let id = UUID()
    let title: String
    let type: CalculatorButtonType
}

enum CalculatorButtonType {
    case number
    case sum
    case extract
    case multiply
    case divide
    case modulo
    case delete
    case equal
    case backspace
    case point
}
