//
//  MapLocatorApp.swift
//  MapLocator
//
//  Created by Justice Ekeke on 27/03/2022.
//

import SwiftUI

@main
struct MapLocatorApp: App {
    @State private var username: String = ""
    var body: some Scene {
        WindowGroup {
            TabView
            {
                ContentView()
                    .tabItem {
                        Image(systemName: "globe.americas")
                        Text("Places")
                    }
                
                BookView()
                    .tabItem {
                        Image(systemName: "figure.wave")
                        Text("Book")
                    }
                BookingsView()
                    .tabItem {
                        Image(systemName: "car")
                        Text("Bookings")
                    }
            }
            
        }
        
        
    }
    
}
