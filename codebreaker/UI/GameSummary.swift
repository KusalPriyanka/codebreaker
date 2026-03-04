//
//  GameSummary.swift
//  codebreaker
//
//  Created by Kusal Perera on 2026-03-04.
//

import SwiftUI

struct GameSummary: View {
    // MARK: Data In
    let game: CodeBreaker
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            Text(game.name).font(.title)
            PegChooser(choices: game.pegChoices, onChoose: nil)
                .frame(maxHeight: 50)
            Text("^[\(game.attempts.count) attempt](inflect: true)")
        }
    }
}
