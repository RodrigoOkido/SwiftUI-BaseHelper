//
//  MapView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 17/10/22.
//

import SwiftUI
import MapKit
import CoreLocation
import DesignSystem

struct MapView: View {
    
    // MARK: - View Model
    @ObservedObject private var viewModel: MapViewModel

    // MARK: - Property Wrappers
    @State var toggleStatus: Bool
    
    // MARK: - Initializer
    init(viewModel: MapViewModel = MapViewModel(),
         toggleStatus: Bool = false) {
        self.viewModel = viewModel
        self.toggleStatus = toggleStatus
    }

    var body: some View {

        ZStack {
            Map(coordinateRegion: $viewModel.region, 
                showsUserLocation: toggleStatus ? true : false,
                userTrackingMode: .constant(.follow))
                .edgesIgnoringSafeArea([.top, .leading, .trailing])
                .onChange(of: toggleStatus) { status, _ in
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
                .padding(InsetSpacing.quarck)
                .background(.black)
                .opacity(OpacityLevel.opaque)
            }
        }
        .alert(isPresented: $viewModel.permissionDenied) {
            Alert(title: Text("Localization Denied"), 
                  message: Text("Please enable localizations permission in App Settings to track your current location."),
                  dismissButton: .default(Text("Go to settings"),
                                          action: {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }))
        }
        .onAppear {
            viewModel.checkUserAuthorizationStatus()
        }
    }
}

#Preview {
    MapView()
}
