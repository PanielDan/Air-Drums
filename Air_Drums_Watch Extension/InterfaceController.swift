//
//  InterfaceController.swift
//  Accelerometer Reader WatchKit Extension
//
//  Created by Danny on 11/14/15.
//  Copyright © 2015 Danny Pan. All rights reserved.
//

import WatchKit
import WatchConnectivity
import Foundation


class InterfaceController: WKInterfaceController {

   var statManager = DataManager()

   @IBOutlet var ScreenText: WKInterfaceLabel!

   func update() {
      if let accelerationData: [String: Double] = statManager.pullData() {
         let session = WCSession.defaultSession()
         session.sendMessage(accelerationData, replyHandler: nil, errorHandler: { (error) -> Void in
            print("Error message: \(error)")
         })


         //string = "X value: \(accelerationData["x"])\nY value: \(accelerationData["y"])\nZ value: \(accelerationData["z"])"
         //ScreenText.setText(string)
      }
   }

   override func awakeWithContext(context: AnyObject?) {
      super.awakeWithContext(context)
      statManager.startAccelerometer();
      NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: "update", userInfo: nil, repeats: true)

      // Configure interface objects here.
   }

   override func willActivate() {
      // This method is called when watch view controller is about to be visible to user
      super.willActivate()
   }

   override func didDeactivate() {
      // This method is called when watch view controller is no longer visible
      super.didDeactivate()
   }



}
