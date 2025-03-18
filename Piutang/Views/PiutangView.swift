//
//  ContentView.swift
//  Piutang
//
//  Created by Pramuditha Muhammad Ikhwan on 16/03/25.
//

import SwiftUI

struct PiutangView: View {
    @StateObject var viewModel = DebtViewModel()
    @State private var presentSheet: Bool = false
    @State private var searchText: String = ""
    
    @State private var showSortOptions: Bool = false
    @State private var sortOption: SortOption = .dateNewest // Default to newest date
    
    // Enum to sort receivables list
    enum SortOption: String, CaseIterable {
        case dateNewest = "Tanggal Terdekat"
        case amountHighest = "Jumlah Terbesar"
    }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Total Sisa Piutang")
                            .font(.callout)
                            .foregroundStyle(.primary)
                        Text("Rp\(viewModel.totalUnpaid, specifier: "%.2f")")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.green)
                        Text("Kamu punya \(viewModel.totalDebtor) utang aktif!")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(width: 240, height: 22)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 8)
                }
                .listRowSeparator(.hidden)
                
                Section {
                    HStack {
                        Text("Utang Aktif")
                            .font(.title2).fontWeight(.bold)
                        Spacer()
                        Button(action: {
                            showSortOptions.toggle()
                        }) {
                            Image(systemName: "arrow.up.arrow.down")
                        }
                        .confirmationDialog("Urutkan berdasarkan", isPresented: $showSortOptions, titleVisibility: .visible) {
                            ForEach(SortOption.allCases, id: \.self) { option in
                                Button(option.rawValue) {
                                    sortOption = option
                                }
                            }
                            Button("Cancel", role: .cancel) {}
                        }
                    }
                    
                    ForEach(viewModel.filteredDebts) { debt in
                        BorrowerHomeCard(debt: debt)
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Piutang")
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Tambah", systemImage: "plus") {
                        presentSheet.toggle()
                    }
                }
            }
            .sheet(isPresented: $presentSheet) {
                AddReceivablesView(viewModel: viewModel) // Navigate to add receivables view
            }
        }
    }
}

#Preview {
    PiutangView()
}
