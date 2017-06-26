//
//  UserDetailViewController.swift
//  sampleTest1
//
//  Created by Azadeh Rassadi on 6/20/17.
//  Copyright © 2017 Azadeh Rassadi. All rights reserved.
//

import UIKit
import SDWebImage
import MessageUI

class UserDetailViewController:  UIViewController , MFMailComposeViewControllerDelegate {
    
    public var userid :Int?
    var emailStr : String?
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var contactButton: UIButton!
    @IBOutlet weak var hobbyLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        avatarImage.layer.cornerRadius = 100
        avatarImage.layer.masksToBounds = true
        
        getUserDetail(userID: userid!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func contactButtonClicked(_ sender: UIButton) {
        
        if(emailStr != nil){
            if !MFMailComposeViewController.canSendMail() {
                print("Mail services are not available")
                let url = URL(string: "mailto:" + emailStr!)
                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                return
            }
            
            // Use the iOS Mail app
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            composeVC.setToRecipients([emailStr!])
            composeVC.setSubject("")
            composeVC.setMessageBody("", isHTML: false)
            
            // Present the view controller modally.
            self.present(composeVC, animated: true, completion: nil)
        }
        else{
            
            let alert = UIAlertController(title: "Alert", message: "This person has no email!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: {
                self.contactButton.isEnabled = false
                self.contactButton.alpha = 0.5
            })
        }
    }
    
    
    // MARK: MailComposeViewControllerDelegate
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }
    


func getUserDetail(userID : Int){

       
        let userDetailObj = UserDetailObject()

        let result =  userDetailObj.detailedUserInformation.filter{$0.id == userid}

        let temparr = Brain.sharedInstance.parseUserDetail(dataDict: result)

     
        if(temparr.back != nil){
    
           backgroundImage.sd_setImage(with: URL(string: temparr.back!), placeholderImage: UIImage(named: ""))
        }
        
        nameLabel.text = temparr.name
    
       if(temparr.image != nil){
    
          avatarImage.sd_setImage(with: URL(string: temparr.image!), placeholderImage: UIImage(named: "placeholder.png"))
        }
        
    
      if(temparr.hobbies != nil){
          var strHobbies : [String]?
          for item in temparr.hobbies!{
             if(strHobbies != nil){
                strHobbies?.append(item)
             }
             else{
                strHobbies = [item]
             }
          }
        
         hobbyLabel.text = String(describing: strHobbies!)
       }
 
      if(temparr.age != nil){
        ageLabel.text =  String(temparr.age)
      }
    
      emailStr = temparr.email
  
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
