//
//  latlongfile.swift
//  newproject
//
//  Created by Rohit on 07/09/24.
//

import UIKit
import GooglePlaces

class LocationManager: NSObject {
    
    static let shared = LocationManager()

    // Function to show the autocomplete and get location details
    func showAutocomplete(on viewController: UIViewController, completion: @escaping (_ lat: Double, _ long: Double, _ location: String?) -> Void) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        autocompleteController.placeFields = [.name, .placeID, .coordinate]
        
        let filter = GMSAutocompleteFilter()
        filter.type = .address
        autocompleteController.autocompleteFilter = filter
        
        // Store the completion handler to be used later
        self.completion = completion
        
        // Present the autocomplete view controller
        viewController.present(autocompleteController, animated: true, completion: nil)
    }
    
    private var completion: ((_ lat: Double, _ long: Double, _ location: String?) -> Void)?
}

extension LocationManager: GMSAutocompleteViewControllerDelegate {
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        // Call the completion handler with lat, long, and place name
        completion?(place.coordinate.latitude, place.coordinate.longitude, place.name)
        viewController.dismiss(animated: true, completion: nil)
    }

    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error: ", error.localizedDescription)
        viewController.dismiss(animated: true, completion: nil)
    }

    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }

    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }

    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
