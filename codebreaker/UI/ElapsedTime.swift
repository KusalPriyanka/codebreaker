//
//  ElapsedTime.swift
//  codebreaker
//
//  Created by Kusal Perera on 2026-02-28.
//

import SwiftUI

struct ElapsedTime: View {
    // MARK: Data In
    let startTime: Date
    let endTime: Date?
    
    // MARK: - Body
    var body: some View {
        if let endTime {
            Text(endTime, format: .offset(to: startTime, allowedFields: [.minute, .second]))
        } else {
            Text(TimeDataSource<Date>.currentDate, format: .offset(to: startTime, allowedFields: [.minute, .second]))
        }
    }
}
