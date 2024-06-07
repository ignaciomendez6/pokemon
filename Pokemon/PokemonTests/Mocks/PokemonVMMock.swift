//
//  PokemonVMMock.swift
//  PokemonTests
//
//  Created by Nacho Mendez on 07/06/2024.
//

import Foundation
@testable import Pokemon

class PokemonVMMock: PokemonVMprotocol {
    
    var api: PokemonRepositoryProtocol
    var pokemon: PokemonModel? = MockPokemon.pokemon
    
    public init(api: PokemonRepositoryProtocol = MockPokemonRepository()) {
        self.api = api
    }
    
    func fetchPokemon() async throws {
        do {
            self.pokemon = try await api.getPokemon()
            self.pokemon = MockPokemon.pokemon
        } catch {
            throw error
        }
    }
}
