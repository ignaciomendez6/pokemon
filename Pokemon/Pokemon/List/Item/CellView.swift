//
//  ItemView.swift
//  Pokemon
//
//  Created by Nacho Mendez on 04/06/2024.
//

import UIKit

class CellView: UITableViewCell {
    
    private lazy var viewCell: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        clipsToBounds = true
        return view
    }()
    
    private lazy var pokemonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        [viewCell, pokemonImage, labelTitle, descriptionLabel] .forEach { view in
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            
            viewCell.topAnchor.constraint(equalTo: topAnchor),
            viewCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewCell.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            pokemonImage.centerYAnchor.constraint(equalTo: viewCell.centerYAnchor),
            pokemonImage.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor, constant: 12),
            pokemonImage.heightAnchor.constraint(equalToConstant: 60),
            pokemonImage.widthAnchor.constraint(equalToConstant: 60),
            
            labelTitle.topAnchor.constraint(equalTo: viewCell.topAnchor, constant: 20),
            labelTitle.leadingAnchor.constraint(equalTo: pokemonImage.trailingAnchor, constant: 20),
            labelTitle.heightAnchor.constraint(equalToConstant: 20),
            labelTitle.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -12),
            
            descriptionLabel.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: pokemonImage.trailingAnchor, constant: 20),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -12)
            
        ])
    }
    
    func configureItem(vm: PokemonsVMprotocol, index: Int) {
        if let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(index+1).png") {
            pokemonImage.load(url: url, placeholderNamed: "placeholderImage")
        } else {
            pokemonImage.image = UIImage(named: "defaultImage")
        }
        
        labelTitle.text = vm.pokemons?.results[index].name.capitalized
        
        descriptionLabel.text = "Pokemon number: \(String(index+1))"
    }
}
