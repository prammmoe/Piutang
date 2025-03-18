//
//  ConvertDateToString.swift
//  Piutang
//
//  Created by Pramuditha Muhammad Ikhwan on 18/03/25.
//

import SwiftUI

func convertDateToString(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMMM yyyy"
    return dateFormatter.string(from: date)
}

