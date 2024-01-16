//
//  GeocodeService.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/13/24.
//

import Foundation
import CoreLocation

struct GeocodeService {
//    func getCoordinate( addressString : String,
//            completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void ) {
//        let geocoder = CLGeocoder()
//        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
//            if error == nil {
//                if let placemark = placemarks?[0] {
//                    let location = placemark.location!
//                        
//                    completionHandler(location.coordinate, nil)
//                    return
//                }
//            }
//                
//            completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
//        }
//    }

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
