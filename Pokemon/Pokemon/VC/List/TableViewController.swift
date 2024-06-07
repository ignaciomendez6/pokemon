//
//  ViewController.swift
//  Pokemon
//
//  Created by Nacho Mendez on 04/06/2024.
//

import UIKit

final class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var tableView: TableView
    private var pokemonsVM: PokemonsVMprotocol
    
    init(tableView: TableView = TableView(), pokemonsVM: PokemonsVMprotocol = PokemonsVM()) {
        self.tableView = tableView
        self.pokemonsVM = pokemonsVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pokemons"
        
        view = tableView
        
        tableView.tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        tableView.tableView.delegate = self
        tableView.tableView.dataSource = self
        
        tableView.tableView.register(CellView.self, forCellReuseIdentifier: "Cell")
        
        loadData()
    }
    
    private func loadData() {
        Task {
            do {
                try await pokemonsVM.fetchPokemons()
                self.tableView.tableView.reloadData()
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
            self.loadData()
        }
        
        alertController.addAction(actionOK)
        
        self.present(alertController, animated: true, completion:nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        
        if yOffset > 20 {
            navigationItem.title = nil
        } else {
            navigationItem.title = "Pokemons"
        }
    }
    
    // MARK: - table delegates
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Pokemons"
    }
    
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonsVM.pokemons?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellView
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        cell.configureItem(vm: self.pokemonsVM, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigationController?.pushViewController(DetailViewController(
            index: indexPath.row,
            pokemonsVM: self.pokemonsVM,
            pokemonVM: PokemonVM(api: PokemonRepository(pokemon: self.pokemonsVM.pokemons?.results[indexPath.row].name ?? "charmander"))), animated: true)
    }
}

