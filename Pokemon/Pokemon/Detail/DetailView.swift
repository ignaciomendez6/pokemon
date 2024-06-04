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
        let url: URL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/4.png")!
        image.load(url: url)
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
        textView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eget elementum ligula. Donec iaculis rhoncus felis, eu cursus lectus. Sed laoreet tristique ex, a lacinia elit pellentesque id. Integer et tellus tristique, pellentesque eros ac, pharetra ex. Nullam vestibulum tincidunt erat id consectetur. Sed nec sollicitudin risus. In condimentum turpis et tortor viverra, sit amet tempus justo consectetur. Integer posuere, justo in commodo fermentum, massa augue rutrum nulla, sit amet facilisis purus ligula a risus."
        textView.textColor = .black
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
}

