//
//  BalanceViewController.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 18.11.2022.
//
import UIKit

final class InfoCurViewController: UIViewController {
    
    private var infoView: InfoCurView {
        return self.view as? InfoCurView ?? InfoCurView()
    }
    
    private let photoService = PhotoService(container: UITableView())


    var infoValue: GlobalCurrency! {
        didSet {
            if let image = photoService.photo(byUrl: infoValue.image, completion: { newImage in
                DispatchQueue.main.async {
                    self.infoView.updateImage(newImage: newImage)
                }
            })
        {
                DispatchQueue.main.async {
                    self.infoView.updateInfo(imageNew: image,
                                             name: self.infoValue.name, 
                                             descr: self.infoValue.description,
                                             balance: self.infoValue.balance,
                                             grow: self.infoValue.grow,
                                             positive: self.infoValue.positive)
                }
            } else {
                DispatchQueue.main.async {
                    self.infoView.updateInfo(imageNew: UIImage(),
                                             name: self.infoValue.name,
                                             descr: self.infoValue.description,
                                             balance: self.infoValue.balance,
                                             grow: self.infoValue.grow,
                                             positive: self.infoValue.positive)
                }
            }
        }
    }
    
    // MARK: - Init
    init(info: GlobalCurrency) {
        self.infoValue = info
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        self.view = InfoCurView(frame: CGRect(x: self.view.frame.width / 5, y: self.view.frame.width / 5, width: self.view.frame.width * 0.8 , height: self.view.frame.height * 0.3 ))
        if let image = photoService.photo(byUrl: infoValue.image, completion: { newImage in
            DispatchQueue.main.async {
                self.infoView.updateImage(newImage: newImage)
            }
        })
    {
            DispatchQueue.main.async {
                self.infoView.updateInfo(imageNew: image,
                                         name: self.infoValue.name,
                                         descr: self.infoValue.description,
                                         balance: self.infoValue.balance,
                                         grow: self.infoValue.grow,
                                         positive: self.infoValue.positive)
            }
        } else {
            DispatchQueue.main.async {
                self.infoView.updateInfo(imageNew: UIImage(),
                                         name: self.infoValue.name,
                                         descr: self.infoValue.description,
                                         balance: self.infoValue.balance,
                                         grow: self.infoValue.grow,
                                         positive: self.infoValue.positive)
            }
        }
    
    }
    
    override func viewDidLayoutSubviews() {
        view.applyGradient(
            colors: [.myPurple, .myGreen],
            startPoint: .zero,
            endPoint: CGPoint(x: 1, y: 1)
        )
    }
    
    
}
