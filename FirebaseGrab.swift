//
//  FirebaseGrab.swift
//  PlanIt
//
//  Created by Jacob Gino on 9/2/23.
//


import Foundation
import Firebase

class userViewModel: ObservableObject {
     
    @Published var events = [NewEvent]()
     
    private var db = Firestore.firestore()
     
    var uId = UIDevice.current.identifierForVendor!.uuidString
    @Published var counter = 0
    
      
   
    func getData() {
        db.collection("information").document(uId).collection("todos").addSnapshotListener { (querySnapshot, error) in
            let documents = querySnapshot!.documents
            
            
            self.events = documents.map { (queryDocumentSnapshot) -> NewEvent in
                let data = queryDocumentSnapshot.data()
                let newId = data["id"] as? String ?? ""
                let completed = data["completed"] as? Bool ?? false
                let date = data["date"] as? Date ?? Date()
                let description = data["description"] as? String ?? ""
                let number = data["number"] as? Int ?? 0
                return NewEvent(id: newId, number: number, description: description, completed: completed, date: date)
                
            }
        }
    }
   
}
