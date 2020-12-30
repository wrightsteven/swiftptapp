//
//  ContentView.swift
//  swiftPTApp
//
//  Created by Steven Wright on 12/13/20.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Home : View {
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.6189, longitude: -117.9298), latitudinalMeters: 10000, longitudinalMeters: 10000)
    
    @State var tracking : MapUserTrackingMode = .follow
    @State var manager = CLLocationManager()
    @StateObject var managerDelegate = locationDelegate()
    
    var body: some View{
        VStack{
            Map(mapRect: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: $tracking, annotationContent: managerDelegate.pins){
                pin in MapPin(coordinate: pin.location.coordinate, tint: .red)
            }
        }
        .onAppear(){
            manager.delegate = managerDelegate
        }
    }
}

struct Pin : Identifiable {
    var id = UUID().uuidString
    var location : CLLocation
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
