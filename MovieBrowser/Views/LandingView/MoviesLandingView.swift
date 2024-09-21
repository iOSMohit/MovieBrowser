//
//  MoviesLandingView.swift
//  MovieBrowser
//
//  Created by Mohit Kumar on 21/09/24.
//

import SwiftUI
import SwiftData

struct MoviesLandingView: View {
    @StateObject private var viewModel = MoviesLandingViewModel()
    var body: some View {
        Text("Hello World...")
    }
}

#Preview {
    MoviesLandingView()
}
