//
//  ContentView.swift
//  PaleBlueTask
//
//  Created by Eng.Omar Elsayed on 08/08/2024.
//

import SwiftUI

struct ContentView: View {
  @StateObject var viewModel = ImageGridViewModel()
  
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
          ForEach(viewModel.imagesData, id: \.id) { image in
            ImageCellInfo(image: image)
              .padding(5)
              .onAppear {
                viewModel.checkForPagination(image)
              }
          }
        }
      }
      .navigationTitle("Photos")
    }
    .task {
      await viewModel.getImages()
    }
  }
}

#Preview {
  ContentView()
}
