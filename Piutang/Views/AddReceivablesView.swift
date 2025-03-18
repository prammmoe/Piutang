//
//  AddReceivablesView.swift
//  Piutang
//
//  Created by Pramuditha Muhammad Ikhwan on 16/03/25.
//

import SwiftUI

struct AddReceivablesView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = ""
    @State private var amount: String = ""
    @State private var date: Date = Date()
    @State private var showAlert: Bool = false
    
    @ObservedObject var viewModel = DebtViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                VStack {
                    VStack(alignment: .leading) {
                        TextField("Nama", text: $name).padding()
                        Divider()
                        TextField("Jumlah", text: $amount).padding()
                        Divider()
                        DatePicker("Tanggal", selection: $date, displayedComponents: [.date]).textContentType(.dateTime).padding()
                    }
                    VStack(alignment: .center) {
                        Button(action: {
                            guard let amountValue = Double(amount), !name.isEmpty else { return }
                            viewModel.addDebt(name: name, amount: amountValue, date: date)
                            dismiss()
                        }) {
                            Text("Tambah")
                        }
                    }
                }
            }
        }.navigationTitle("Tambah Piutang").navigationBarTitleDisplayMode(.inline)
    }
}

// Function to check if the textfield empty or not
func isEmpty(_ text: String) -> Bool {
    return text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
}

#Preview {
    AddReceivablesView()
}
