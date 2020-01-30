//
//  DescVc.swift
//  wanderfinal
//
//  Created by MacStudent on 2020-01-30.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class DescVc: UIViewController {

  
    
    
    @IBOutlet weak var UserName: UITextField!
   

    @IBOutlet weak var Birthday: UITextField!
    
    @IBOutlet weak var Gender: UILabel!
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var Latitude: UITextField!
    @IBOutlet weak var Longitude: UITextField!

    
    let datepicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createdatepicker()
    }
    
    func createdatepicker()  {
 

        Birthday.inputView = datepicker
        
        let toolbar = UIToolbar()
      
        toolbar.sizeToFit()
        
    let donebutton = UIBarButtonItem(barButtonSystemItem: .done, target: nil,action:#selector(doneclicked))
    toolbar.setItems([donebutton], animated: true)
        
        Birthday.inputAccessoryView = toolbar
    }
    

    
    @IBAction func selectDate(_ sender: Any) {
    
        Birthday.text = "\(datepicker.date)"
        self.view.endEditing(true)
    
    }
    

    @IBAction func selectGender(_ sender: Any) {

    
    }

    
    @objc func doneclicked(){

        Birthday.text = "\(datepicker.date)"
        self.view.endEditing(true)
    }
    
    
    
    
    
    @IBAction func Save(_ sender: Any) {
   
    
    print("saved")
    
    }
    
    

    
    
    


}
