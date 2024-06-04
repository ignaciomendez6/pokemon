//
//  DetailViewController.swift
//  Pokemon
//
//  Created by Nacho Mendez on 04/06/2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    private lazy var detailView: DetailView = DetailView()
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Charmander"
        
    }
}


