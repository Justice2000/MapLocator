//
//  ContentView.swift
//  MapLocator
//
//  Created by Justice Ekeke on 27/03/2022.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
struct ContentView: View {
    
    let places = [
        Place(name: "Cinema 1", latitude: 43.65782991516372, longitude: -79.38113044998131),
        Place(name: "Cinema 2", latitude: 43.662797421207316, longitude: -79.38181709546336),
        Place(name: "Cinema 3", latitude: 43.66987540719193, longitude: -79.38816856617238),
        Place(name: "Mall 1", latitude: 43.67030953349737, longitude: -79.38869933056493),
        Place(name: "Mall 2", latitude: 43.67080619933693, longitude: -79.39054469029794),
        Place(name: "Mall 3", latitude: 43.6719547233492, longitude: -79.3951366319592),
        Place(name: "Park 1", latitude: 43.67668705058994, longitude: -79.38716286632689),
        Place(name: "Park 2", latitude: 43.67674912744737, longitude: -79.38875073400413),
        Place(name: "Park 3", latitude: 43.6771836636512, longitude: -79.39329976032275),
        Place(name: "Restaurants 1", latitude: 43.67168898476857, longitude: -79.39252728649318),
        Place(name: "Restaurants 2", latitude: 43.67122336751315, longitude: -79.39338559334576),
        Place(name: "Restaurants 3", latitude: 43.670726705125794, longitude: -79.39424390019832)
    ]
    
    @State private var mapregion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.651070, longitude: -79.347015), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        
        NavigationView
        {
            VStack
            {
                Text("LOCATIONS")
                    .bold()
                    .foregroundColor(.primary)
                    .scaleEffect(2)
                
                Map(coordinateRegion: $mapregion, annotationItems: places){
                    place in MapPin(coordinate: place.coordinate)
                }
                
                VStack
                {
                    HStack
                    {
                        Button(action: {
                            mapregion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.65782991516372, longitude: -79.38113044998131), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
                        })
                        {
                            Text("Cinema")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all,20)
                                .padding([.leading,.trailing], 28)
                                .background(Color.blue)
                                .cornerRadius(20)
                        }
                        Button(action: {
                            mapregion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.67080619933693, longitude: -79.39054469029794), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
                        })
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
                        Button(action: {
                            mapregion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.67668705058994, longitude: -79.38716286632689), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
                        })
                        {
                            Text("Parks")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all,20)
                                .padding([.leading,.trailing], 40)
                                .background(Color.blue)
                                .cornerRadius(20)
                        }
                        Button(action: {
                            mapregion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.670726705125794, longitude: -79.39424390019832), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.0002))
                        })
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
                    HStack
                    {
                        Button(action: {})
                        {
                            Text("Book a Car")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all,20)
                                .padding([.leading,.trailing], 40)
                                .background(Color.orange)
                                .cornerRadius(20)
                        }
                    }
                    
                }
                
                
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .accentColor(.primary)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading)
                {
                    //navigation link to help page
                    Button(action: {})
                    {
                        NavigationLink(destination: HelpView(), label: { Text("Help")
                        }).padding(.all,5)
                            .padding([.leading,.trailing], 25)
                    }
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing)
                {
                    
                    Picker("Mode", selection: $isDarkMode){
                        Text("Light")
                            .tag(false)
                        Text("Dark")
                            .tag(true)
                    }.pickerStyle(SegmentedPickerStyle())
                }
            }
            
        }
    }
}

struct HelpView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        
        VStack
        {
            HStack
            {
                
                Text("INSTRUCTIONS")
                    .bold()
                    .foregroundColor(.primary)
                
                
            }.scaleEffect(2)
            
            Spacer()
            
            HStack
            {
                Spacer()
                
                Text("The ")
                    .foregroundColor(.primary)
                
                Spacer()
            }
            
            Spacer()
            
            HStack
            {
                Text("Players Guide:")
                    .bold()
                    .foregroundColor(.primary)
                Spacer()
            }
            
            VStack
            {
                Text("‣ Current Bet: The amount player wants to use for betting in the game.")
                    .foregroundColor(.primary)
                Text("‣  Credits: The points which player wins by playing against its betting amount.")
                    .foregroundColor(.primary)
                Text("‣  High Score: World Record!. The highest score player achieves during a single session of the game.")
                    .foregroundColor(.primary)
                Text("‣  Spin: The central game button which spins all the different combinations and might get lucky for you to win the jackpot.")
                    .foregroundColor(.primary)
                Text("‣  Jackpot: Hurreyy!, The jackpot will be 10x of the betting amount.")
                    .foregroundColor(.primary)
                Text("‣  Reset: Start Over!, this button will help you to reset your game.")
                    .foregroundColor(.primary)
                Text("‣  Quit: You should take a rest too, so whenever you want you can quit by clicking the quit button")
                    .foregroundColor(.primary)
                Spacer()
            }
        }.preferredColorScheme(isDarkMode ? .dark : .light)
            .accentColor(.primary)
    }
}
    
struct BookView: View {
        
        @AppStorage("isDarkMode") private var isDarkMode = false
        
        var body: some View {
            
            VStack
            {
                HStack
                {
                    
                    Text("INSTRUCTIONS")
                        .bold()
                        .foregroundColor(.primary)
                    
                    
                }.scaleEffect(2)
                
                Spacer()
                
                HStack
                {
                    Spacer()
                    
                    Text("The Slot Machine game version 3.0 is out now. The project which was set as an educational project now becoming a global sensation in the gaming arena.")
                        .foregroundColor(.primary)
                    
                    Spacer()
                }
                
                Spacer()
                
                HStack
                {
                    Text("Players Guide:")
                        .bold()
                        .foregroundColor(.primary)
                    Spacer()
                }
                
                VStack
                {
                    Text("‣ Current Bet: The amount player wants to use for betting in the game.")
                        .foregroundColor(.primary)
                    Text("‣  Credits: The points which player wins by playing against its betting amount.")
                        .foregroundColor(.primary)
                    Text("‣  High Score: World Record!. The highest score player achieves during a single session of the game.")
                        .foregroundColor(.primary)
                    Text("‣  Spin: The central game button which spins all the different combinations and might get lucky for you to win the jackpot.")
                        .foregroundColor(.primary)
                    Text("‣  Jackpot: Hurreyy!, The jackpot will be 10x of the betting amount.")
                        .foregroundColor(.primary)
                    Text("‣  Reset: Start Over!, this button will help you to reset your game.")
                        .foregroundColor(.primary)
                    Text("‣  Quit: You should take a rest too, so whenever you want you can quit by clicking the quit button")
                        .foregroundColor(.primary)
                    Spacer()
                }
            }.preferredColorScheme(isDarkMode ? .dark : .light)
                .accentColor(.primary)
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
