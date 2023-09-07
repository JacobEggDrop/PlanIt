//
//  Logic.swift
//  PlanIt
//
//  Created by Jacob Gino on 8/27/23.
//

import Foundation

import Firebase

import UserNotifications
func makeDateString(d: Date) -> String
{
    let dateFormatter = DateFormatter()

    // Set Date/Time Style
    dateFormatter.dateStyle = .long
    dateFormatter.timeStyle = .short

    // Convert Date to String
    return dateFormatter.string(from: d)
    
}

func delete(iso: NewEvent) {
    
    let db = Firestore.firestore()
    var uId = UIDevice.current.identifierForVendor!.uuidString
    
    db.collection("information")
        .document(uId)
        .collection("todos")
        .document(iso.id)
        .delete()
    print("done")
}

func toggleIsDone(item: NewEvent) {
    var newItem = item
    newItem.setDone()
    
    
    
    let uId = UIDevice.current.identifierForVendor!.uuidString
    print(uId)
    
    let db = Firestore.firestore()
    db.collection("information")
        .document(uId)
        .collection("todos")
        .document(newItem.id)
        .setData(newItem.dictionary)
}

func askPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options:[.alert,.badge,.sound]) {success,error in
        
        if success {
            print("Access granted!")
        }
        else if let error = error {
            print(error.localizedDescription)
        }
        
    }
}

func sendNotifications() {
    

        
        var trigger: UNNotificationTrigger?
        
        trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let content = UNMutableNotificationContent()
        
        content.title = "You have tasks remaining to do"
        content.body = "You have things to do"
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
                                                                                                 

    
}






// Create Date Formatter

