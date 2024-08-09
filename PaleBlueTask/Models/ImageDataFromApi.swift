//
//  ImageData.swift
//  PaleBlueTask
//
//  Created by Eng.Omar Elsayed on 08/08/2024.
//

import Foundation

struct ImageDataFromApi: Decodable {
  let id: Int
  let previewURL: String
  let user: String
}

extension [ImageDataFromApi] {
  func convertToImageDataDisplay() -> [ImageDataDisplay] {
    return self.map { imageData in
      ImageDataDisplay(
        imageId: imageData.id,
        previewURL: imageData.previewURL,
        user: imageData.user
      )
    }
  }
}
