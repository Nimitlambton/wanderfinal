//
//  ViewController.swift
//  wanderfinal
//
//  Created by MacStudent on 2020-01-29.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


  
    @IBOutlet weak var Mapview: UIView!

    @IBOutlet weak var ListView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func Switch(_ sender: UISegmentedControl) {
   
    
        if sender.selectedSegmentIndex == 0{
            
            ListView.alpha = 0
            Mapview.alpha = 1
            
            
        }
        else{
            
            Mapview.alpha = 0
            ListView.alpha = 1
            
        }
    
        
    }
    
    
}

