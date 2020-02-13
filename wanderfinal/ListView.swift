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
    
      var filter = [Person]()
  
    var nodata = false
    
    
    
    @IBOutlet weak var search: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        p = fetchRecords()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
   
           p = fetchRecords()
        filter = p
       
            mytab.reloadData()
           
        search.delegate = self
        
        let nib1 = UINib.init(nibName: "nodatacell", bundle: nil)
       
        self.mytab.register(nib1, forCellReuseIdentifier:
            
            "nodatacell")
        
       }
    
    
    // MARK: - Properties
       lazy var dateFormatter: DateFormatter = {
         let formatter = DateFormatter()
         formatter.dateStyle = .short
         return formatter
       }()
    
    
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
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        
      
    
        if (filter.count <= 0){
            nodata = false
            return 1
        }
        else{
            
            nodata = true
        }
   
    
       return filter.count
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        if !nodata{
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "nodatacell", for: indexPath) as! nodatacell
            
            return cell
            
        }else{
            
  
     let cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath) as! cellcontrol
    cell.name.text = filter[indexPath.row].name
            cell.birthday.text = "\(dateFormatter.string(from: p[indexPath.row].birthday!))"
    cell.gender.text =  filter[indexPath.row].gender
    cell.country.text = filter[indexPath.row].country
        cell.img.image = filter[indexPath.row].photoImage
        return cell
   
        }
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "abc") as? DescVc
        
        vc?.indexEdit = indexPath.row
        vc?.save = false
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     
        guard let personToDelete = p[indexPath.row].self as? Person,
        
                 editingStyle == .delete else {
               
                     return
           }

             ViewController.managedContext.delete(personToDelete)
          
           do {
             try ViewController.managedContext.save()
                p.remove(at: indexPath.row)
            mytab.reloadData()
           } catch let error as NSError {
             print("Saving error: \(error), description: \(error.userInfo)")
           }
        
        
      
     
     }
    
    
    func delerec( persomntodel: Person ){
        
      try! ViewController.managedContext.delete(persomntodel)
      try! ViewController.managedContext.save()
        
    }
    
    
    
    
}
extension ListView : UISearchBarDelegate{
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        
        
        filter = searchText.isEmpty ? p:p.filter({ (userdetail:Person) -> Bool in
            return userdetail.name?.range(of: searchText , options: .caseInsensitive) != nil
   
            
        }
        
            
            
        )
        
   
        
        if (filter.count <= 0){
                       
                       nodata = false
                   }
                   else{
                       
                       nodata = true
                   }
                   mytab.reloadData()
        
    }
    
    
}






