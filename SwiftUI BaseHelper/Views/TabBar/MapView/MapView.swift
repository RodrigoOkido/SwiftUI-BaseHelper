//
//  MapView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 17/10/22.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    
    // MARK: - View Model
    @StateObject private var viewModel = MapViewModel()
    @State var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))

    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                .edgesIgnoringSafeArea([.top, .leading, .trailing])
                .onAppear {
                    viewModel.checkUserAuthorizationStatus()
                    #warning("If you want to test your real location...uncomment this code")
//                    if let myRegion = viewModel.region {
//                        region = myRegion
//                    }
                }
        }
        .alert(isPresented: $viewModel.permissionDenied) {
            Alert(title: Text("Localization Denied"), message: Text("Please enable permission in App Settings."), dismissButton: .default(Text("Go to settings"), action: {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }))
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
