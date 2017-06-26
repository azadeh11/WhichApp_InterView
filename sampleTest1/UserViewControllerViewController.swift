//
//  ViewController.swift
//  sampleTest1
//
//  Created by Azadeh Rassadi on 6/20/17.
//  Copyright © 2017 Azadeh Rassadi. All rights reserved.
//

import UIKit

class UserViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    var userArr : [UserObject] = []
    public var titleStr : String?
    var cellId : Int?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCellID")
    
        self.tableView.estimatedRowHeight = 10;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        
        getUser()

    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - TableView
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.userArr.count
    }
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell {
        
        
        let userObj = self.userArr[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCellID", for: indexPath) as! UserTableViewCell
        
//        cell.preservesSuperviewLayoutMargins = false
//        cell.separatorInset = UIEdgeInsets.zero
//        cell.layoutMargins = UIEdgeInsets.zero
        
        for(key , value) in userObj.user!{
            
            cell.userIdLabel.text = String(key)
            cell.nameLabel.text = value
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
      let userObj = self.userArr[indexPath.row] as UserObject
        
     let vc = self.storyboard?.instantiateViewController(withIdentifier: "userDetailVC") as! UserDetailViewController
    
        for (key , _) in userObj.user!{
        
            vc.userid = key
        }
       
       self.navigationController?.pushViewController(vc, animated: true)
        
    }

    
    func getUser(){
        
        var users:[[Int:String]] =
            [
                [1:"Mark"],
                [2:"John"],
                [5:"Anna"],
                [7:"Ursula"],
                [8:"Frank"],
                [12:"Steward"],
                [14:"Tyrone"],
                [15:"Tara"],
                //[15:"Johan"],
                [20:"Jamal"],
                [22:"Arthur"],
                [26:"Emilia"]
        ]
        
        //show userDetailId
        
        let userDetailObj = UserDetailObject()
        let result = userDetailObj.detailedUserInformation
 
        var idDetailArray : Array<Int>!
        for item in result{
            if idDetailArray != nil {
                idDetailArray?.append(item.id)
            }
            else{
                idDetailArray = [item.id]
            }
        }
        
        //show userId
        var userIDArray :Array<Any>?
        for item in users{
            for (key, _) in item{
                print(key)
                if userIDArray != nil {
                    userIDArray?.append(key)
                    
                }
                else{
                    userIDArray = [key]
                }
            }
            
        }
        
        //show userId in TableViewCell if user did existet in userDetail
        var index :Int = 0
        for id in userIDArray!
        {
            print(id)
            if !(idDetailArray?.contains(id as! Int))!{
                users.remove(at: index )
                index = index-1
            }
            index = index+1
            print(users.count)
        }
        
        //show Final Result In TableView
        var mutarr = [[Int : String]]()
        for user in users {
            
            let dictData =  user as [Int : String]
            print(dictData)
            
            mutarr.append(dictData)
            
        }
  
        
        let tempArr = Brain.sharedInstance.parseUser(inputArr: mutarr)

        self.userArr = tempArr
        self.tableView.reloadData()

    }
  


}

