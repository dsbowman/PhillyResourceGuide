//
//  LocationService.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 8/5/24.
//

import SwiftUI
import MapKit

 class LocationService: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?

     
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            
        } else {
            print("Alert: Check to make sure your location services are on.")
        }
    }
    
    
   private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("Alert: Your location is constricted")
            case .denied:
                print("Alert: You have denied this app location permissions")
            case .authorizedAlways, .authorizedWhenInUse:
                break
            @unknown default:
                break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }


    
}
