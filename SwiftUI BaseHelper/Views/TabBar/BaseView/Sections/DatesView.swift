//
//  DatesView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 30/07/24.
//

import SwiftUI

struct DatesView: View {

    let simpleDate: String = "01/02/2016"
    let isoDate: String = "2022-12-14T04:30:00+05:30"

    var body: some View {
        VStack {
            Text(simpleDate.asDate?.description ?? "")
            Text(isoDate.asDate?.description ?? "")
        }
    }
}
