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
                            if !isEmpty(name) && !isEmpty(amount) {
                                dismiss()
                            } else {
                                showAlert = true
                            }
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
