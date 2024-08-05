////
////  LocationService.swift
////  Community Resource Guide
////
////  Created by Deke Bowman on 8/5/24.
////
//
//import SwiftUI
//import MapKit
//
//class LocationService {
//
//    func fetchCoordinates(resources: [Record]) {
//        for i in 0..<resources.count {
//            let record = resources[i]
//            let address = "\(record.fields.street1 ?? ""), \(record.fields.street2 ?? ""), \(record.fields.city ?? ""), \(record.fields.state ?? ""), \(record.fields.zip ?? "")"
//            
//            CLGeocoder().geocodeAddressString(address) { (placemarks, error) in
//                if let error = error {
//                    print("Geocoding error for \(address): \(error.localizedDescription)")
//                    return
//                }
//
//                if let placemark = placemarks?.first,
//                   let location = placemark.location {
//
//                    DispatchQueue.main.async { // Update on main thread
//                        self.resources[i].fields.locationCoordinate = location.coordinate
//                    }
//                } else {
//                    print("No coordinates found for \(address)")
//                }
//            }
////        }
//        DispatchQueue.main.async {
//            self.calculateRegion(recourses: <#[Record]#>)
//        }
//    }
//    
//    func calculateRegion(recourses: [Record]) {
//            var minLatitude = 90.0
//            var maxLatitude = -90.0
//            var minLongitude = 180.0
//            var maxLongitude = -180.0
//
//            for record in resources {
//                if let coordinate = record.fields.locationCoordinate {
//                    minLatitude = min(minLatitude, coordinate.latitude)
//                    maxLatitude = max(maxLatitude, coordinate.latitude)
//                    minLongitude = min(minLongitude, coordinate.longitude)
//                    maxLongitude = max(maxLongitude, coordinate.longitude)
//
//                }
//            }
//
//            let center = CLLocationCoordinate2D(
//                latitude: (minLatitude + maxLatitude) / 2,
//                longitude: (minLongitude + maxLongitude) / 2
//            )
//
//            let span = MKCoordinateSpan(
//                latitudeDelta: (maxLatitude - minLatitude) * 1.2,
//     // Add padding
//                longitudeDelta: (maxLongitude - minLongitude) * 1.2 // Add padding
//            )
//
//            mapRegion = MKCoordinateRegion(center: center, span: span)
//        }
//
//    
//}
