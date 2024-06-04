//
//  ItemView.swift
//  Pokemon
//
//  Created by Nacho Mendez on 04/06/2024.
//

import UIKit

class ItemView: UITableViewCell {
    
    //view for cell
    private lazy var viewCell: UIView = {
        let view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.backgroundColor = .white
        layer.cornerRadius = 5
        clipsToBounds = true
        return view2
    }()
    
    private lazy var pokemonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        let url: URL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png")!
        image.load(url: url)
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    //label title
    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Charmander"
        return label
    }()
    
    //label author
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Peso y altura"
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
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}





