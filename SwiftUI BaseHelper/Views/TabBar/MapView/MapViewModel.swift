//
//  MapViewModel.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 17/10/22.
//

import Foundation
import MapKit
import CoreLocation

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // MARK: - Property Wrapper
    @Published var permissionDenied: Bool = false
    @Published var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    // MARK: - Stored Properties
    var locationManager: CLLocationManager = CLLocationManager()
    
    // MARK: - Computed Properties
    var defaultMapLocation: MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }

    // MARK: - Setup
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 5000
    }
    
    // MARK: - Public Methods
    func checkUserAuthorizationStatus() {
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            permissionDenied.toggle()
        case .authorizedAlways, .authorizedWhenInUse:
            setupLocationManager()
        case .restricted:
            break
        @unknown default:
            break
        }
    }
        
    // MARK: - Public Methods
    func renderRegion(_ location: CLLocation) {
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                longitude: location.coordinate.longitude)
        let coordinateDelta = 0.1
        let span = MKCoordinateSpan(latitudeDelta: coordinateDelta,
                                    longitudeDelta: coordinateDelta)
        
        region = MKCoordinateRegion(center: coordinate, span: span)
    }
    
    // MARK: - Map Delegate
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkUserAuthorizationStatus()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        renderRegion(location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
