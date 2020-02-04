//
//  DescVc.swift
//  wanderfinal
//
//  Created by MacStudent on 2020-01-30.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class DescVc: UIViewController  {

    @IBOutlet weak var UserName: UITextField!
   

    @IBOutlet weak var Birthday: UITextField!
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var Latitude: UITextField!
    @IBOutlet weak var Longitude: UITextField!
    @IBOutlet weak var pickgender: UIPickerView!
    @IBOutlet weak var Gender: UILabel!
    
    var pickerData: [String] = [String]()
    let datepicker = UIDatePicker()
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createdatepicker()
        pickgender.isHidden = true

    }
    
    
    
    
    func createdatepicker()  {
 
        
        Birthday.inputView = datepicker
        
        let toolbar = UIToolbar()
      
        toolbar.sizeToFit()
        
   let donebutton = UIBarButtonItem(barButtonSystemItem: .reply, target: nil,action:#selector(doneclicked))
  
        toolbar.setItems([donebutton], animated: true)
        
        Birthday.inputAccessoryView = toolbar
    }

    @objc func doneclicked(){

        Birthday.text = "\(datepicker.date)"
        self.view.endEditing(true)
    }
 
    @IBAction func Save(_ sender: Any) {
   
    print("saved")
    
    }

    @IBAction func SelectG(_ sender: Any) {
        pickgender.isHidden = false
    pickgender.dataSource = self
   pickgender.delegate = self
   pickerData = ["Male","Female","other"]
    
                   let toolbar = UIToolbar()
                        
                          toolbar.sizeToFit()
                          
           let donebutton = UIBarButtonItem(barButtonSystemItem: .done, target: nil,action:#selector(doneclicked2))

               toolbar.setItems([donebutton], animated: true)

       
    
    }
    
 
    @objc func doneclicked2(){
     
        Gender.text = "helloworld"
        
    }

}

//descVC delegates
extension DescVc :UIPickerViewDelegate,
UIPickerViewDataSource{
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          return pickerData.count
      }
      
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
           return pickerData[row]

      }
  
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        print(pickerData[row])
        Gender.text = pickerData[row]
        pickgender.isHidden = true
        
    }
}

