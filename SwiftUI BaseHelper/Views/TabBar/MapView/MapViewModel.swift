//
//  MapViewModel.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 17/10/22.
//

import Foundation
import MapKit
import CoreLocation

class MapViewModel: NSObject, ObservableObject {

    // MARK: - Property Wrapper
    @Published var isUserLocalizationAllowed: Bool
    @Published var region: MKCoordinateRegion

    // MARK: - Stored Properties
    var locationManager: CLLocationManager

    // MARK: - Computed Properties
    var defaultMapLocation: MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, 
                                                          longitude: -0.12),
                           span: MKCoordinateSpan(latitudeDelta: 0.2, 
                                                  longitudeDelta: 0.2))
    }

    // MARK: - Initializer
    init(permissionDenied: Bool = false,
         region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5,
                                                                                        longitude: -0.12),
                                                         span: MKCoordinateSpan(latitudeDelta: 0.2,
                                                                                longitudeDelta: 0.2)),
         locationManager: CLLocationManager = CLLocationManager()) {
        self.isUserLocalizationAllowed = permissionDenied
        self.region = region
        self.locationManager = locationManager
    }

    // MARK: - Setup
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 5000
    }

    private func setupRegion() {
        region = defaultMapLocation
    }

    // MARK: - Public Methods
    func checkUserAuthorizationStatus() {

        switch locationManager.authorizationStatus {

        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            isUserLocalizationAllowed.toggle()
        case .authorizedAlways, .authorizedWhenInUse:
            setupLocationManager()
            setupRegion()
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

        region = MKCoordinateRegion(center: coordinate, 
                                    span: span)
    }
}

// MARK: - Map Delegate
extension MapViewModel: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkUserAuthorizationStatus()
    }

    func locationManager(_ manager: CLLocationManager, 
                         didUpdateLocations locations: [CLLocation]) {

        guard let location = locations.last else { return }
        renderRegion(location)
    }

    func locationManager(_ manager: CLLocationManager, 
                         didFailWithError error: Error) {

        print(error.localizedDescription)
    }
}

