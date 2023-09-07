//
//  ContentView.swift
//  PlanIt
//
//  Created by Jacob Gino on 8/26/23.
//

import SwiftUI
import Foundation
import Firebase
import UserNotifications





func getCurrent() -> String {
    let currentDate = Date()
    
    let formatter = DateFormatter()
    
    formatter.dateStyle = .long
    let dateString = formatter.string(from: currentDate)
    return dateString
    
}
func goHome(i: [NewEvent]) {
    

    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: EventScreen())
        window.makeKeyAndVisible()
    }
}







struct HomeView: View {
    var uId = UIDevice.current.identifierForVendor!.uuidString
    @ObservedObject private var viewModel = userViewModel()
    @State var counter = 0

    
 
        
    
    
    
    

 

  

    
    
    
    
    
    
    /*.collection("information").getDocuments { snapshot, error in
        
        if error == nil {
            
            
            if let snapshot = snapshot {
                
                DispatchQueue.main.async {
                    snapshot.documents.map { d in
                        
                       events = NewEvent(id: uId, number: d["number"] as? String ?? "", description: d["description"] as? String ?? "", completed: d["completed"] as? Bool ?? "", date: d["date"] as? String ?? "")
                        
                    }
                    
                }
                
               
            }
        }
        
    }*/
    

    

 
    
        var body: some View {
            
            
            
            Button {
                askPermission()
            } label: {
                Text("Press here for perimssion")
            }
            
        
            Button {
                sendNotifications()
            } label: {
                Text("Press here to send notification")
            }

            Text(getCurrent())
            VStack {
            
                HStack {
                    Text("To do")
                    Button {
                        goHome(i: viewModel.events)
                    } label: {
                        Text("Hello World")
                    }

                
                    
                }
                Spacer()
                
                List(viewModel.events) { i in
                    
                    var newItem = i
                    
                    
                    if(Date() == i.date) {
                        var y = delete(iso: i)
                    }
                    
                    HStack {
                        Text(String(i.description))
                        .swipeActions {
                            Button("Delete") {
                                delete(iso: i)
                            }
                            .tint(.red)
                        }
                        Spacer()
                        Button {
                            toggleIsDone(item: i)
                        } label: {
                            if newItem.completed == true {
                                Image(systemName: "checkmark.circle.fill")
                            }
                            else {
                                Image(systemName: "circle")
                            }
                        }

                        
                    }
                    
                    
                    
                    
                }
                .onAppear() {
                    self.viewModel.getData()
                }
              
                
            }
            
        }
        
        
      
    
    
    
    


    
    /*struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }*/
    
}
