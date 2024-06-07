//
//  PokemonsVMTest.swift
//  PokemonTests
//
//  Created by Nacho Mendez on 06/06/2024.
//

import Foundation
import Quick
import Nimble
import XCTest
@testable import Pokemon

class PokemonsVMTest: QuickSpec {
    static private var pokemonRepositoryMock: PokemonsRepositoryMock!
    static private var pokemonsVM: PokemonsVMprotocol!
    
    
    override class func spec() {
        beforeEach() {
            self.pokemonRepositoryMock = PokemonsRepositoryMock()
            self.pokemonsVM = PokemonsVM(api: self.pokemonRepositoryMock)
        }
        
        describe("when fetch all pokemons") {
            PokemonsVMTest.context("and request is ok") {
                PokemonsVMTest.it("should call getPokemons and get pokemons") {
                    //Given
                    self.pokemonRepositoryMock.error = nil
                    
                    //When
                    Task {
                        try await self.pokemonsVM.fetchPokemons()
                    }
                    
                    //Then
                    expect(self.pokemonRepositoryMock.getPokemonsCountTimesCalled).to(equal(1))
                    expect(pokemonsVM.pokemons?.count).to(equal(20))
                }
            }
        }
        
        describe("when fetch all pokemons") {
            PokemonsVMTest.context("and request fails with invalidData") {
                PokemonsVMTest.it("should call getPokemons and throw") {
                    //Given
                    self.pokemonRepositoryMock.error = MyErrors.invalidData
                    
                    //When
                    Task {
                        try await self.pokemonsVM.fetchPokemons()
                    }
                    
                    //Then
                    expect(self.pokemonRepositoryMock.getPokemonsCountTimesCalled).to(equal(1))
                    expect(pokemonsVM.pokemons?.count).to(beNil())
                }
            }
        }
        
        describe("when fetch all pokemons") {
            PokemonsVMTest.context("and request fails with invalidResponse") {
                PokemonsVMTest.it("should call getPokemons and throw") {
                    //Given
                    self.pokemonRepositoryMock.error = MyErrors.invalidResponse
                    
                    //When
                    Task {
                        try await self.pokemonsVM.fetchPokemons()
                    }
                    
                    //Then
                    expect(self.pokemonRepositoryMock.getPokemonsCountTimesCalled).to(equal(1))
                    expect(pokemonsVM.pokemons?.count).to(beNil())
                }
            }
        }
        
        describe("when fetch all pokemons") {
            PokemonsVMTest.context("and request fails with invalidURL") {
                PokemonsVMTest.it("should call getPokemons and throw") {
                    //Given
                    self.pokemonRepositoryMock.error = MyErrors.invalidURL
                    
                    //When
                    Task {
                        try await self.pokemonsVM.fetchPokemons()
                    }
                    
                    //Then
                    expect(self.pokemonRepositoryMock.getPokemonsCountTimesCalled).to(equal(1))
                    expect(pokemonsVM.pokemons?.count).to(beNil())
                }
            }
        }
    }
}
