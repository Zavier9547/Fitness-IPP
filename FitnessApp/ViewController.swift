//
//  ViewController.swift
//  FitnessApp
//
//  Created by Apple on 16/5/24.
//  Copyright © 2016年 NJU. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate {

    @IBOutlet weak var record: UIButton!

    
    var trainingvolumes = [TrainingVolume]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let savedTrainingVolumes=loadTrainingVolumes(){
            trainingvolumes += savedTrainingVolumes
        } else {
            loadSampleTrainingVolumes()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func unwindToMain(sender: UIStoryboardSegue){
        

        
        if let sourceViewController = sender.sourceViewController as? SportViewController, trainingVolume = sourceViewController.trainingVolume {
            
 
            
            if trainingvolumes.last!.day==trainingVolume.day {
                trainingvolumes[trainingvolumes.endIndex-1].volume += trainingVolume.volume
            } else {
                trainingvolumes.append(trainingVolume)
            }
            saveTrainingVolumes()
        }
    }
    
    func loadSampleTrainingVolumes(){
        var s_trainingvolumes=[TrainingVolume]()
        s_trainingvolumes.append(TrainingVolume(year: 2016,month: 7,day: 1,volume: 20)!)
        s_trainingvolumes.append(TrainingVolume(year: 2016,month: 7,day: 2,volume: 20)!)
        s_trainingvolumes.append(TrainingVolume(year: 2016,month: 7,day: 3,volume: 25)!)
        s_trainingvolumes.append(TrainingVolume(year: 2016,month: 7,day: 4,volume: 20)!)
        s_trainingvolumes.append(TrainingVolume(year: 2016,month: 7,day: 5,volume: 25)!)
        s_trainingvolumes.append(TrainingVolume(year: 2016,month: 7,day: 6,volume: 35)!)
        s_trainingvolumes.append(TrainingVolume(year: 2016,month: 7,day: 7,volume: 39)!)
        s_trainingvolumes.append(TrainingVolume(year: 2016,month: 7,day: 8,volume: 41)!)
        s_trainingvolumes.append(TrainingVolume(year: 2016,month: 7,day: 9,volume: 39)!)
        s_trainingvolumes.append(TrainingVolume(year: 2016,month: 7,day: 10,volume: 40)!)
        s_trainingvolumes.append(TrainingVolume(year: 2016,month: 7,day: 11,volume: 50)!)
        s_trainingvolumes.append(TrainingVolume(year: 2016,month: 7,day: 12,volume: 55)!)
        s_trainingvolumes.append(TrainingVolume(year: 2016,month: 7,day: 13,volume: 55)!)
        s_trainingvolumes.append(TrainingVolume(year: 2016,month: 7,day: 14,volume: 0)!)
        
        trainingvolumes += s_trainingvolumes
        
    }
    
    func saveTrainingVolumes() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(trainingvolumes, toFile: TrainingVolume.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save trainingvolumes...")
        }
    }
    
    func  loadTrainingVolumes()-> [TrainingVolume]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(TrainingVolume.ArchiveURL.path!) as? [TrainingVolume]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier=="record"{
                        
            let dst=segue.destinationViewController as? RecordViewController
            
            dst!.trainingvolumes = trainingvolumes
            
        }
    }

}

