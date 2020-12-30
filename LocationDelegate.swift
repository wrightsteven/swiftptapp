//
//  LocationDelegate.swift
//  swiftPTApp
//
//  Created by Steven Wright on 12/29/20.
//

import SwiftUI
import MapKit

class locationDelegate : NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var pins : [Pin] = []
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            print("authorized")
            manager.startUpdatingLocation()
            
            if manager.accuracyAuthorization != .fullAccuracy{
                print("reduced accuracy")
                
                manager.requestTemporaryFullAccuracyAuthorization(withPurposeKey: "Location"){
                    (err) in
                    if err != nil {
                        print(err)
                        return
                    }
                }
            }
        } else{
            print("not authorized")
            manager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        pins.append(Pin(location: locations.last!))
    }
}
