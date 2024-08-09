//
//  ApiResponse.swift
//  PaleBlueTask
//
//  Created by Eng.Omar Elsayed on 08/08/2024.
//

import Foundation

struct ApiResponse: Decodable {
  let hits: [ImageDataFromApi]
}
