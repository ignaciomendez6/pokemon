//
//  Utils.swift
//  Pokemon
//
//  Created by Nacho Mendez on 06/06/2024.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL, placeholderNamed placeholderName: String? = nil) {
        if let placeholderName = placeholderName, let placeholderImage = UIImage(named: placeholderName) {
            self.image = placeholderImage
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
