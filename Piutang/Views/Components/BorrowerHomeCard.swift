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
        // Condition: if debt is empty, return empty view
        if debt.name.isEmpty {
            NotFoundView()
        } else {
            VStack {
                HStack {
                    //                VStack(alignment: .center) {
                    //                    Text("06").background(Color.gray).foregroundColor(.white).font(.title2).fontWeight(.bold).cornerRadius(4)
                    //                    Text("Feb")
                    //                    Text("2025")
                    //                }
                    //                Spacer()
                    //                Divider()
                    //                .padding(.leading)
                    VStack(alignment: .leading, spacing: 10) {
                        Text(debt.name).font(.headline)
                        Text(convertDateToString(debt.date)).font(.subheadline).foregroundStyle(.primary)
                    }.padding()
                    Spacer()
                    VStack(alignment: .trailing, spacing: 10) {
                        Text("Sisa Piutang").font(.footnote).foregroundStyle(.secondary)
                        Text("Rp\(debt.amount, specifier: "%.2f")").font(.title3).fontWeight(.semibold).foregroundStyle(.primary)
                    }
                    Image(systemName: "chevron.right").padding()
                }.frame(height: 100)
                    .background(Color.gray.opacity(0.1))
            }
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
    }
}

#Preview {
    BorrowerHomeCard(debt: .init(id: UUID(), name: "Filza", amount: 100000, date: Date(), isPaid: false))
}
