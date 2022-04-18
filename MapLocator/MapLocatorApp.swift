//
//  MapLocatorApp.swift
//  MapLocator
//
//  Created by Justice Ekeke on 27/03/2022.
//

import SwiftUI

@main
struct MapLocatorApp: App {
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
                        Image(systemName: "car")
                        Text("Book")
                    }
            }
            
        }
        
        
    }
    
}
