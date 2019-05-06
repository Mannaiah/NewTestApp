//
//  ServicesVC.swift
//  Basics
//
//  Created by M Venkat  Rao on 4/5/19.
//  Copyright © 2019 M Venkat  Rao. All rights reserved.
//

import UIKit


class ServicesVC: UIViewController, UITableViewDataSource, UITableViewDelegate,UITextFieldDelegate {
   
@IBOutlet weak var dataTableView: UITableView!
    var isFrom:String!
     var dataArray = NSArray()
    var postResponseDict = NSDictionary()
    var fname:String!
    var lname:String!
    var no:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.red]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
  self.navigationItem.title = "Web Services"
       // self.dataArray = ["w","h","h"]
        self.dataTableView.reloadData()
        
    
    }
    
    @IBAction func getBtnAction(_ sender: UIButton) {
        print("name-\(fname ?? "") lastName-\(lname ?? "") no-\(no ?? "")")
       // getMethod()
    }
    
    @IBAction func postBtnAction(_ sender: UIButton) {
        postMethod()
    }
    func getMethod() {
        AppDelegate().showCustomLoader(self)
        guard let url = URL(string:"https://jsonplaceholder.typicode.com/users") else {return}
        
        var urlRequest = URLRequest(url:url)
        urlRequest.httpMethod = "GET"
        let session = URLSession.shared
        session.dataTask(with:urlRequest) { (data, response, error) in
            if let response = response{
               print(response)
            }
            if let data = data{
                
                DispatchQueue.main.async { // Correct
                    print(data)
                    do{
                        let json = try JSONSerialization.jsonObject(with:data, options:[])
                        self.dataArray = json as! NSArray
                       
                         self.dataTableView.reloadData()
                    }catch{
                        print(error)
                    }
                }
               AppDelegate().removeCustomLoader(self)
                
            }
        }.resume()
        
    }
    /*
     func almofire(){
        Alamofire.request(url, parameters: ["user":"any username"
            ,"media_id":"anyid"]).responseJSON { response in
                
                if response.result.isSuccess == true
                {
                    if let value = response.result.value {
                        let json = JSON(value)
                        print(self.json)
                        
                        let comment_arr = self.json["comment_arr"]
                        for (index, _): (String, JSON) in comment_arr {
                            let i : Int = Int(index)!
                            
                            let name = comment_arr[i]["user"].stringValue
                            let text = comment_arr[i]["text"].stringValue
                            
                            self.nameArr.append(name)
                            self.textArr.append(text)
                        }
                        self.tableView.reloadData()
                        self.loadingNotification.hide(animated: true)
                    }
                }
                else
                {
                }
        }
    }
    
    */
    func postMethod() {
        let json:[String:Any] = ["title": "ABC",
                                     "dict": ["1":"First", "2":"Second"]]
        let jsonDict = try? JSONSerialization.data(withJSONObject:json, options: [])
        
        
        guard let url = URL(string:"http://httpbin.org/post") else {return}
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        request.httpBody = jsonDict
      
        let session = URLSession.shared
        session.dataTask(with:request) { (data, response, error) in
            
            if let response = response{
                print(response)
            }
            if let data = data{
                
                DispatchQueue.main.async { // Correct
                    print(data)
                    do{
                        let json = try JSONSerialization.jsonObject(with:data, options:[])
                         self.postResponseDict = json as! NSDictionary
                        print( self.postResponseDict)
                    }catch{
                        print(error)
                    }
                }
                
                
            }
            
           
            }.resume()
        
    }

    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //this method is giving the row count of table view which is
        //total number of heroes in the list
        
            return 3//dataArray.count
        
    }
    
    
    //this method is binding the hero name with the tableview cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier:"ServiceCell") as! ServiceCell //UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
           // let tempDict = dataArray[indexPath.row] as! NSDictionary
         let  textField = cell.viewWithTag(1) as? UITextField
        textField!.placeholder = "Please Enter Text"
        textField?.tag = indexPath.row
        textField?.delegate = self
           // cell.textLabel?.text = tempDict["name"] as? String
            //cell.detailTextLabel?.text = tempDict["email"] as! String
        textField!.addTarget(self, action: #selector(textFieldDidChange(_:)),
                            for: UIControl.Event.editingChanged)
        return cell
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        let tag = textField.tag
        switch tag {
        case 0 :
            fname = textField.text ?? ""
            print("tag-\(textField.tag) values -\(textField.text ?? "")")
            break
        case 1 :
            lname = textField.text ?? ""
            print("tag-\(textField.tag) values -\(textField.text ?? "")")
            break
        case 2 :
            no = textField.text ?? ""
            print("tag-\(textField.tag) values -\(textField.text ?? "")")
            break
        default:
            print("Default")
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
      textField.resignFirstResponder()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      
        return true
    }
}
