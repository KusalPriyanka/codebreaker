//
//  codebreakerApp.swift
//  codebreaker
//
//  Created by Kusal Perera on 2026-02-23.
//

import SwiftUI
import SwiftData

@main
struct codebreakerApp: App {
    var body: some Scene {
        WindowGroup {
            GameChooser()
                .modelContainer(for: CodeBreaker.self)
        }
    }
}
