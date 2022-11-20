//
//  CurrenciesTableViewController.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import UIKit

class UnregUsersTableViewController: UIViewController {
            
    var unregUsersTableView: UnregUsersTableView {
        return self.view as? UnregUsersTableView ?? UnregUsersTableView()
    }
    
    weak var approveDelegate: ApproveUserProtocol?
    
    var unregUsers:[UnregisteredUser]? {
        didSet {
            DispatchQueue.main.async {
                self.unregUsersTableView.tableView.reloadData()
               }
        }
    }
    
    override func loadView() {
        super.loadView()
        self.view = UnregUsersTableView()
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
        unregUsersTableView.tableView.register(UnregUsersTableViewCell.self, forCellReuseIdentifier: UnregUsersTableViewCell.identifier)
        unregUsersTableView.tableView.delegate = self
        unregUsersTableView.tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        view.applyGradient(
            colors: [.myDarkGreen, .myDarkPurple],
            startPoint: .zero,
            endPoint: CGPoint(x: 1, y: 1)
        )
    }
    
    
    
}

extension UnregUsersTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return unregUsers?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = unregUsersTableView.tableView.dequeueReusableCell(withIdentifier: UnregUsersTableViewCell.identifier,for: indexPath) as? UnregUsersTableViewCell
        else {
            return UITableViewCell()
        }
            guard let user = unregUsers?[indexPath.row] else {return cell}
        cell.configure(id: user.id, name: user.name, surname: user.surname, role: user.role)
        
        cell.approveDelegate = self
        
        return cell
    }
    
}

extension UnregUsersTableViewController: ApproveUserProtocol {
    func approveUser(id: Int, clouser: (() -> Void)?) {
        approveDelegate?.approveUser(id: id, clouser: {
            clouser?()
            if let index = self.unregUsers?.firstIndex(where: { $0.id == id}) {
                self.unregUsers?.remove(at: index)
            }
        })
        
    }
    
    func rejectUser(id: Int, clouser: (() -> Void)?) {
        approveDelegate?.rejectUser(id: id, clouser: {
            clouser?()
            if let index = self.unregUsers?.firstIndex(where: { $0.id == id}) {
                self.unregUsers?.remove(at: index)
            }
        })
    }
    
   
}
