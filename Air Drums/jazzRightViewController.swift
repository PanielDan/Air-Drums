//
//  ViewController.swift
//  Accelerometer Reader
//
//  Created by Danny on 11/14/15.
//  Copyright © 2015 Danny Pan. All rights reserved.
//

import UIKit
import WatchConnectivity
import WatchKit
import AVFoundation

class jazzRightViewController: UIViewController, WCSessionDelegate, AVAudioPlayerDelegate {

   let MIN_NUM_UPDATES = 5;

   var Jazz3 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("hihat-acoustic02", ofType: "wav")!);
   var Jazz4 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("openhat-slick", ofType: "wav")!);

   var audioPlayer11 : AVAudioPlayer?;
   var audioPlayer12: AVAudioPlayer?;

   // @IBOutlet weak var ViewText: UITextView!

   var arrayOfKeys:[String] = ["y", "z"]

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
      appDelegate.setSessionDelegate(self)

      do{
         audioPlayer11 = try AVAudioPlayer(contentsOfURL: Jazz3);
      } catch{
         audioPlayer11 = nil;
      }
      do{
         audioPlayer12 = try AVAudioPlayer(contentsOfURL: Jazz4);
      } catch{
         audioPlayer12 = nil;
      }
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }



   var yArray : NSMutableArray = [];
   var zArray : NSMutableArray = [];
   var counter = -1;    //this counter represents the number of updates that are called before the user hits the drum

   func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {



      if let yValue = message["y"] as? Double {
         if let zValue = message["z"] as? Double {

            dispatch_async(dispatch_get_main_queue(), { [unowned self] () -> Void in
               })

            print("\(yValue),\(zValue)")

            if ( (abs(yValue) > abs(zValue)) && (zValue < 0) ) {
               if (abs(yValue) - abs(zValue) > 0.6){
                  playSound(yValue, orientation: "y")
               }

            } else {
               if(zValue < -1.05) {
                  playSound(zValue, orientation: "z")
               }
            }

         }
      }
   }

   func playSound(acceleration: Double, orientation: String){


      let Zaxis = "z";
      let Yaxis = "y";

      let isEqualZ = (Zaxis == orientation);
      let isEqualY = (Yaxis == orientation);
      var percentage : Double;
      var volume : Double;

      percentage = acceleration / -4.0;
      volume = 2.0 * percentage;

      if isEqualZ == true{

         audioPlayer11?.volume =  Float(volume);
         audioPlayer11?.rate = 2.0;
         audioPlayer11?.prepareToPlay();
         audioPlayer11?.play();
      }
      else if isEqualY == true{

         audioPlayer12?.prepareToPlay();
         audioPlayer12?.volume = Float(volume);
         audioPlayer12?.prepareToPlay();
         audioPlayer12?.play()
      }
      
      
   }
   
   
}