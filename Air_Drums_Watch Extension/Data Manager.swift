//
//  Data Manager.swift
//  Accelerometer Reader
//
//  Created by Danny on 11/14/15.
//  Copyright © 2015 Danny Pan. All rights reserved.
//

import Foundation
import CoreMotion

class DataManager: NSObject{

   var manager = CMMotionManager()

   func startAccelerometer(){
      if manager.accelerometerAvailable {
         manager.accelerometerUpdateInterval = 0.20
         manager.startAccelerometerUpdates()
      }
   }

   func pullData() ->[String: Double] {
      if let myData = manager.accelerometerData {
         let data: [String: Double] = [  "y": round(1000*myData.acceleration.y)/1000,
            "z": round(1000*myData.acceleration.z)/1000 ]
         return data
      }
      return [:]
   }
}