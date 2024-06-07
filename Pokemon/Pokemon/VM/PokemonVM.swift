//
//  ListVM.swift
//  Pokemon
//
//  Created by Nacho Mendez on 05/06/2024.
//

import Foundation

protocol PokemonVMprotocol {
    func fetchPokemon() async throws
    var api: PokemonRepositoryProtocol { get set }
    var pokemon: PokemonModel? { get set }
}

class PokemonVM: PokemonVMprotocol {
    
    var api: PokemonRepositoryProtocol
    var pokemon: PokemonModel? = nil
    
    init(api: PokemonRepositoryProtocol = PokemonRepository()) {
        self.api = api
    }
    
    func fetchPokemon() async throws {
        do {
            self.pokemon = try await api.getPokemon()
        } catch {
            throw error
        }
    }
}
