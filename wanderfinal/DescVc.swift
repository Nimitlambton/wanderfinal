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
    
    var countryname : String?
    var image: UIImage?

    @IBOutlet weak var countrylabel: UILabel!
   
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        createdatepicker()
        
        pickgender.isHidden = true
        countrylabel.text  = countryname
        
    }
 

    
    func show(image: UIImage) {
    UserImage.image = image
    UserImage.isHidden = false
    }
    
    
    
    
    @IBAction func selectphoto(_ sender: Any) {
  
    choosePhotoFromLibrary()

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

extension DescVc:UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    func takePhotoWithCamera() {
    let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    

    }
    
    
    
    
        func choosePhotoFromLibrary() {
       
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        }
    
        // MARK:- Image Picker Delegates
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
          dismiss(animated: true, completion: nil)
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
          dismiss(animated: true, completion: nil)
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage

        
        if let theImage = image {
               show(image: theImage)
             }
             dismiss(animated: true, completion: nil)
           }
        
    }
    
    
    
    

