/*
 *Program Name: Map Locator
 *Date Last Modified:18/04/2022
 *Description: A tourist helper app for identifying popular locations and booking a conciege.
 *Author: Justice Ekeke
 *Student ID: 301160908
 *Date: April 18, 2022
 *
 *Author: Shrijan Karki
 *Student ID: 301222636
 *Date: April 18, 2022
 *
 *Author: Basil Farooq
 *Student ID: 301201128
 *Date: April 18, 2022
 *
 */


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

//home screen
struct ContentView: View {
    
    //places annotation array
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
                            mapregion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.65782991516372, longitude: -79.38113044998131), span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003))
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
                            mapregion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.67080619933693, longitude: -79.39054469029794), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
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
                            mapregion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.67668705058994, longitude: -79.38716286632689), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
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
                            mapregion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.670726705125794, longitude: -79.39424390019832), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.0005))
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

//help screen
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
                
                Text("A tourist app to know popular locations in Toronto area.")
                    .foregroundColor(.primary)
                
                Spacer()
            }
            
            Spacer()
            
            HStack
            {
                Text("User Guide:")
                    .bold()
                    .foregroundColor(.orange)
            }
            Spacer()
            
            VStack
            {
                
                Text("‣ Theme toggle: Tap on the switcher to change the current theme of the application to a light or dark mode.")
                    .foregroundColor(.primary)
                
                Text("‣  Cinema: Loking for a good movie? This button will show you some of the most poular cinema location in toront for that ultimate movie experience.")
                    .foregroundColor(.primary)
                
                
                Text("‣  Malls: All the items you could possibly need. This will show you the most popular malls in toronto where you are assured to find whatever you are looking for.")
                    .foregroundColor(.primary)
                
                
                Text("‣  Parks: For that relaxing day out. This shows you the closest parks to you to take in that well needed breath of fresh air and touch grass.")
                    .foregroundColor(.primary)
                
                
                Text("‣  Resturants: From budget meals to Fancy dining exprience. This Shows some of the top resturants in toronto area for that all you can eat exerience, from dine in to take out.")
                    .foregroundColor(.primary)
                
                
                Text("‣  Book Tab: Switch to this tab and enter the required details. Our finest concierge will be at your service to get you whatever possible you'll need.")
                    .foregroundColor(.primary)
                
                
                Text("‣  Bookings Tab: Switch to this tab to view your current booking details.")
                    .foregroundColor(.primary)
                Spacer()
            }
        }.preferredColorScheme(isDarkMode ? .dark : .light)
            .accentColor(.primary)
    }
}

//book tab
struct BookView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State var fullname: String = UserDefaults.standard.string(forKey: "NAME_KEY") ?? ""
    @State var Sfullname: String = ""
    @State var age: String = UserDefaults.standard.string(forKey: "AGE_KEY") ?? ""
    @State var Sage: String = ""
    @State var address: String = UserDefaults.standard.string(forKey: "ADDRESS_KEY") ?? ""
    @State var Saddress: String = ""
    @State var contact: String = UserDefaults.standard.string(forKey: "CONTACT_KEY") ?? ""
    @State var Scontact: String = ""
    @State var email: String = UserDefaults.standard.string(forKey: "EMAIL_KEY") ?? ""
    @State var Semail: String = ""
    
    var body: some View {
        
        VStack
        {
            HStack
            {
                
                Text("BOOKING DETAILS")
                    .bold()
                    .foregroundColor(.primary)
                
                
            }.scaleEffect(2)
            
            Spacer()
            
            HStack
            {
                Spacer()
                
                Text("Please fill the form below")
                    .foregroundColor(.primary)
                
                Spacer()
            }
            
            Spacer()
            
            HStack
            {
                Text("User Details:")
                    .bold()
                    .foregroundColor(.orange)
            };Spacer(minLength: 4)
            Form {
                Section(header: Text("Fullname:")){
                    TextField("Enter your fullname", text: $fullname)
                }
                Section(header: Text("Age:")){
                    TextField("Enter your Age", text: $age)
                }
                Section(header: Text("Address:")){
                    TextField("Enter your Address", text: $address)
                }
                Section(header: Text("Contact:")){
                    TextField("Enter your Contact number", text: $contact)
                }
                Section(header: Text("Email:")){
                    TextField("Enter your email", text: $email)
                }
                
            }
            
            HStack
            {
                Button(action: {
                    UserDefaults.standard.set(fullname, forKey: "NAME_KEY")
                    Sfullname = fullname
                    UserDefaults.standard.set(age, forKey: "AGE_KEY")
                    Sage = age
                    UserDefaults.standard.set(address, forKey: "ADDRESS_KEY")
                    Saddress = address
                    UserDefaults.standard.set(contact, forKey: "CONTACT_KEY")
                    Scontact = contact
                    UserDefaults.standard.set(email, forKey: "EMAIL_KEY")
                    Semail = email
                })
                {
                    Text("BOOK")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all,20)
                        .padding([.leading,.trailing], 40)
                        .background(Color.orange)
                        .cornerRadius(20)
                }
            }
            Spacer()
            .preferredColorScheme(isDarkMode ? .dark : .light)
                .accentColor(.primary)
        }
    }
}

//bookings tab
struct BookingsView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State var fullname: String = UserDefaults.standard.string(forKey: "NAME_KEY") ?? ""
    @State var Sfullname: String = ""
    @State var age: String = UserDefaults.standard.string(forKey: "AGE_KEY") ?? ""
    @State var Sage: String = ""
    @State var address: String = UserDefaults.standard.string(forKey: "ADDRESS_KEY") ?? ""
    @State var Saddress: String = ""
    @State var contact: String = UserDefaults.standard.string(forKey: "CONTACT_KEY") ?? ""
    @State var Scontact: String = ""
    @State var email: String = UserDefaults.standard.string(forKey: "EMAIL_KEY") ?? ""
    @State var Semail: String = ""
    
    var body: some View {
        
        VStack
        {
            HStack
            {
                
                Text("BOOKING DETAILS")
                    .bold()
                    .foregroundColor(.primary)
                
                
            }.scaleEffect(2)
            
            Spacer()
            
            HStack
            {
                Spacer()
                
                Text("These are the details you provided")
                    .foregroundColor(.primary)
                
                Spacer()
            }
            
            Spacer()
            
            HStack
            {
                Text("User Details:")
                    .bold()
                    .foregroundColor(.orange)
            };Spacer(minLength: 4)
            
            VStack
            {
                HStack{
                    Text("‣ Fullname: ")
                        .foregroundColor(.primary)
                        .bold()
                    Text(" \(fullname)")
                }
                
                HStack{
                    Text("‣  Age:")
                        .foregroundColor(.primary)
                        .bold()
                    Text(" \(age)")
                }
                
                HStack{
                    Text("‣  Address:")
                        .foregroundColor(.primary)
                        .bold()
                    Text(" \(address)")
                }
                
                HStack{
                    Text("‣  Contact: ")
                        .foregroundColor(.primary)
                        .bold()
                    Text(" \(contact)")
                }
                
                HStack{
                    Text("‣  Email: ")
                        .foregroundColor(.primary)
                        .bold()
                    Text(" \(email)")
                }
                Spacer()
            };Spacer(minLength: 5)
        }.preferredColorScheme(isDarkMode ? .dark : .light)
            .accentColor(.primary)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

