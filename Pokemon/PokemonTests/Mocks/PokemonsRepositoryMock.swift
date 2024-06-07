//
//  PokemonsRepositoryMock.swift
//  PokemonTests
//
//  Created by Nacho Mendez on 06/06/2024.
//

import Foundation
@testable import Pokemon

class PokemonsRepositoryMock: PokemonsRepositoryProtocol {
    
    var getPokemonsCountTimesCalled: Int = 0
    var error: Error?
    func getPokemons() async throws -> Pokemon.PokemonsModel {
        self.getPokemonsCountTimesCalled += 1
        guard let error = error else {
            return PokemonsModel(count: 20,
                                 results: [
                                    Result(name: "Pikachu"),
                                    Result(name: "Charmander"),
                                    Result(name: "Bulbasaur"),
                                    Result(name: "Squirtle"),
                                    Result(name: "Jigglypuff")
                                 ])
        }
        throw error
    }
}

