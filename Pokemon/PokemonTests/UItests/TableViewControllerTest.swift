//
//  TableViewControllerTest.swift
//  PokemonTests
//
//  Created by Nacho Mendez on 06/06/2024.
//

import Foundation
@testable import Pokemon
import XCTest
import SnapshotTesting
import Quick
import Nimble

final class TableViewControllerTest: XCTestCase {
    
    private var pokemonRepositoryMock = PokemonsRepositoryMock()
    
    override func setUp() {
        super.setUp()
        isRecording = false
    }
    
    func testView() {
        let view = TableView()
        let controller = UIViewController()
        controller.view = view
        
        TestConstants.configurations.forEach { config in
            assertSnapshot(matching: controller, as: .image(on: config.device), named: config.name)
        }
    }
}
