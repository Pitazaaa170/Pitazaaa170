import UIKit
import SnapKit

final class CurrencyInfoViewController: UIViewController {
    
    private let presenter: CurrencyInfoViewOutput
    
    var infoCurModule: InfoCurViewController!
    
    var buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Купить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .myPurple
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buyCurrency), for: .touchUpInside)
        return button
    }()
    
    @objc func buyCurrency(){
        presenter.didTapBuyButton()
    }
    
    var sellButton: UIButton = {
        let button = UIButton()
        button.setTitle("Продать", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .myGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(sellCurrency), for: .touchUpInside)
        return button
    }()
    
    @objc func sellCurrency(){
        presenter.didTapSellButton()
    }
    
    init(presenter: CurrencyInfoViewOutput, info: GlobalCurrency) {
        self.presenter = presenter
        infoCurModule = InfoCurViewController(info: info)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    // MARK: - Private
    
    private func configureUI() {
        self.addBalanceViewController()
        self.addButtons()
    }
    
    private func addBalanceViewController() {
        self.addChild(self.infoCurModule)
        self.view.addSubview(self.infoCurModule.view)
        self.infoCurModule.didMove(toParent: self)
        self.infoCurModule.view.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(400)
        }
    }
    
    private func addButtons() {
        self.view.addSubview(self.buyButton)
        self.view.addSubview(self.sellButton)
        self.buyButton.snp.makeConstraints { make in
            make.top.equalTo(self.infoCurModule.view.snp.bottom).inset(-100)
            make.left.equalToSuperview().inset(30)
            make.height.equalTo(44)
            make.width.equalTo(150)
        }
        self.sellButton.snp.makeConstraints { make in
            make.top.equalTo(self.infoCurModule.view.snp.bottom).inset(-100)
            make.right.equalToSuperview().inset(30)
            make.height.equalTo(44)
            make.width.equalTo(150)
        }
    }
    
    override func viewDidLayoutSubviews() {
        buyButton.layer.cornerRadius = buyButton.frame.height/2
        buyButton.layer.masksToBounds = true
        
        sellButton.layer.cornerRadius = sellButton.frame.height/2
        sellButton.layer.masksToBounds = true
        
        view.applyGradient(
            colors: [.myPurple, .black],
            startPoint: CGPoint(x: 0.5, y: 0),
            endPoint: CGPoint(x: 0.5, y: 1)
        )
    }
}

extension CurrencyInfoViewController: CurrencyInfoViewInput {
    
    func showBuyView() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Покупка \(self.infoCurModule.infoValue.name)", message: nil, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default){ (action: UIAlertAction) in
                if let text = alert.textFields?.first?.text,
                   let count = Int(text)
                {
                    self.presenter.didInputedToBuy(count: count)
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
    
    func showSellView() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Продажа \(self.infoCurModule.infoValue.name)", message: nil, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default){ (action: UIAlertAction) in
                if let text = alert.textFields?.first?.text,
                   let count = Int(text)
                {
                    self.presenter.didOutputedToSell(count: count)
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
    
    func updateCurrencies(currency: GlobalCurrency) {
        DispatchQueue.main.async {
            self.infoCurModule.infoValue = currency
        }
    }
    
    
}
