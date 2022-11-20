

import UIKit

final class UnregUsersViewController: UIViewController {
    
    private let presenter: UnregUsersViewPresenter
    
    private var unregUsersView: UnregUsersView {
        return self.view as? UnregUsersView ?? UnregUsersView()
    }
    
    var unregUsers: [UnregisteredUser]? {
        didSet {
            unregUsersTableViewController.unregUsers = unregUsers
        }
    }
    
    lazy var unregUsersTableViewController = UnregUsersTableViewController()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Заявки"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        return label
    }()
    
    init(presenter: UnregUsersViewPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = UnregUsersView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.presenter.viewDidLoadUnregUsers()
        
    }
    
    // MARK: - Private
    
    private func configureUI() {
        self.addTitleLabel()
        self.addUnregUsersTableViewController()
    }
    
    private func addTitleLabel() {
        self.view.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
    }
    
    private func addUnregUsersTableViewController() {
        self.addChild(unregUsersTableViewController)
        self.view.addSubview(unregUsersTableViewController.view)
        unregUsersTableViewController.didMove(toParent: self)
        unregUsersTableViewController.view.translatesAutoresizingMaskIntoConstraints = false
        unregUsersTableViewController.approveDelegate = self
        self.unregUsersTableViewController.view.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).inset(-10)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}

extension UnregUsersViewController: UnregUsersViewInput {
    
    func updateUnregUsers(users: [UnregisteredUser]) {
        self.unregUsers = users
    }
    
}

extension UnregUsersViewController: ApproveUserProtocol {
    func approveUser(id: Int, clouser: (() -> Void)?) {
        presenter.didApproveUser(id: id, clouser: clouser)
    }
    
    func rejectUser(id: Int, clouser: (() -> Void)?) {
        presenter.didRejectUser(id: id, clouser: clouser)

    }
    
}

