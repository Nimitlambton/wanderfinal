//
//  MapView.swift
//  wanderfinal
//
//  Created by MacStudent on 2020-01-30.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class MapView: UIViewController {

    @IBOutlet weak var mymap: MKMapView!
  
    var locations = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        updateLocations()
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
           
           
       updateLocations()
        
       }
    
    
    
      func updateLocations() {

         mymap.removeAnnotations(locations)
         
         let entity = Person.entity()
       
          let fetchreq = NSFetchRequest<Person>()
         
          fetchreq.entity = entity
         
         locations = try! ViewController.managedContext.fetch(fetchreq)
      
        mymap.addAnnotations(locations)
    
     }
    
    
    @objc func showLocationDetails(_ sender: UIButton){
        var buttontosend = 0
        let button = sender as UIButton
       buttontosend = button.tag
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "abc") as? DescVc
               
       vc?.indexEdit = buttontosend
        vc?.save = false
        self.navigationController?.pushViewController(vc!, animated: true)
    
    }
   

}
extension MapView : MKMapViewDelegate{
    
    

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
       
        guard annotation is Person else {
         
            return nil
        }
        //2


        let identifier = "Location"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

         if annotationView == nil {
          let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)

            //3
          pinView.isEnabled = true
          pinView.canShowCallout = true
          pinView.animatesDrop = true
          pinView.pinTintColor = UIColor(hue: 0.1333, saturation: 1, brightness: 1, alpha: 1.0) 

            //4 button type detailDisclorse
            let rightButton = UIButton(type: .contactAdd)

            //This method takes one parameter, sender, that refers to the control that sent the action message. In this case, the sender will be the i button. That’s why the type of the sender parameter is UIButton.


            rightButton.addTarget(self, action: #selector(showLocationDetails), for: .touchUpInside)

            pinView.leftCalloutAccessoryView = rightButton
            annotationView = pinView
        }

        if let annotationView = annotationView {
          annotationView.annotation = annotation

            //5
            let button = annotationView.leftCalloutAccessoryView as! UIButton
            if let index = locations.firstIndex(of: annotation as! Person) {
            button.tag = index
          }
        }
        return annotationView
    }
    
}
