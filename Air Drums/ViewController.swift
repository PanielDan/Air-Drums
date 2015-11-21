//
//  ViewController.swift
//  Air Drums
//
//  Created by Michelle  Yin on 11/14/15.
//  Copyright © 2015 Michelle  Yin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.\



   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

   override func viewDidAppear(animated: Bool) {
      let nav = self.navigationController?.navigationBar
      // Set navigation background color
      nav?.barTintColor = UIColor(red:0.20, green:0.67, blue:0.74, alpha:1.0)
      nav?.tintColor = UIColor.whiteColor()

      let attributes = [
         NSForegroundColorAttributeName: UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0),
         NSFontAttributeName: UIFont(name: "Avenir", size: 25)!
      ]
      nav?.titleTextAttributes = attributes
   }

}

