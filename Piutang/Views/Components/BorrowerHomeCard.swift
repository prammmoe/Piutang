//
//  BorrowerHomeCard.swift
//  Piutang
//
//  Created by Pramuditha Muhammad Ikhwan on 16/03/25.
//

import SwiftUI

struct BorrowerHomeCard: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Nama Peminjam")
                    Text("12/03/2025").foregroundStyle(.secondary)
                }.padding()
                Spacer()
                VStack(alignment: .trailing, spacing: 10) {
                    Text("Sisa Piutang").font(.caption).foregroundStyle(.secondary)
                    Text("Rp500.000").font(.title3).fontWeight(.semibold).foregroundStyle(.orange)
                }
                Image(systemName: "chevron.right").padding()
            }.frame(height: 100)
            .background(Color.gray.opacity(0.1))
        }
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

#Preview {
    BorrowerHomeCard()
}
