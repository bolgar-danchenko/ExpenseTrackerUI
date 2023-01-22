//
//  Expense.swift
//  ExpenseTrackerUI
//
//  Created by Konstantin Bolgar-Danchenko on 22.01.2023.
//

import SwiftUI

// MARK: Expense Model and Sample Data
struct Expense: Identifiable, Hashable {
    var id = UUID().uuidString
    var remark: String
    var amount: Double
    var date: Date
    var type: ExpenseType
    var color: String
}

enum ExpenseType: String {
    case income = "Income"
    case expense = "expenses"
    case all = "ALL"
}

var sampleExpenses: [Expense] = [
    Expense(remark: "Mobile Phone", amount: 11.99, date: Date(timeIntervalSince1970: 1674331736), type: .expense, color: "yellow"),
    Expense(remark: "Food", amount: 19, date: Date(timeIntervalSince1970: 1674245336), type: .expense, color: "red"),
    Expense(remark: "Gasoline", amount: 48, date: Date(timeIntervalSince1970: 1674238136), type: .expense, color: "purple"),
    Expense(remark: "Taxi", amount: 20, date: Date(timeIntervalSince1970: 1674234536), type: .expense, color: "green"),
    Expense(remark: "Cat Food", amount: 50, date: Date(timeIntervalSince1970: 1674230936), type: .expense, color: "yellow"),
    Expense(remark: "Coffee", amount: 6.99, date: Date(timeIntervalSince1970: 1673626136), type: .expense, color: "red"),
    Expense(remark: "Netflix", amount: 25, date: Date(timeIntervalSince1970: 1673453336), type: .expense, color: "green"),
    Expense(remark: "Paul's Birthday Present", amount: 149, date: Date(timeIntervalSince1970: 1673280536), type: .expense, color: "purple"),
    
    Expense(remark: "Salary", amount: 3400, date: Date(timeIntervalSince1970: 1672675736), type: .income, color: "purple"),
    Expense(remark: "Interest", amount: 349, date: Date(timeIntervalSince1970: 1673798936), type: .income, color: "red"),
]
