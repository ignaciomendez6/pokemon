//
//  PokemonsModel.swift
//  Pokemon
//
//  Created by Nacho Mendez on 05/06/2024.
//

import Foundation

struct PokemonsModel: Codable {
    let count: Int
    let results: [Result]
}

struct Result: Codable {
    let name: String
}
