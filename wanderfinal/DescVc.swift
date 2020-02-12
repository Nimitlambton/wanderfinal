//
//  DescVc.swift
//  wanderfinal
//
//  Created by MacStudent on 2020-01-30.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import MapKit
import CoreData
class DescVc: UIViewController  {

    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var Birthday: UITextField!
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var Latitude: UITextField!
    @IBOutlet weak var Longitude: UITextField!
    @IBOutlet weak var pickgender: UIPickerView!
    @IBOutlet weak var Gender: UILabel!
    @IBOutlet weak var countrylabel: UILabel!
     var p = [Person]()
     var persondesc :Person?
    
    var pickerData: [String] = [String]()
    let datepicker = UIDatePicker()
    var countryname : String?
    var image: UIImage?

    var save = true
    var indexEdit :Int?
    
        var personlist = [Person]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        createdatepicker()
        pickgender.isHidden = true
       countrylabel.text  = countryname
    
           p = fetchRecords()
        
        if indexEdit != nil {
                  
                  print(p[indexEdit!])
              
                  persondesc = p[indexEdit!]
//
//                  longi.text = String( p[indexEdit!].long)
//                  lat.text = String( p[indexEdit!].lat)
//                  locationTitle.text = String(p[indexEdit!].locationtitle!)
//                  locationSubtitle.text = String(p[indexEdit!].locationsubtitile!)

            UserName.text = String( p[indexEdit!].name!)
           // Birthday.text = String(p[indexEdit!].birthday!)
            Gender.text  = String (p[indexEdit!].gender!)
            countrylabel.text =  String(p[indexEdit!].country!)
            Latitude.text = String(p[indexEdit!].lat)
            Longitude.text = String(p[indexEdit!].lad)
                  
              }
        if p[indexEdit!].hasPhoto {
          if let theImage = p[indexEdit!].photoImage {
                   show(image: theImage)
                 }
        }
        
        
    }
 
    
    
    func fetchRecords() -> [Person]{
          //
           let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
           
           do{
               personlist = try ViewController.managedContext.fetch(fetchRequest)
           }catch{
               print(error)
           }
           return personlist
       }

    @IBAction func selectcon(_ sender: Any) {

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
 
 

    @IBAction func SelectG(_ sender: Any) {
    pickgender.isHidden = false
    pickgender.dataSource = self
   pickgender.delegate = self
   pickerData = ["Male","Female","other"]
    }

    
    @IBAction func Save(_ sender: Any) {

        let slad = Double(Latitude.text!)
        let slon = Double(Longitude.text!)
        
      let cpp = Person(context: ViewController.managedContext)
       cpp.name = UserName.text
        cpp.country = countryname
        cpp.gender = Gender.text
        //cpp.birthday = Date(Birthday.text)
       
        
        if let image = image {
         
            if cpp.hasPhoto {
            
            cpp.photoID = Person.nextPhotoID() as NSNumber
        
            print("this is pohotot\(cpp.photoID)")
          
            
            }
            if let data = image.jpegData(compressionQuality: 0.5) {
                
            do {
               
              try data.write(to: cpp.photoURL, options: .atomic)
            } catch {
              
                print("Error writing file: \(error)")
            
                }
          }
        }
        
        cpp.lat = slad! ?? 0.0
        
        cpp.lad = slon! ?? 0.0

        try! ViewController.managedContext.save()
        print("saved S")
   
         let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ListView") as? ListView
        
        self.navigationController?.popToRootViewController(animated: true)
     
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
    
    
    
    

