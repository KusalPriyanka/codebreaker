//
//  GameEditor.swift
//  codebreaker
//
//  Created by Kusal Perera on 2026-03-05.
//

import SwiftUI

struct GameEditor: View {
    @Bindable var game: CodeBreaker
    
    var body: some View {
        Form {
            Section("Name") {
                TextField("Name", text: $game.name)
            }
            Section("Pegs") {
                List {
                    ForEach(game.pegChoices.indices, id: \.self) { index in
                        ColorPicker(
                            selection: $game.pegChoices[index],
                            supportsOpacity: false
                        ) {
                            Text("Peg Choice \(index + 1)")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable var game = CodeBreaker(name: "Preview", pegChoices: [.yellow, .purple])
    GameEditor(game: game)
        .onChange(of: game.name) {
            print("game name changed to \(game.name)")
        }
        .onChange(of: game.pegChoices) {
            print("game pegs changed to \(game.pegChoices)")
        }
}
