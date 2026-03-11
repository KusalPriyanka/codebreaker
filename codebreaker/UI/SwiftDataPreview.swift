//
//  SwiftDataPreview.swift
//  codebreaker
//
//  Created by Kusal Perera on 2026-03-08.
//

import SwiftUI
import SwiftData

struct SwiftDataPreview: PreviewModifier {
    
    static func makeSharedContext() async throws -> ModelContainer {
        let container = try ModelContainer(
            for: CodeBreaker.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        
        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

extension PreviewTrait<Preview.ViewTraits> {
    @MainActor static var swiftData: Self = .modifier(SwiftDataPreview())
}
