//
//  CurrenciesTableViewController.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import UIKit

class GlobalCurrenciesTableViewController: UIViewController {
            
    var currenciesTableView: GlobalCurrenciesTableView {
        return self.view as? GlobalCurrenciesTableView ?? GlobalCurrenciesTableView()
    }
    
    private var photoService:PhotoService!

    var globalCurrencies:[GlobalCurrency]? {
        didSet {
            DispatchQueue.main.async {
                self.currenciesTableView.tableView.reloadData()
               }
        }
    }
    
    var filtered:[GlobalCurrency] = []
    
    var searchActive = false
    
    override func loadView() {
        super.loadView()
        self.view = GlobalCurrenciesTableView()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        photoService = PhotoService(container: currenciesTableView.tableView)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLayoutSubviews() {
        view.applyGradient(
            colors: [.myGreen, .myPurple],
            startPoint: .zero,
            endPoint: CGPoint(x: 1, y: 1)
        )
    }
    
    @objc func tapGesture() {
        currenciesTableView.searchBar.searchTextField.resignFirstResponder()
    }
    
    func setupTableView() {
        currenciesTableView.tableView.register(GlobalCurrenciesTableViewCell.self, forCellReuseIdentifier: GlobalCurrenciesTableViewCell.identifier)
        currenciesTableView.tableView.delegate = self
        currenciesTableView.tableView.dataSource = self
        currenciesTableView.searchBar.delegate = self
    }   
}

extension GlobalCurrenciesTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !searchActive {
            return globalCurrencies?.count ?? 0
        } else {
            return filtered.count

        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = currenciesTableView.tableView.dequeueReusableCell(withIdentifier: GlobalCurrenciesTableViewCell.identifier,for: indexPath) as? GlobalCurrenciesTableViewCell
        else {
            return UITableViewCell()
        }
        
        if !searchActive {
            guard let currency = globalCurrencies?[indexPath.row] else {return cell}
            cell.configure(curImage: photoService.photoAtIndexPath(atIndexPath: indexPath, byUrl: currency.image) ?? UIImage(),
                           name: currency.name,
                           description: currency.description,
                           balance: currency.balance,
                           grow: currency.grow,
                           positive: currency.positive)
        } else {
            let currency = filtered[indexPath.row]
            cell.configure(curImage: photoService.photoAtIndexPath(atIndexPath: indexPath, byUrl: currency.image) ?? UIImage(),
                           name: currency.name,
                           description: currency.description,
                           balance: currency.balance,
                           grow: currency.grow,
                           positive: currency.positive)
        }
        return cell
    }
    
}

extension GlobalCurrenciesTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
                
        filtered = globalCurrencies?.filter({ (currency) -> Bool in
            return currency.name.contains(searchText)
        }) ?? []
        searchActive = true
        self.currenciesTableView.tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true

    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        searchBar.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        searchBar.endEditing(true)
    }
    
}
