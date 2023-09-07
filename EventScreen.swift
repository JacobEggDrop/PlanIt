//
//  EventScreen.swift
//  PlanIt
//
//  Created by Jacob Gino on 8/28/23.
//

import SwiftUI
import Firebase
import Foundation


struct EventScreen: View {
    
    @State var events: [NewEvent] = [NewEvent]()
    
    @State var des: String = ""
    @State var date: Date = Date()
    @State var showingAlert = false
    
    @State public var isEvent = false
    
    

   
    
     
    
    
    @State var counter = 0
    
   
    
    var body: some View {
        
        if(isEvent == true) {
            HomeView()
        }
        else {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            DatePicker("When is it Due?", selection: $date)
            
            
            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $des)
            
            Button {
                if(des == "") {
                    showingAlert = true
                    isEvent = false
                       
                }
                else {

                   
                    let uId = UIDevice.current.identifierForVendor!.uuidString
                    print(uId)
                    
                    let newItem = NewEvent(id: UUID().uuidString, number: counter, description: des, completed:false , date: date)
                    
                    let db = Firestore.firestore()
                    db.collection("information")
                        .document(uId)
                        .collection("todos")
                        .document(newItem.id)
                        .setData(newItem.dictionary)
                    isEvent = true
                }
            }
          
            label: {
                Text("Press me")
            }
            .alert("Please enter an event", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
                
                
            
            
            
           
                
            
            
        }
    }
    
    struct EventScreen_Previews: PreviewProvider {
     static var previews: some View {
     EventScreen()
     }
     }
}
