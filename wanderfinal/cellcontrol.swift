//
//  cellcontrol.swift
//  wanderfinal
//
//  Created by Nimit on 2020-02-08.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class cellcontrol: UITableViewCell {

    

    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var country: UILabel!
    
    @IBOutlet weak var img: UIImageView!
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
