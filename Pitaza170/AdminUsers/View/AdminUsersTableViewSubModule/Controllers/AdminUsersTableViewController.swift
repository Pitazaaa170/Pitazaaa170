//
//  CurrenciesTableViewController.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import UIKit

class AdminUsersTableViewController: UIViewController {
            
    var adminUsersTableView: AdminUsersTableView {
        return self.view as? AdminUsersTableView ?? AdminUsersTableView()
    }
    
    weak var blockDelegate: BlockDelegateProtocol?
    
    var users:[UserForAdmin]? {
        didSet {
            DispatchQueue.main.async {
                self.adminUsersTableView.tableView.reloadData()
               }
        }
    }
    
    override func loadView() {
        super.loadView()
        self.view = AdminUsersTableView()
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
    }
  
    func setupTableView() {
        adminUsersTableView.tableView.register(AdminUsersTableViewCell.self, forCellReuseIdentifier: AdminUsersTableViewCell.identifier)
        adminUsersTableView.tableView.delegate = self
        adminUsersTableView.tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        view.applyGradient(
            colors: [.green, .purple],
            startPoint: .zero,
            endPoint: CGPoint(x: 1, y: 1)
        )
    }
    
    
    
}

extension AdminUsersTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = adminUsersTableView.tableView.dequeueReusableCell(withIdentifier: AdminUsersTableViewCell.identifier,for: indexPath) as? AdminUsersTableViewCell
        else {
            return UITableViewCell()
        }
            guard let user = users?[indexPath.row] else {return cell}
        cell.configure(id: user.id, name: user.name, surname: user.surname, role: user.role, blocked: user.blocked)
        
        cell.blockDelegate = self
        
        return cell
    }
    
}

extension AdminUsersTableViewController: BlockDelegateProtocol {
    func blockUser(id: Int) {
        blockDelegate?.blockUser(id: id)
    }
    
    func unblockUser(id: Int) {
        blockDelegate?.unblockUser(id: id)
    }
    
    
}
