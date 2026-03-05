//
//  CodeBreaker.swift
//  codebreaker
//
//  Created by Kusal Perera on 2026-02-23.
//

import SwiftUI

@Observable class CodeBreaker {
    var name: String
    var masterCode: Code = Code(kind: .master(isHidden: true))
    var guess: Code = Code(kind: .guess)
    var attempts: [Code] = []
    var pegChoices: [Peg]
    var startTime: Date = Date.now
    var endTime: Date?
    
    init(name: String = "Code Breaker", pegChoices: [Peg] = [.red, .blue, .yellow, .green]) {
        self.name = name
        self.pegChoices = pegChoices
        masterCode.randomize(from: pegChoices)
    }
    
    var isOver: Bool {
        attempts.first?.pegs == masterCode.pegs
    }
    
    func restart() {
        masterCode.kind = .master(isHidden: true)
        masterCode.randomize(from: pegChoices)
        guess.reset()
        attempts.removeAll()
        startTime = .now
        endTime = nil
    }
    
    func attemptGuess() {
        guard !attempts.contains(where: { $0.pegs == guess.pegs }) else { return }
        var attempt = guess
        attempt.kind = .attemp(guess.match(against: masterCode))
        attempts.insert(attempt, at: 0)
        guess.reset()
        
        if isOver {
            endTime = .now
            masterCode.kind = .master(isHidden: false)
        }
    }
    
    func setGuessPeg(_ peg: Peg, at index: Int) {
        guard guess.pegs.indices.contains(index) else { return }
        guess.pegs[index] = peg;
    }
    
    func changeGuessPeg(at index: Int) {
        let existingPeg = guess.pegs[index]
        if let indexOfExistingPegInPegChoices = pegChoices.firstIndex(of: existingPeg) {
            let newPeg = pegChoices[(indexOfExistingPegInPegChoices + 1) % pegChoices.count]
            guess.pegs[index] = newPeg
        } else {
            guess.pegs[index] = pegChoices.first ?? Code.missingPeg
        }
    }
}

extension Peg {
    static let missing = Color.clear
}

extension CodeBreaker : Identifiable, Hashable, Equatable {
    static func == (lhs: CodeBreaker, rhs: CodeBreaker) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

typealias Peg = Color
