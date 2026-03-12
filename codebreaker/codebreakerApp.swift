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
            GeometryReader { geometry in
                GameChooser()
                    .modelContainer(for: CodeBreaker.self)
                    .environment(\.sceneFrame, geometry.frame(in: .global))
            }
            .ignoresSafeArea(edges: .all)
        }
    }
}

extension EnvironmentValues {
    @Entry var sceneFrame: CGRect = .zero
}
