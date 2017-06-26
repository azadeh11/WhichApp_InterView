//
//  UserDetailObject.swift
//  sampleTest1
//
//  Created by Azadeh Rassadi on 6/20/17.
//  Copyright © 2017 Azadeh Rassadi. All rights reserved.
//

import UIKit

class UserDetailObject: NSObject {
    
    var id:Int!
    var name:String!
    var email:String?
    var age:Int!
    var isFemale:Bool?
    var hobbies:[String]?
    var image:String?
    var back:String?

    
    struct userDetails {
        let id:Int
        let name:String
        let email:String?
        let age:Int!
        let isFemale:Bool?
        let hobbies:[String]?
        let image:String?
        let back:String?
    }

    let detailedUserInformation:[userDetails] = [
        userDetails(id: 1, name: "Marc",email:"mark22@gmail.com", age: 22,isFemale:false, hobbies: ["Fishing","hiking","swimming","throwing rocks in the river"], image: "http://lorempixel.com/output/people-q-c-200-200-3.jpg", back: "http://lorempixel.com/output/animals-q-c-600-200-1.jpg" ),
        userDetails(id: 2, name: "John",email:"john@gmail.com",  age: 34,isFemale:false, hobbies: ["Swimming","Driving","Singing","Playing piano","making funny noises"], image: "http://lorempixel.com/output/people-q-c-200-200-2.jpg",back: "http://lorempixel.com/output/animals-q-c-600-200-2.jpg" ),
        userDetails(id: 5, name: "Anna",email:"anna@gmail.com",  age: 21,isFemale:true, hobbies: ["not sure, probably sleeping"], image: "http://lorempixel.com/output/people-q-c-200-200-1.jpg",back: "http://lorempixel.com/output/animals-q-c-600-200-9.jpg"),
        userDetails(id: 7, name: "Ursula",email:nil,  age: 31,isFemale:true, hobbies: ["talking","Walking"], image: nil,back: "http://lorempixel.com/output/animals-q-c-600-200-4.jpg"),
        userDetails(id: 8, name: "Frank",email:"frank@gmail.com",  age: nil,isFemale:false, hobbies: nil, image: "http://lorempixel.com/output/people-q-c-200-200-4.jpg",back: nil),
        userDetails(id: 12, name: "Steward",email:nil,  age: 49,isFemale:nil, hobbies: ["Origami"], image: nil,back: "http://lorempixel.com/output/animals-q-c-600-200-6.jpg"),
        userDetails(id: 14, name: "Tyrone",email:"tyrone@gmail.com",  age: 37,isFemale:false, hobbies: ["Fishing","hiking","creating figurines out of sticks and paper bags during the night"], image: "http://lorempixel.com/output/people-q-c- 200-200-5.jpg",back: nil),
        userDetails(id: 15, name: "Tara",email:nil,  age: 26,isFemale:true, hobbies: ["making bed"], image: "http://lorempixel.com/output/people-q-c-200-200-6.jpg",back: "http://lorempixel.com/output/animals-q-c-600-200-7.jpg"),
        userDetails(id: 22, name: "Arthur",email:"arthur@gmail.com",  age: nil,isFemale:nil, hobbies: nil, image: "lorempixel.com/output/people-q-c-200-200-7",back: nil)
        
    ]

    
    
    
    

}
