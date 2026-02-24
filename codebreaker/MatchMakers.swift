//
//  MatchMakers.swift
//  codebreaker
//
//  Created by Kusal Perera on 2026-02-23.
//

import SwiftUI

enum Match {
    case nomatch
    case exact
    case inexact
}

struct MatchMakers: View {
    var matches: [Match]
    
    var body: some View {
        HStack {
            VStack {
                matchMaker(peg: 0)
                matchMaker(peg: 1)
            }
            VStack {
                matchMaker(peg: 2)
                matchMaker(peg: 3)
            }
        }
    }
    
    func matchMaker(peg: Int) -> some View {
        let exactCount: Int = matches.count(where: { match in match == .exact })
        let foundCount: Int = matches.count(where: { match in match != .nomatch })
        
        return Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(foundCount > peg ? Color.primary : Color.clear, lineWidth: 2)
            .aspectRatio(1, contentMode: .fit)
        
    }
}
