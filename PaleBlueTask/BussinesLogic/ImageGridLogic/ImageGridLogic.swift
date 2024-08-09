//
//  ImageGridLogic.swift
//  PaleBlueTask
//
//  Created by Eng.Omar Elsayed on 08/08/2024.
//

import Foundation
import Injection

final class ImageGridLogic {
  @Injected(\.networkManger) private var networkManger
  private var pageNumber: Int = 1
}

extension ImageGridLogic: ImageGridLogicProtocol {
  func getImages() async throws -> [ImageDataDisplay] {
    let resultedImages = try await networkManger.getImages(EndPoint.getImages(page: pageNumber))
    pageNumber += 1
    return resultedImages.convertToImageDataDisplay()
  }
}

