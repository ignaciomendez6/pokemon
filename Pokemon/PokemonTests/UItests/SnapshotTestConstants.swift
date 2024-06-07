//
//  SnapshotTestConstants.swift
//  PokemonTests
//
//  Created by Nacho Mendez on 06/06/2024.
//

import Foundation
import UIKit
import SnapshotTesting

struct TestConstants {
    
    static let configurations: [TestConfiguration] = [TestConfiguration(name: "iPhone8", device: .iPhone8),
                                                      TestConfiguration(name: "iPhoneX", device: .iPhoneX),
                                                      TestConfiguration(name: "iPhoneSe", device: .iPhoneSe),]
}

struct TestConfiguration {
    let name: String
    let device: ViewImageConfig
}
