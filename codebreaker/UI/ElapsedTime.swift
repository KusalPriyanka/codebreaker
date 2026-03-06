//
//  ElapsedTime.swift
//  codebreaker
//
//  Created by Kusal Perera on 2026-02-28.
//

import SwiftUI

struct ElapsedTime: View {
    // MARK: Data In
    let startTime: Date?
    let endTime: Date?
    let elapsedTime: TimeInterval
    
    // MARK: - Body
    var body: some View {
        if startTime != nil {
            if let endTime {
                Text(endTime, format: format)
            } else {
                Text(TimeDataSource<Date>.currentDate, format: format)
            }
        } else {
            Image(systemName: "pause")
        }
    }
    
    var format: SystemFormatStyle.DateOffset {
        .offset(to: startTime! - elapsedTime, allowedFields: [.minute, .second])
    }
}
