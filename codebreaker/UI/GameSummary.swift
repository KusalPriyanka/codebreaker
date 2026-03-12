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
    var size: Size = .compact
    
    enum Size {
        case compact
        case regular
        case large
        
        var larger: Size {
            switch self {
            case .compact: .regular
            default: .large
            }
        }
        
        var smaller: Size {
            switch self {
            case .large: .regular
            default: .compact
            }
        }
    }
    
    // MARK: - Body
    var body: some View {
        let layout = size == .compact ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout(alignment: .leading))
        layout {
            Text(game.name).font(size == .compact ? .body : .title)
            
            PegChooser(choices: game.pegChoices, onChoose: nil)
                .frame(maxHeight: size == .compact ? 35 : 50)
            
            if size == .large {
                Text("^[\(game.attempts.count) attempt](inflect: true)")
            }
        }
    }
}
