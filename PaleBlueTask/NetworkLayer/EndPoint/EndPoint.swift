//
//  EndPoint.swift
//  PaleBlueTask
//
//  Created by Eng.Omar Elsayed on 08/08/2024.
//

import Foundation
import GenericNetworkLayer

private let apiKey = "22577733-edb14e0d0f3f9c1a039c57e48"

enum EndPoint {
  case getImages(page: Int)
}

extension EndPoint: EndPointProtocol {
  var scheme: APISchemeType {
    return .https
  }
  
  var host: String? {
    switch self {
    case .getImages:
      return "pixabay.com"
    }
  }
  
  var path: String {
    switch self {
    case .getImages:
      return "/api/"
    }
  }
  
  var queryItems: [URLQueryItem]? {
    switch self {
    case let .getImages(page):
      return [URLQueryItem(name: "key", value: "\(apiKey)"),
              URLQueryItem(name: "q", value: "ball"),
              URLQueryItem(name: "image_type", value: "photo"),
              URLQueryItem(name: "page", value: "\(page)"),
              URLQueryItem(name: "per_page", value: "16")]
    }
  }
  
  var urlRequest: URLRequest? {
    return nil
  }
}
