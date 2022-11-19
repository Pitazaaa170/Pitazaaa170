

import UIKit

final class BagViewController: UIViewController {
    
    private let presenter: BagViewOutput
    
    private var bagView: BagView {
        return self.view as? BagView ?? BagView()
    }
    
    var userCurrency: UserCurrencies {
        didSet {
            currencuesTableViewController.userCurrencies = userCurrency.currencies
        }
    }
    
    lazy var balanceViewController = BalanceViewController(balance: "1", grow: "+1")
    
    lazy var currencuesTableViewController = CurrenciesTableViewController()
    
    var inputRublesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ввод рублей", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = UIColor(red: 58/255, green: 41/255, blue: 100/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var outputRublesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ввод рублей", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = UIColor(red: 38/255, green: 55/255, blue: 53/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(presenter: BagViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = BagView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.presenter.viewDidLoadCurrencies()
        self.presenter.viewDidLoadRubles()
    }
    
    // MARK: - Private
    
    private func configureUI() {
        self.addBalanceViewController()
        self.addButtons()
        self.addCurrencuesTableViewController()
    }
    
    private func addBalanceViewController() {
        self.addChild(self.balanceViewController)
        self.view.addSubview(self.balanceViewController.view)
        self.balanceViewController.didMove(toParent: self)
        self.balanceViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.balanceViewController.view.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(55)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(200)
        }
    }
    
    private func addButtons() {
        self.view.addSubview(self.inputRublesButton)
        self.view.addSubview(self.outputRublesButton)
        self.inputRublesButton.snp.makeConstraints { make in
            make.top.equalTo(self.balanceViewController.view.snp.bottom).inset(-20)
            make.left.equalToSuperview().inset(30)
            make.right.equalTo(self.bagView.snp.centerX).inset(15)
            make.height.equalTo(50)
        }
        self.outputRublesButton.snp.makeConstraints { make in
            make.top.equalTo(self.inputRublesButton.snp.bottom).inset(-20)
            make.left.equalToSuperview().inset(30)
            make.right.equalTo(self.bagView.snp.centerX).inset(15)
            make.height.equalTo(50)
        }
    }
    
    private func addCurrencuesTableViewController() {
        self.addChild(currencuesTableViewController)
        self.view.addSubview(currencuesTableViewController.view)
        currencuesTableViewController.didMove(toParent: self)
        currencuesTableViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.currencuesTableViewController.view.snp.makeConstraints { make in
            make.top.equalTo(self.outputRublesButton.snp.bottom).inset(-20)
            make.left.right.equalToSuperview().inset(30)
            make.bottom.equalToSuperview()
        }
    }
    
    override func viewDidLayoutSubviews() {
        inputRublesButton.layer.cornerRadius = inputRublesButton.frame.height/2
        inputRublesButton.layer.masksToBounds = true
        
        outputRublesButton.layer.cornerRadius = inputRublesButton.frame.height/2
        outputRublesButton.layer.masksToBounds = true
    }
}

extension BagViewController: BagViewInput {
    
    func showInputRublesView() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Ввод рублей", message: nil, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default){ (action: UIAlertAction) in
                if let text = alert.textFields?.first?.text,
                   let count = Int(text)
                {
                    self.presenter.didInputedRubles(count: count)
                }
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert.addTextField { (textField: UITextField) in
                textField.placeholder = "Введите сумму"
            }
            
            alert.addAction(ok)
            alert.addAction(cancel)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showOutputRublesView() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Вывод рублей", message: nil, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default){ (action: UIAlertAction) in
                if let text = alert.textFields?.first?.text,
                   let count = Int(text)
                {
                    self.presenter.didOutputedRubles(count: count)
                }
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert.addTextField { (textField: UITextField) in
                textField.placeholder = "Введите сумму"
            }
            
            alert.addAction(ok)
            alert.addAction(cancel)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func updateRubles(rublesBalance: UserRubles) {
        DispatchQueue.main.async {
            self.balanceViewController.balanceValue = rublesBalance.balance
            self.balanceViewController.growValue = rublesBalance.grow
        }
    }
    
    func updateCurrencies(currency: UserCurrencies) {
        DispatchQueue.main.async {
            self.userCurrency = currency
        }
    }
    
    
}
