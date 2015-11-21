//
//  Main_MenuTableViewCell.swift
//  Air Drums
//
//  Created by Michelle  Yin on 11/14/15.
//  Copyright © 2015 Michelle  Yin. All rights reserved.
//

import UIKit

class Main_MenuTableViewCell: UITableViewCell {

   //MARK: properties
   @IBOutlet weak var menuLabel: UILabel!
   @IBOutlet weak var iconImageView: UIImageView!

   //set colors for tablecells 
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }



}
