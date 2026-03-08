//
//  GameEditor.swift
//  codebreaker
//
//  Created by Kusal Perera on 2026-03-05.
//

import SwiftUI

struct GameEditor: View {
    //MARK: Data (Function) In
    @Environment(\.dismiss) var dismiss
    
    //MARK: Data Shared with Me
    @Bindable var game: CodeBreaker
    
    //MARK: Action Function
    let onChoose: () -> Void
    
    //MARK: Data Owned by Me
    @State private var showInvalidGameAlert: Bool = false
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            Form {
                Section("Name") {
                    TextField("Name", text: $game.name)
                        .autocapitalization(.words)
                        .autocorrectionDisabled(true)
                        .onSubmit {
                            done()
                        }
                }
                Section("Pegs") {
                    PegChoicesChooser(pegChoices: $game.pegColorChoices)
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        done()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                       done()
                    }
                    .alert("Invalid Game", isPresented: $showInvalidGameAlert) {
                        Button("OK") {
                            showInvalidGameAlert = false
                        }
                    } message: {
                        Text("A game must have a name and more than one unique peg.")
                    }
                }
            }
        }
    }
    
    func done() {
        if game.isValid {
            onChoose()
            dismiss()
        } else {
            showInvalidGameAlert = true;
        }
    }
}

extension CodeBreaker {
    var isValid: Bool {
        !name.isEmpty && Set(pegChoices).count >= 2
    }
}

#Preview {
    @Previewable var game = CodeBreaker(name: "Preview", pegChoices: [.yellow, .purple])
    GameEditor(game: game) {
        print("game name changed to \(game.name)")
        print("game pegs changed to \(game.pegChoices)")
    }
}
