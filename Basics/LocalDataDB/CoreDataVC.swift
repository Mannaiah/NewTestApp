//
//  CoreDataVC.swift
//  Basics
//
//  Created by M Venkat  Rao on 4/4/19.
//  Copyright © 2019 M Venkat  Rao. All rights reserved.
//

import UIKit
import CoreData

class CoreDataVC: UIViewController ,UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var usersTableView: UITableView!
    @IBOutlet weak var userNameTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
     @IBOutlet weak var passwordTf: UITextField!
    var people: [NSManagedObject] = []
    //var userData = [UsersData]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "CoreDB"
    }
    override func viewWillAppear(_ animated: Bool) {
        self.readUserDataFromDb()
    }
    
  
    @IBAction func saveBtnAction(_ sender: UIButton) {
        
       createData()
        
    }
    @IBAction func deleteBtnAction(_ sender: UIButton) {
        
       delete()
        
    }
    
    @IBAction func updateBtnAction(_ sender: UIButton) {
     update()
        
        
    }
    @IBAction func getNameBtnAction(_ sender: UIButton) {
        
        getNameBasedOnId()
        
    }
    func createData() {
        guard  let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity =  NSEntityDescription.entity(forEntityName:"Users", in:managedContext)
        let user = NSManagedObject(entity:userEntity!, insertInto:managedContext)
        
        user.setValue(self.userNameTf.text!, forKeyPath:"username")
        user.setValue(self.emailTf.text!, forKeyPath:"email")
        user.setValue(self.passwordTf.text!, forKeyPath:"password")
        
        do {
            try managedContext.save()
            people.append(user)
        } catch let error as NSError{
            print("Could not save .\(error)")
        }
        //        userData = [UsersData(userNmae:self.userNameTf.text!, email: self.emailTf.text!, password: self.passwordTf.text!)]
        self.readUserDataFromDb()
        
        
        
    }
    func readUserDataFromDb(){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Users")
        
        //3
        do {
            people = try managedContext.fetch(fetchRequest)
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        userNameTf.text=""
        emailTf.text=""
        passwordTf.text=""
        if people.count > 0{
            self.usersTableView.reloadData()
        }
        
    }
    
    func update(){
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Users")
        fetchRequest.predicate = NSPredicate(format:"username = %@",self.userNameTf.text!)
        
        //3
        do {
            let test = try managedContext.fetch(fetchRequest)
            let objectUpdate = test[0] as! NSManagedObject
            objectUpdate.setValue(self.userNameTf.text!, forKeyPath:"username")
            objectUpdate.setValue(self.emailTf.text!, forKeyPath:"email")
            objectUpdate.setValue(self.passwordTf.text!, forKeyPath:"password")
            
            do {
                try managedContext.save()
            } catch  {
                print("updateError-->",error)
            }
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        userNameTf.text=""
        emailTf.text=""
        passwordTf.text=""
        self.readUserDataFromDb()
        
    }
    
    
    func delete(){
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Users")
        fetchRequest.predicate = NSPredicate(format:"username = %@",self.userNameTf.text!)
        
        //3
        do {
            let test = try managedContext.fetch(fetchRequest)
            let deleteObj = test[0] as! NSManagedObject
           managedContext.delete(deleteObj)
            
            do {
                try managedContext.save()
            } catch  {
                print("updateError-->",error)
            }
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        userNameTf.text=""
        emailTf.text=""
        passwordTf.text=""
        self.readUserDataFromDb()
        
    }
    
    func getNameBasedOnId(){
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Users")
        fetchRequest.predicate = NSPredicate(format:"username = %@",self.userNameTf.text!)
        
        //3
        do {
            let test = try managedContext.fetch(fetchRequest)
            let objectUpdate = test[0] as! NSManagedObject
            
            self.userNameTf.text = objectUpdate.value(forKeyPath:"username") as! String
            self.emailTf.text = objectUpdate.value(forKeyPath:"email") as! String
            self.passwordTf.text = objectUpdate.value(forKeyPath:"password") as! String
            
            do {
                try managedContext.save()
            } catch  {
                print("updateError-->",error)
            }
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
       
        
    }
    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //this method is giving the row count of table view which is
        //total number of heroes in the list
        return people.count
    }
    
    
    //this method is binding the hero name with the tableview cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
       
       let user = people[indexPath.row]
        cell.textLabel?.text = user.value(forKeyPath: "username") as? String
        cell.detailTextLabel?.text = user.value(forKeyPath: "email") as? String
        return cell
    }
}
