//
//  SportViewController.swift
//  FitnessApp
//
//  Created by Apple on 16/6/5.
//  Copyright © 2016年 NJU. All rights reserved.
//

import UIKit

class SportViewController: UIViewController {
    
    @IBOutlet weak var plan_label1: UILabel!
    @IBOutlet weak var plan_label2: UILabel!
    @IBOutlet weak var plan_label3: UILabel!
    @IBOutlet weak var plan_label4: UILabel!
    @IBOutlet weak var plan_label5: UILabel!
    
    @IBOutlet weak var groupNum: UILabel!
    @IBOutlet weak var leftNum: UILabel!
    
    var rate = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
 
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func save(sender: UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func CountTap(sender: UITapGestureRecognizer) {
        leftNum.text=String((leftNum.text! as NSString).intValue-1)
        if  (leftNum.text! as NSString).intValue <= 0 {
            showAlert(rateOfSchedule: rate)
            rate += 1
        }
    }
    
    @IBAction func finishGroup(sender: UIButton) {
        showAlert(rateOfSchedule: rate)
        rate += 1
    }
  
    @IBAction func finishAll(sender: UIButton) {
        showAlert(rateOfSchedule: 5)
    }
    
    
    
    func showAlert(rateOfSchedule rate: Int){
        
        if rate == 5 {
            let alertVC = UIAlertController(title: "完成情况", message: "整个计划已经完成啦，真棒，休息一下吧！", preferredStyle: UIAlertControllerStyle.Alert )
            
            let acSure = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default , handler:{
                action in
                self.navigationController?.popViewControllerAnimated(true)
            })
            
            alertVC.addAction(acSure)
            
            self.presentViewController(alertVC, animated: true, completion: nil)
        }
        
        let alertVC = UIAlertController(title: "完成情况", message: "第\(rate)组计划已经完成，休息一下吧！", preferredStyle: UIAlertControllerStyle.Alert )
        
        let acSure = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default , handler:{
            action in
            self.changeGroupText(rate+1);
        })
        
        alertVC.addAction(acSure)
    
        self.presentViewController(alertVC, animated: true, completion: nil)
    }
    
    func changeGroupText(rate:Int){
        switch rate {
        case 1:
            groupNum.text="第一组"
            leftNum.text=plan_label1.text
        case 2:
            groupNum.text="第二组"
            leftNum.text=plan_label2.text
        case 3:
            groupNum.text="第三组"
            leftNum.text=plan_label3.text
        case 4:
            groupNum.text="第四组"
            leftNum.text=plan_label4.text
        case 5:
            groupNum.text="第五组"
            leftNum.text=plan_label5.text
        default:
            "你不可能看到的彩蛋，O(∩_∩)O "
        }
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
