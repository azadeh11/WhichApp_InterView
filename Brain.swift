//
//  Brain.swift
//  sampleTest1
//
//  Created by Azadeh Rassadi on 6/20/17.
//  Copyright © 2017 Azadeh Rassadi. All rights reserved.
//

import UIKit

class Brain: NSObject {

  static let sharedInstance = Brain()
    
    func parseUser(inputArr : [[Int:String]]) -> [UserObject]{
    
        var muArray : [UserObject] = []
        
        for  dict in inputArr {
            
            let userObj = UserObject()
         
             userObj.user = dict
            
            muArray.append(userObj)
        }
        
        
       return  muArray
        
    }

    
    func parseUserDetail(dataDict : [UserDetailObject.userDetails]) -> UserDetailObject{
        
        let userDetailObj = UserDetailObject()
     
        userDetailObj.id             = dataDict[0].id
        userDetailObj.name           = dataDict[0].name
        userDetailObj.email          = dataDict[0].email
        userDetailObj.age            = dataDict[0].age
        userDetailObj.isFemale       = dataDict[0].isFemale
        userDetailObj.image          = dataDict[0].image
        userDetailObj.back           = dataDict[0].back
        userDetailObj.hobbies        = dataDict[0].hobbies
        
        return userDetailObj
    }
    
    
}
