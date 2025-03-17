//
//  Debt.swift
//  Piutang
//
//  Created by Pramuditha Muhammad Ikhwan on 17/03/25.
//

import Foundation

struct Debt: Identifiable {
    let id: UUID
    var name: String
    var amount: Double
    var date: Date
    var isPaid: Bool
}
