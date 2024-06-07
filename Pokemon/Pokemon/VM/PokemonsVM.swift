//
//  ListVM.swift
//  Pokemon
//
//  Created by Nacho Mendez on 05/06/2024.
//

import Foundation

protocol PokemonsVMprotocol {
    func fetchPokemons() async throws
    var api: PokemonsRepositoryProtocol { get set }
    var pokemons: PokemonsModel? { get set }
}

class PokemonsVM: PokemonsVMprotocol {
    
    var api: PokemonsRepositoryProtocol
    var pokemons: PokemonsModel? = nil
    
    init(api: PokemonsRepositoryProtocol = PokemonsRepository()){
        self.api = api
    }
    
    func fetchPokemons() async throws {
        do {
            self.pokemons = try await api.getPokemons()
        } catch {
            throw error
        }
    }
}
