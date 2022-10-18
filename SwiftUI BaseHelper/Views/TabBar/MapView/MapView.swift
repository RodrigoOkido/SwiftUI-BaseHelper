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

    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                .edgesIgnoringSafeArea([.top, .leading, .trailing])
                .onAppear {
                    viewModel.checkUserAuthorizationStatus()
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
