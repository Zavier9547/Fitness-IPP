//
//  RecordViewController.swift
//  FitnessApp
//
//  Created by Apple on 16/6/5.
//  Copyright © 2016年 NJU. All rights reserved.
//

import UIKit
import Charts

class RecordViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!
    
    var days:[String]!
    
    var trainingvolumes = [TrainingVolume]()
    
    var test = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        days = [ "1"," 2"," 3"," 4"," 5",
                 "6"," 7"," 8"," 9","10",
                 "11","12","13","14","15",
                 "16","17","18","19","20",
                 "21","22","23","24","25",
                 "26","27","28","29","30","31"]
//        let numbers = [12.0,23,34,42,13,
//                       23,41,19,45,24,
//                       33,11,22,4,23,
//                       1,2,3,4,5,
//                       6,7,8,9,10,
//                       5,4,6,2,7,
//                       12]
        
        var numbers = [Double]()
        var i = 0
        
        
        for _ in 0...30{
            numbers.append(0)
        }
        
        i = 0
        for x in trainingvolumes{
            
            numbers[i]=Double(x.volume)
            i+=1

        }
        
        
        setChart(days, values: numbers)
        
        
    }

    func setChart(dataPoints:[String],values:[Double])
    {
        barChartView.noDataText = "you need wo provide data for the chart"
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count
        {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries,label:"每日训练量")
        let chartData = BarChartData(xVals: days,dataSet: chartDataSet)
        barChartView.data = chartData
        
        barChartView.descriptionText=""
        
        barChartView.xAxis.labelPosition = .Bottom
        
        barChartView.animate(xAxisDuration: 0.0, yAxisDuration: 1.5, easingOption: .EaseOutBack)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
    }
   
//    @IBAction func unwindToCharts(sender: UIStoryboardSegue){
//        
//        if let sourceViewController = sender.sourceViewController as? ViewController{
//            trainingvolumes = sourceViewController.trainingvolumes
//            print(trainingvolumes[0].volume)
//        }
//        
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
