//
//  NewEvent.swift
//  PlanIt
//
//  Created by Jacob Gino on 8/28/23.
//

import Foundation

struct NewEvent: Identifiable {
    

    
    var id: String;
    var number: Int
    var description:String
    var completed: Bool
    var date: Date
    
    var dictionary: [String: Any] {
           return ["number": number,
                   "description": description,
                   "completed": completed,
                   "date": date,
                   "id": id]
       }
       var nsDictionary: NSDictionary {
           return dictionary as NSDictionary
       }
    
    mutating func setDone() {
        if completed == true {
            completed = false
        }
        else {
            completed = true
        }
        
    }
    
}
