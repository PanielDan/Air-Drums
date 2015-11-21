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

class eightRightViewController: UIViewController, WCSessionDelegate, AVAudioPlayerDelegate {

   let MIN_NUM_UPDATES = 5;

   var snare808 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("snare-808", ofType: "wav")!);
   var tom808 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("tom-808", ofType: "wav")!);

   var audioPlayer7 : AVAudioPlayer?;
   var audioPlayer8: AVAudioPlayer?;

   // @IBOutlet weak var ViewText: UITextView!

   var arrayOfKeys:[String] = ["y", "z"]

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
      appDelegate.setSessionDelegate(self)
      do{
         audioPlayer7 = try AVAudioPlayer(contentsOfURL: snare808);
      } catch{
         audioPlayer7 = nil;
      }
      do{
         audioPlayer8 = try AVAudioPlayer(contentsOfURL: tom808);
      } catch{
         audioPlayer8 = nil;
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

         audioPlayer7?.volume =  Float(volume);
         audioPlayer7?.rate = 2.0;
         audioPlayer7?.prepareToPlay();
         audioPlayer7?.play();
      }
      else if isEqualY == true{

         audioPlayer8?.prepareToPlay();
         audioPlayer8?.volume = Float(volume);
         audioPlayer8?.prepareToPlay();
         audioPlayer8?.play()
      }
      
      
   }
   
   
}
