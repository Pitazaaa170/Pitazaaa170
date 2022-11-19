

import UIKit

final class MarketViewController: UIViewController {
    
    private let presenter: MarketViewOutput
    
    private var marketView: MarketView {
        return self.view as? MarketView ?? MarketView()
    }
    
    var globalCurrency: GlobalCurrencies? {
        didSet {
            currencuesTableViewController.globalCurrencies = globalCurrency?.currencies
        }
    }
    
    
    lazy var currencuesTableViewController = GlobalCurrenciesTableViewController()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Валюты"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        return label
    }()
    
    init(presenter: MarketViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = MarketView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.presenter.viewDidLoadCurrencies()
        
    }
    
    // MARK: - Private
    
    private func configureUI() {
        self.addTitleLabel()
        self.addCurrencuesTableViewController()
        self.setupRefreshControl()
    }
    
    private func addTitleLabel() {
        self.view.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
    }
    
    private func addCurrencuesTableViewController() {
        self.addChild(currencuesTableViewController)
        self.view.addSubview(currencuesTableViewController.view)
        currencuesTableViewController.didMove(toParent: self)
        currencuesTableViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.currencuesTableViewController.view.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).inset(-10)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupRefreshControl(){
        currencuesTableViewController.currenciesTableView.tableView.refreshControl?.addTarget(self, action: #selector(refreshNews), for: .valueChanged)
    }
    
    @objc private func refreshNews(){
        presenter.viewDidLoadCurrencies()
        currencuesTableViewController.currenciesTableView.tableView.refreshControl?.endRefreshing()
    }
    
}

extension MarketViewController: MarketViewInput {
   
    func updateCurrencies(currency: GlobalCurrencies) {
        DispatchQueue.main.async {
            self.globalCurrency = currency
        }
    }
    
}

