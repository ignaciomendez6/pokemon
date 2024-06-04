//
//  ListView.swift
//  Pokemon
//
//  Created by Nacho Mendez on 04/06/2024.
//

import Foundation
import UIKit

final class ListView: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 0.92, green: 0.96, blue: 0.98, alpha: 1)
        return view
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 100
        //table.backgroundColor = .blue
        table.backgroundColor = UIColor(red: 0.92, green: 0.96, blue: 0.98, alpha: 1)
        return table
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        [containerView, tableView] .forEach { view in
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
            
        ])
    }
}
