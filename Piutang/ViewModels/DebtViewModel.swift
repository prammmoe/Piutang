//
//  DebtViewModel.swift
//  Piutang
//
//  Created by Pramuditha Muhammad Ikhwan on 17/03/25.
//

import Foundation

class DebtViewModel: ObservableObject {
    // State to hold the search text
    @Published var searchText: String = ""
    @Published var debts: [Debt] = []
    
    // Filtered debts functionality
    var filteredDebts: [Debt] {
        guard !searchText.isEmpty else {
            return debts
        }
        
        // Return person name of the debt
        return debts.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var totalUnpaid: Double {
        debts.filter { !$0.isPaid }.reduce(0) { $0 + $1.amount }
    }
    
    // Get count of person that borrow money
    var totalDebtor: Int {
        let unpaidDebtors = debts.count
//        let unpaidDebtors = debts.filter { !$0.isPaid }.map { $0.name } # Unique debtors
//        return Set(unpaidDebtors).count // Count unique debtor
        return unpaidDebtors
    }
    
    // Dummy Data
    init() {
        debts = [
            Debt(id: UUID(), name: "Budi", amount: 500000, date: Date(timeIntervalSinceNow: -86400 * 3), isPaid: false),  // 3 hari lalu
            Debt(id: UUID(), name: "Siti", amount: 750000, date: Date(timeIntervalSinceNow: -86400 * 7), isPaid: false),  // 7 hari lalu
            Debt(id: UUID(), name: "Joko", amount: 1200000, date: Date(timeIntervalSinceNow: -86400 * 10), isPaid: false), // 10 hari lalu
            Debt(id: UUID(), name: "Ani", amount: 300000, date: Date(timeIntervalSinceNow: -86400 * 15), isPaid: false), // 15 hari lalu
            Debt(id: UUID(), name: "Dewi", amount: 900000, date: Date(), isPaid: false) // Hari ini
        ]
    }
        
    // Function to add debt
    func addDebt(name: String, amount: Double, date: Date) {
        let newDebt = Debt(id: UUID(), name: name, amount: amount, date: date, isPaid: false)
        debts.append(newDebt)
    }
    
    // Function to remove debt
    func removeDebt(at indexSet: IndexSet) {
        debts.remove(atOffsets: indexSet)
    }
    
    // Function to toggle paid
    func togglePaid(id: UUID) {
        if let index = debts.firstIndex(where: { $0.id == id }) {
            debts[index].isPaid.toggle()
        }
    }
}
