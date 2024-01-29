//
//  GeocodeService.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/13/24.
//

import Foundation
import CoreLocation

struct GeocodeService {
    
    func getLocation(from address: String, completion: @escaping (_ location: CLLocationCoordinate2D?)-> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            guard let placemarks = placemarks,
                  let location = placemarks.first?.location?.coordinate else {
                completion(nil)
                return
            }
            completion(location)
        }
    }
}
