//
//  SqliteVC.swift
//  Basics
//
//  Created by M Venkat  Rao on 4/3/19.
//  Copyright © 2019 M Venkat  Rao. All rights reserved.
//

import UIKit
import SQLite3
import Darwin

class SqliteVC: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    var db:OpaquePointer!
    @IBOutlet weak var tableViewHeroes: UITableView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var ranking: UITextField!
    var heroList = [Hero]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      self.createSqlDb()
        self.navigationItem.title = "SqliteDB"
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.readValues()
    }
    func createSqlDb(){
        //the database file
        
        let fileUrl = try! FileManager.default.url(for:.documentDirectory, in:.userDomainMask, appropriateFor:nil, create:false).appendingPathComponent("HeroesDb.sqlite")
        print(" db path--> \(fileUrl))")
        //oening the dataBase
        if sqlite3_open(fileUrl.path,&db) != SQLITE_OK
        {
            print("Error Opening Db")
        }
        //Creating table
        if sqlite3_exec(db,"CREATE TABLE IF NOT EXISTS Heroes (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,powerrank INTEGER)",nil,nil ,nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        
    }
    @IBAction func SaveBtnAction(_ sender: UIButton) {
        let heroName = name.text?.trimmingCharacters(in:.whitespacesAndNewlines)
        let powerRank = ranking.text?.trimmingCharacters(in:.whitespacesAndNewlines)
        if (heroName?.isEmpty)!{
            name.layer.borderColor = UIColor.red.cgColor
        }
        if (powerRank?.isEmpty)!{
            ranking.layer.borderColor = UIColor.red.cgColor
        }
        var stmt:OpaquePointer?
        let queryString = "INSERT INTO Heroes(name,powerrank) VALUES(?,?)"
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        //binding the parameters
        if sqlite3_bind_text(stmt, 1,heroName, -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return
        }
        
        if sqlite3_bind_int(stmt, 2, (powerRank! as NSString).intValue) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return
        }
        //executing the query to insert values
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting hero: \(errmsg)")
            return
        }

        //emptying the textfields
        name.text=""
        ranking.text=""
          readValues()
        //displaying a success message
        print("Herro saved successfully")
        print(heroList)
    }
    @IBAction func deleteBtnAction(_ sender: UIButton) {
       
        self.delete()
        
    }
    
    @IBAction func updateBtnAction(_ sender: UIButton) {
        
        self.update()
        
    }
    @IBAction func getNameBtnAction(_ sender: UIButton) {
        
        self.getNameBasedOnId()
        
    }
    
    func update(){
        
        let heroName = name.text?.trimmingCharacters(in:.whitespacesAndNewlines)
        let updateQuery = "UPDATE Heroes SET name = \"\(heroName!)\" WHERE powerrank =\(ranking.text!)"
        var stmt: OpaquePointer? = nil
        if sqlite3_prepare(db, updateQuery, -1, &stmt, nil) == SQLITE_OK{
            if sqlite3_step(stmt) != SQLITE_DONE {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure update hero: \(errmsg)")
            }else{
                print("update Sucess--")
            }
        }
        sqlite3_finalize(stmt)
        //emptying the textfields
        name.text=""
        ranking.text=""
        self.readValues()
    }
    func delete(){
//         let heroName = name.text?.trimmingCharacters(in:.whitespacesAndNewlines)
        let deleteQuery = "DELETE FROM Heroes WHERE powerrank =\(ranking.text!)"
        var stmt: OpaquePointer? = nil
        if sqlite3_prepare(db, deleteQuery, -1, &stmt, nil) == SQLITE_OK{
            if sqlite3_step(stmt) != SQLITE_DONE {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure deleting hero: \(errmsg)")
            }else{
                print("Deleteing Sucess--")
            }
        }
        
        sqlite3_finalize(stmt)
        //emptying the textfields
        name.text=""
        ranking.text=""
        self.readValues()
    }
    
    func getNameBasedOnId(){
        
        let heroName = name.text?.trimmingCharacters(in:.whitespacesAndNewlines)
        //this is our select query
        let queryString = "SELECT * FROM Heroes  WHERE name = \"\(heroName!)\""
        
        //statement pointer
        var stmt:OpaquePointer?
        
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        //traversing through all the records
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let id = sqlite3_column_int(stmt, 0)
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let powerrank = sqlite3_column_int(stmt, 2)
            
            self.name.text = name
            self.ranking.text = "\(powerrank)"
        }
        sqlite3_finalize(stmt)
        self.readValues()
        
    }
    func readValues(){
        
        //first empty the list of heroes
        heroList.removeAll()
        
        //this is our select query
        let queryString = "SELECT * FROM Heroes"
        
        //statement pointer
        var stmt:OpaquePointer?
        
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        //traversing through all the records
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let id = sqlite3_column_int(stmt, 0)
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let powerrank = sqlite3_column_int(stmt, 2)
            
            //adding values to list
            heroList.append(Hero(id: Int(id), name: String(describing: name), powerRanking: Int(powerrank)))
            
        }
        
        if heroList.count > 0 {
             self.tableViewHeroes.reloadData()
        }
     
    }
    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //this method is giving the row count of table view which is
        //total number of heroes in the list
        return heroList.count
    }
    
    
    //this method is binding the hero name with the tableview cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        let hero: Hero
        hero = heroList[indexPath.row]
        cell.textLabel?.text = hero.name
        cell.detailTextLabel?.text = String(describing:hero.powerRanking)
        return cell
    }

}

class Hero {
    
    var id: Int
    var name: String?
    var powerRanking: Int
    
    init(id: Int, name: String?, powerRanking: Int){
        self.id = id
        self.name = name
        self.powerRanking = powerRanking
    }
}

