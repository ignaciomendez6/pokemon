//
//  PokemonRepositoryMock.swift
//  PokemonTests
//
//  Created by Nacho Mendez on 07/06/2024.
//

import Foundation
@testable import Pokemon

class MockPokemonRepository: PokemonRepositoryProtocol {
    var pokemonMock = MockPokemon.pokemon
    
    func getPokemon() async throws -> PokemonModel {
        return pokemonMock
    }
}
