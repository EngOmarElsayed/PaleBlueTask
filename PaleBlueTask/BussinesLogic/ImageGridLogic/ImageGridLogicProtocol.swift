//
//  ImageGridLogicProtocol.swift
//  PaleBlueTask
//
//  Created by Eng.Omar Elsayed on 08/08/2024.
//

import Foundation

protocol ImageGridLogicProtocol {
  func getImages() async throws -> [ImageDataDisplay]
}
