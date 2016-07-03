//
//  SportViewController.swift
//  FitnessApp
//
//  Created by Apple on 16/6/5.
//  Copyright © 2016年 NJU. All rights reserved.
//

import UIKit

class SportViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var leftNum: UILabel!
    
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func CountTap(sender: UITapGestureRecognizer) {
        leftNum.text=String((leftNum.text! as NSString).intValue-1)
        showAlert(rateOfSchedule: 2)
    }
    
    func showAlert(rateOfSchedule rate: Int){
        
        let alertVC = UIAlertController(title: "完成情况", message: "第\(rate)组计划已经完成，休息一下吧！", preferredStyle: UIAlertControllerStyle.Alert )
        
        let acSure = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default , handler:nil)
    
        alertVC.addAction(acSure)
    
        self.presentViewController(alertVC, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
