//
//  DetailView.swift
//  Pokemon
//
//  Created by Nacho Mendez on 04/06/2024.
//

import Foundation
import UIKit

final class DetailView: UIView {
    
    private lazy var bigPokemonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var descriptionTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Description"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descriptionText: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.showsVerticalScrollIndicator = true
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 16)
        return textView
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        backgroundColor = .white
        
        [bigPokemonImage, descriptionTitle, descriptionText] .forEach { view in
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            
            bigPokemonImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            bigPokemonImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            bigPokemonImage.heightAnchor.constraint(equalToConstant: 250),
            bigPokemonImage.widthAnchor.constraint(equalToConstant: 250),
            
            descriptionTitle.topAnchor.constraint(equalTo: bigPokemonImage.bottomAnchor, constant: 25),
            descriptionTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            descriptionTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            descriptionText.topAnchor.constraint(equalTo: descriptionTitle.bottomAnchor, constant: 25),
            descriptionText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            descriptionText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            descriptionText.heightAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    func configureDetail(vm: PokemonVMprotocol, index: Int) {
        if let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(index+1).png") {
            bigPokemonImage.load(url: url, placeholderNamed: "placeholderImage")
        } else {
            bigPokemonImage.image = UIImage(named: "defaultImage")
        }
        
        if let height = vm.pokemon?.height, let weight = vm.pokemon?.weight, let moves = vm.pokemon?.moves {
            self.descriptionText.text = String(format: "Height: %.1fm, Weight: %.1fkg.\nMoves:\n", Float(height) / 10, Float(weight) / 10)
            let moveNames = moves.compactMap { $0.move.name }
            self.descriptionText.text += moveNames.joined(separator: ", ")
        }
    }
}

