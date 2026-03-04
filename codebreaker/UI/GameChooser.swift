//
//  GameChooser.swift
//  codebreaker
//
//  Created by Kusal Perera on 2026-03-03.
//

import SwiftUI

struct GameChooser: View {
    // MARK: Data Owned by Me
    @State private var games: [CodeBreaker] = []
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                ForEach(games) { game in
                    NavigationLink(value: game) {
                        GameSummary(game: game)
                    }
                    NavigationLink(value: game.masterCode.pegs) {
                        Text("Cheat")
                    }
                }
                .onDelete { offsets in
                    games.remove(atOffsets: offsets)
                }
                .onMove { offsets, destination in
                    games.move(fromOffsets: offsets, toOffset: destination)
                }
            }
            .navigationDestination(for: CodeBreaker.self) { game in
                    CodeBreakerView(game: game)
            }
            .navigationDestination(for: [Peg].self) { pegs in
                    PegChooser(choices: pegs, onChoose: nil)
            }
            .listStyle(.plain)
            .toolbar {
                EditButton()
            }
        }
        .onAppear {
            games.append(CodeBreaker(name: "Mastermind", pegChoices: [.red, .blue, .green, .yellow]))
            games.append(CodeBreaker(name: "Earth Tones", pegChoices: [.orange, .brown, .black, .yellow, .green]))
            games.append(CodeBreaker(name: "Undersea", pegChoices: [.blue, .indigo, .cyan]))
        }
    }
}

#Preview {
    GameChooser()
}
