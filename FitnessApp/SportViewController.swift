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
