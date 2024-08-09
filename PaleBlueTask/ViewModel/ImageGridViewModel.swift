//
//  ImageGridViewModel.swift
//  PaleBlueTask
//
//  Created by Eng.Omar Elsayed on 08/08/2024.
//

import Foundation
import Injection

final class ImageGridViewModel: ObservableObject {
  @Published var imagesData: [ImageDataDisplay] = []
  @Injected(\.imageGridLogic) private var imageGridLogic
}

extension ImageGridViewModel {
  @MainActor
  func getImages() async {
    do {
      let images = try await imageGridLogic.getImages()
      imagesData.append(contentsOf: images)
    } catch {
      print(error.localizedDescription)
    }
  }
  
  func checkForPagination(_ item: ImageDataDisplay) {
    if item.id == imagesData.last?.id {
      Task {
        await getImages()
      }
    }
  }
}
