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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = p[indexPath.row].name! + " " + "\(String(describing: p[indexPath.row].photoImage))" + " " + ""
        
        return cell
    }
    
    
    
    
}






