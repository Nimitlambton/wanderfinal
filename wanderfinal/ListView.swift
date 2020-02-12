//
//  ListView.swift
//  wanderfinal
//
//  Created by MacStudent on 2020-01-30.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ListView: UIViewController {

    @IBOutlet weak var mytab: UITableView!
    
    var personlist = [Person]()
    
  var p = [Person]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        p = fetchRecords()
   

        
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

    
    
    
}


extension ListView :UITableViewDataSource , UITableViewDelegate{
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        p.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     let cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath) as! cellcontrol
  
    
    cell.name.text = p[indexPath.row].name
    cell.birthday.text = "\(String(describing: (p[indexPath.row].birthday)))"
    cell.gender.text =  p[indexPath.row].gender
    cell.country.text = p[indexPath.row].country
        cell.img.image = p[indexPath.row].photoImage
        return cell
   
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "abc") as? DescVc
        
        vc?.indexEdit = indexPath.row
        vc?.save = false
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    
    
}






