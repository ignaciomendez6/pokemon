//
//  PokemonsRepository.swift
//  Pokemon
//
//  Created by Nacho Mendez on 05/06/2024.
//

import Foundation

enum MyErrors: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

extension MyErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "Invalid URL Error")
        case .invalidResponse:
            return NSLocalizedString("Invalid Response", comment: "Invalid Response Error")
        case .invalidData:
            return NSLocalizedString("Invalid Data", comment: "Invalid Data Error")
        }
    }
}

class Repository<T: Decodable> {
    
    func fetchData(from endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw MyErrors.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw MyErrors.invalidResponse
            }
            
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw MyErrors.invalidData
        }
    }
}

protocol PokemonsRepositoryProtocol {
    func getPokemons() async throws -> PokemonsModel
}

class PokemonsRepository: PokemonsRepositoryProtocol {
    
    func getPokemons() async throws -> PokemonsModel {
        let endpoint = "https://pokeapi.co/api/v2/pokemon/"
        let repository = Repository<PokemonsModel>()
        return try await repository.fetchData(from: endpoint)
    }
}


protocol PokemonRepositoryProtocol {
    func getPokemon() async throws -> PokemonModel
}

class PokemonRepository: PokemonRepositoryProtocol {
    
    var pokemon: String
    
    init(pokemon: String = "charmander") {
        self.pokemon = pokemon
    }
    
    func getPokemon() async throws -> PokemonModel {
        let endpoint = "https://pokeapi.co/api/v2/pokemon/\(pokemon)"
        let repository = Repository<PokemonModel>()
        return try await repository.fetchData(from: endpoint)
    }
}



