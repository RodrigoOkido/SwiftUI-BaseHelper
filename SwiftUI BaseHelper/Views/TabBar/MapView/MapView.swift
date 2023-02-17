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
    
    // MARK: - Property Wrappers
    @State var toggleStatus: Bool = false
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: toggleStatus ? true : false, userTrackingMode: .constant(.follow))
                .edgesIgnoringSafeArea([.top, .leading, .trailing])
                .onChange(of: toggleStatus) { status in
                    if !status {
                        viewModel.region = viewModel.defaultMapLocation
                    }
                }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Toggle("Your Location?", isOn: $toggleStatus)
                        .padding()
                        .foregroundColor(.white)
                }
                .padding(5)
                .background(.black)
                .opacity(0.8)
            }
        }
        .alert(isPresented: $viewModel.permissionDenied) {
            Alert(title: Text("Localization Denied"), message: Text("Please enable permission in App Settings."), dismissButton: .default(Text("Go to settings"), action: {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }))
        }
        .onAppear {
            viewModel.checkUserAuthorizationStatus()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
