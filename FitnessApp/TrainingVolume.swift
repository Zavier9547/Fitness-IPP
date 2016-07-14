//
//  trainingVolume.swift
//  FitnessApp
//
//  Created by Apple on 16/7/11.
//  Copyright © 2016年 NJU. All rights reserved.
//

import Foundation

class TrainingVolume:NSObject,NSCoding{
    
    var now: NSDate = NSDate()
    
    //MARK: Properties
    
    var year:Int
    var month:Int
    var day:Int
    var volume: Int
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("trainingVolume")
    
    
    //MARK: Types
    
    struct PropertyKey {
        static let yearKey = "year"
        static let monthKey = "month"
        static let dayKey = "day"
        static let volumeKey = "volume"
    }
    
    //MARK: Initialization
    
    init?(year: Int, month: Int, day: Int, volume: Int){
        self.year=year
        self.month=month
        self.day=day
        self.volume = volume
        
        super.init()
        
        if year==0 || month==0 || day==0 || volume < 0 {
            return nil
        }
    }
    
    //MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(year, forKey: PropertyKey.yearKey)
        aCoder.encodeObject(month, forKey: PropertyKey.monthKey)
        aCoder.encodeObject(day, forKey: PropertyKey.dayKey)
        aCoder.encodeObject(volume, forKey: PropertyKey.volumeKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        let year = aDecoder.decodeObjectForKey(PropertyKey.yearKey) as! Int
        let month = aDecoder.decodeObjectForKey(PropertyKey.monthKey) as! Int
        let day = aDecoder.decodeObjectForKey(PropertyKey.dayKey) as! Int
        
        let volume = aDecoder.decodeObjectForKey(PropertyKey.volumeKey) as! Int
        
        self.init(year: year, month: month, day: day, volume: volume)
    }
    
    
}