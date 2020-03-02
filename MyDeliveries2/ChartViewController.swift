//
//  ChartViewController.swift
//  MyDeliveries2
//
//  Created by Douglas Maltby on 3/1/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import UIKit
// add SA Fiori libraries
import SAPFoundation
import SAPFiori
import SAPCommon

// Change subclass from iOS UIViewController to FUIChartFloorplanViewController
// class ChartViewController: UIViewController {
class ChartViewController: FUIChartFloorplanViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Waiting Time"
        chartView.chartType = .bar

        chartView.dataSource = self
        summaryView.dataSource = self

        titleText.text = "Duration"
        status.text = "Tap chart for details"
        categoryAxisTitle.text = "Location"
        valuesAxisTitle.text = "Waiting time in hours"
    }

    // MARK: - Sample Data

    let chartSeriesTitles = ["Actual", "Target"]

    let chartCategoryTitles = ["Shipment picked up", "HONG-KONG", "AMSTERDAM", "LONDON-HEATHROW", "READING", "Delivered"]

    let chartData = [[2.0, 42.0, 32.0, 7.0, 5.0, 1.0]]
    
    
        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Formatters

private extension ChartViewController {

    private static let measurementFormatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        formatter.numberFormatter.maximumFractionDigits = 0
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
        return formatter
    }()

    private static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 0
        return formatter
    }()
}

// MARK: - FUIChartSummaryDataSource implementation

extension ChartViewController: FUIChartSummaryDataSource {

    func chartView(_ chartView: FUIChartView, summaryItemForCategory categoryIndex: Int) -> FUIChartSummaryItem? {

        let item = FUIChartSummaryItem()
        item.categoryIndex = categoryIndex
        item.isPreservingTrendHeight = false

        switch categoryIndex {

        case -1:
            item.isEnabled = false
            let values: [Measurement<UnitDuration>] = chartView.series.compactMap { series in
                let categoriesUpperBound = series.numberOfValues - 1
                guard let valuesInSeries = series.valuesInCategoryRange(0...categoriesUpperBound, dimension: 0) else { return nil }
                let hours = valuesInSeries.lazy.compactMap { $0 }.reduce(0.0, +)
                return Measurement(value: hours, unit: UnitDuration.hours)
            }
            item.valuesText = values.map { ChartViewController.measurementFormatter.string(from: $0) }
            item.title.text = "Total wait time"

        default:
            item.isEnabled = true
            let values = chartView.series.map { $0.valueForCategory(categoryIndex, dimension: 0)! }
            item.valuesText = values.map { ChartViewController.numberFormatter.string(for: $0)! }
            item.title.text = chartCategoryTitles[categoryIndex]
        }
        return item
    }
}

// MARK: - FUIChartViewDataSource implementation

extension ChartViewController: FUIChartViewDataSource {

    func numberOfSeries(in: FUIChartView) -> Int {
        return chartData.count
    }

    func chartView(_ chartView: FUIChartView, numberOfValuesInSeries seriesIndex: Int) -> Int {
        return chartData[seriesIndex].count
    }

    func chartView(_ chartView: FUIChartView, valueForSeries seriesIndex: Int, category categoryIndex: Int, dimension dimensionIndex: Int) -> Double? {
        return chartData[seriesIndex][categoryIndex]
    }

    func chartView(_ chartView: FUIChartView, formattedStringForValue value: Double, axis: FUIChartAxisId) -> String? {
        return ChartViewController.numberFormatter.string(for: value)!
    }

    func chartView(_ chartView: FUIChartView, titleForCategory categoryIndex: Int, inSeries seriesIndex: Int) -> String? {
        return chartCategoryTitles[categoryIndex]
    }
}
