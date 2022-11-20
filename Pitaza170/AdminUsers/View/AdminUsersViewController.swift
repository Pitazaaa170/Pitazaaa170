

import UIKit

final class AdminUsersViewController: UIViewController {
    
    private let presenter: AdminUsersViewOutput
    
    private var adminUsersView: AdminUsersView {
        return self.view as? AdminUsersView ?? AdminUsersView()
    }
    
    var users: [UserForAdmin]? {
        didSet {
            adminUsersTableViewController.users = users
        }
    }
    
    lazy var adminUsersTableViewController = AdminUsersTableViewController()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Пользователи"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        return label
    }()
    
    init(presenter: AdminUsersViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = AdminUsersView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.presenter.viewDidLoadUsers()
        
    }
    
    // MARK: - Private
    
    private func configureUI() {
        self.addTitleLabel()
        self.addUsersTableViewController()
    }
    
    private func addTitleLabel() {
        self.view.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
    }
    
    private func addUsersTableViewController() {
        self.addChild(adminUsersTableViewController)
        self.view.addSubview(adminUsersTableViewController.view)
        adminUsersTableViewController.didMove(toParent: self)
        adminUsersTableViewController.view.translatesAutoresizingMaskIntoConstraints = false
        adminUsersTableViewController.blockDelegate = self
        self.adminUsersTableViewController.view.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).inset(-10)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}

extension AdminUsersViewController: AdminUsersViewInput {
    
    func updateUsers(users: [UserForAdmin]) {
        DispatchQueue.main.async {
            self.users = users
        }
    }
}

extension AdminUsersViewController: BlockDelegateProtocol {
    
    func blockUser(id: Int) {
        presenter.didBlockUser(id: id)
    }
    
    func unblockUser(id: Int) {
        presenter.didUnblockUser(id: id)
    }
    
}

