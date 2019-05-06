//
//  ViewController.swift
//  Basics
//
//  Created by M Venkat  Rao on 4/1/19.
//  Copyright © 2019 M Venkat  Rao. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
var TopicsNames = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TopicsNames = ["Notifications","Sqlite","CoreData","ServicesVC","QuizVc"]
        self.navigationItem.title = "SelectTopic"
        
        
    }
  
}
extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TopicsNames.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
    return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier:"Cell")
        customCell?.textLabel?.text  = (TopicsNames.object(at:indexPath.row) as! String)
        return customCell!
    }
    
    
    
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let SelectIndex = indexPath.row
        
        switch SelectIndex {
        case 0:
            let obj = self.storyboard?.instantiateViewController(withIdentifier:"NotificationVC") as! NotificationVC
            self.navigationController?.pushViewController(obj, animated:true)
        case 1:
            let obj = self.storyboard?.instantiateViewController(withIdentifier:"SqliteVC") as! SqliteVC
            self.navigationController?.pushViewController(obj, animated:true)
        case 2:
            let obj = self.storyboard?.instantiateViewController(withIdentifier:"CoreDataVC") as! CoreDataVC
            self.navigationController?.pushViewController(obj, animated:true)
        case 3:
            let obj = self.storyboard?.instantiateViewController(withIdentifier:"ServicesVC") as! ServicesVC
            self.navigationController?.pushViewController(obj, animated:true)
        case 4:
            let obj = self.storyboard?.instantiateViewController(withIdentifier:"QuizVc") as! QuizVc
            self.navigationController?.pushViewController(obj, animated:true)
        default:
            print("Default")
        }
       
    }
    
}
