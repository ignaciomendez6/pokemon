//
//  DetailViewController.swift
//  Pokemon
//
//  Created by Nacho Mendez on 04/06/2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailView = DetailView()
    var index: Int
    var pokemonsVM: PokemonsVMprotocol
    var pokemonVM: PokemonVMprotocol
    
    init(index: Int,
         pokemonsVM: PokemonsVMprotocol,
         pokemonVM: PokemonVMprotocol) {
        self.index = index
        self.pokemonsVM = pokemonsVM
        self.pokemonVM = pokemonVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        loadData()
        
        title = pokemonsVM.pokemons?.results[self.index].name.uppercased()
    }
    
    private func loadData() {
        Task {
            do {
                try await pokemonVM.fetchPokemon()
                detailView.configureDetail(vm: pokemonVM, index: index)
            } catch MyErrors.invalidURL {
                showAlert(error: MyErrors.invalidURL.localizedDescription)
            } catch MyErrors.invalidResponse {
                showAlert(error: MyErrors.invalidResponse.localizedDescription)
            } catch MyErrors.invalidData {
                showAlert(error: MyErrors.invalidData.localizedDescription)
            } catch {
                showAlert(error: "Default error")
            }
        }
    }
    
    private func showAlert(error: String) {
        let alertController = UIAlertController(title: error, message: "Retry", preferredStyle: .alert)
        
        let actionOK = UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction!) in
            print("Aceptar presionado")
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        alertController.addAction(actionOK)
        
        self.present(alertController, animated: true, completion:nil)
    }
}


