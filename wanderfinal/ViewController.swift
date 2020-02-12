//
//  ViewController.swift
//  wanderfinal
//
//  Created by MacStudent on 2020-01-29.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import  CoreData

class ViewController: UIViewController {

    static var managedContext: NSManagedObjectContext!

    @IBOutlet weak var Mapview: UIView!
    @IBOutlet weak var ListView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
   
    
    
    @IBAction func add(_ sender: Any) {
    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "abc") as? DescVc
         
        
         vc?.save = true
         self.navigationController?.pushViewController(vc!, animated: true)
    
    }
    
    
}

