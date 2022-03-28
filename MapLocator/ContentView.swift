//
//  ContentView.swift
//  MapLocator
//
//  Created by Justice Ekeke on 27/03/2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var mapregion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var body: some View {
        VStack
        {
            Map(coordinateRegion: $mapregion)
            
            VStack
            {
                HStack
                            {
                                Button(action: {})
                                            {
                                                Text("Cinema")
                                                    .bold()
                                                    .foregroundColor(.white)
                                                    .padding(.all,20)
                                                    .padding([.leading,.trailing], 28)
                                                    .background(Color.blue)
                                                    .cornerRadius(20)
                                            }
                                Button(action: {})
                                            {
                                                Text("Malls")
                                                    .bold()
                                                    .foregroundColor(.white)
                                                    .padding(.all,20)
                                                    .padding([.leading,.trailing], 40)
                                                    .background(Color.blue)
                                                    .cornerRadius(20)
                                            }
                            }
                HStack
                            {
                                Button(action: {})
                                            {
                                                Text("Parks")
                                                    .bold()
                                                    .foregroundColor(.white)
                                                    .padding(.all,20)
                                                    .padding([.leading,.trailing], 40)
                                                    .background(Color.blue)
                                                    .cornerRadius(20)
                                            }
                                Button(action: {})
                                            {
                                                Text("Resturants")
                                                    .bold()
                                                    .foregroundColor(.white)
                                                    .padding(.all,20)
                                                    .padding([.leading,.trailing], 20)
                                                    .background(Color.blue)
                                                    .cornerRadius(20)
                                            }
                            }
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
