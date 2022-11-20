//
//  ChartViewController.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 20.11.2022.
//

import UIKit
import Charts

class ChartViewController: UIViewController, ChartViewDelegate {

    
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        chartView.backgroundColor = .clear
        chartView.xAxis.gridColor = .clear
        chartView.leftAxis.gridColor = .clear
        chartView.rightAxis.gridColor = .clear
        chartView.gridBackgroundColor = .clear
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.xAxis.drawGridLinesEnabled = false
        
        return chartView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(lineChartView)
        lineChartView.center = view.center
       setData()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func setData() {
        let set1 = LineChartDataSet(entries: [ChartDataEntry(x: 0.0, y: 2.1),ChartDataEntry(x: 1.0, y: 0.5),ChartDataEntry(x: 2.0, y: 1.1),
                                              ChartDataEntry(x: 3.0, y: 2.3),ChartDataEntry(x: 4.0, y: 0.1)], label: "a")
        
        set1.mode = .cubicBezier
        set1.drawCirclesEnabled = false
        set1.lineWidth = 0
        let gradientColors = [UIColor.myPurple.cgColor, UIColor.myGreen.cgColor, UIColor.black.cgColor] as CFArray
        let colorLocations:[CGFloat] = [1.0,0.5, 0.0]
        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations)
        set1.fill = LinearGradientFill(gradient: gradient!, angle: 90.0)
        set1.drawFilledEnabled = true
        
        let data = LineChartData(dataSet: set1)
        data.setDrawValues(false)
        lineChartView.data = data
        
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    override func viewWillLayoutSubviews() {
        view.applyGradient(
            colors: [.myPurple, .black],
            startPoint: CGPoint(x: 0.5, y: 0),
            endPoint: CGPoint(x: 0.5, y: 0.5)
        )
    }

}
