//
//  HistorySheetViewController.swift
//  Pitaza170
//
//  Created by Глеб Фандеев on 20.11.2022.
//

import UIKit

class HistorySheetVC: UIViewController, UISheetPresentationControllerDelegate {
    private let historyTable: UIViewController

    init(historyTable: UIViewController) {
        self.historyTable = historyTable
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSheetPresentation()
        setUpTableVC()
    }

    override func viewDidLayoutSubviews() {
        view.applyGradient(
            colors: [.green, .purple],
            startPoint: CGPoint(x: 0.5, y: 1),
            endPoint: CGPoint(x: 0.5, y: 0.4)
        )
    }

    private func setUpSheetPresentation() {
        sheetPresentationController?.delegate = self
        sheetPresentationController?.selectedDetentIdentifier = .medium
        sheetPresentationController?.prefersGrabberVisible = true
        sheetPresentationController?.detents = [.medium(), .large()]
        isModalInPresentation = true // unable to hide VC
    }

    private func setUpTableVC() {
        historyTable.title = "История"
        addChild(historyTable)
        historyTable.view.frame = view.bounds
        view.addSubview(historyTable.view)
        historyTable.didMove(toParent: self)
    }
}
