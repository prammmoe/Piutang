//
//  BorrowerHomeCard.swift
//  Piutang
//
//  Created by Pramuditha Muhammad Ikhwan on 16/03/25.
//

import SwiftUI

struct BorrowerHomeCard: View {
    var debt: Debt
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(debt.name).font(.headline)
                    Text(convertDateToString(debt.date)).font(.caption).foregroundStyle(.secondary)
                }.padding()
                Spacer()
                VStack(alignment: .trailing, spacing: 10) {
                    Text("Sisa Piutang").font(.caption).foregroundStyle(.secondary)
                    Text("Rp\(debt.amount, specifier: "%.2f")").font(.headline).fontWeight(.semibold).foregroundStyle(.primary)
                }
                Image(systemName: "chevron.right").padding()
            }.frame(height: 100)
            .background(Color.gray.opacity(0.1))
        }
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

func convertDateToString(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMMM yyyy"
    return dateFormatter.string(from: date)
}
