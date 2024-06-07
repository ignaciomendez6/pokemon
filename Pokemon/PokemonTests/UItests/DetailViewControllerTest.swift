//
//  DetailViewControllerTest.swift
//  PokemonTests
//
//  Created by Nacho Mendez on 07/06/2024.
//

import Foundation
@testable import Pokemon
import XCTest
import SnapshotTesting
import Quick
import Nimble

final class DetailViewControllerTest: XCTestCase {
    
    private var pokemonRepositoryMock = PokemonsRepositoryMock()
    
    override func setUp() {
        super.setUp()
        isRecording = false
    }
    
    var mock = PokemonVMMock()
    
    func testView() {
        let view = DetailView()
        view.configureDetail(vm: mock, index: 1)
        let controller = UIViewController()
        controller.view = view
        
        TestConstants.configurations.forEach { config in
            assertSnapshot(matching: controller, as: .image(on: config.device), named: config.name)
        }
    }
}
