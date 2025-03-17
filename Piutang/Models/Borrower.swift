//
//  Borrower.swift
//  Piutang
//
//  Created by Pramuditha Muhammad Ikhwan on 17/03/25.
//

import SwiftUI
import SwiftData

@Model
class Borrower {
    var name: String
    var loanAmount: Double
    var dueDate: Date
    
    // Computed property to get formatted due date
    var formattedDueDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: dueDate)
    }
    
    // Computed property to get the formatted loan amount
    var formattedLoanAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "id_ID") // Indonesian locale
        formatter.currencySymbol = "Rp"
        return formatter.string(from: NSNumber(value: loanAmount)) ?? "Rp0"
    }
    
    // Calculated property to check if the loan is past the due date
    var isPastDue: Bool {
        return Date() > dueDate
    }
    
    // Days remaining until due date
    var daysRemaining: Int {
        let calendar = Calendar.current
        return calendar.dateComponents([.day], from: Date(), to: dueDate).day ?? 0
    }
    
    init(name: String, loanAmount: Double, dueDate: Date) {
        self.name = name
        self.loanAmount = loanAmount
        self.dueDate = dueDate
    }
}

// Extension to add sorting and filtering capabilities
extension Borrower {
    static func byNameAscending(_ borrowers: [Borrower]) -> [Borrower] {
        return borrowers.sorted { $0.name < $1.name }
    }
    
    static func byDueDateNearest(_ borrowers: [Borrower]) -> [Borrower] {
        return borrowers.sorted { $0.dueDate < $1.dueDate }
    }
    
    static func byAmountHighest(_ borrowers: [Borrower]) -> [Borrower] {
        return borrowers.sorted { $0.loanAmount > $1.loanAmount }
    }
}
