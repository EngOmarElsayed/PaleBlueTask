//
//  ImageDataDisplay.swift
//  PaleBlueTask
//
//  Created by Eng.Omar Elsayed on 08/08/2024.
//

import Foundation

struct ImageDataDisplay: Identifiable {
  let imageId: Int
  let previewURL: String
  let user: String
  let id: UUID = UUID()
}

