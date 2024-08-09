//
//  NetworkMangerProtocol.swift
//  PaleBlueTask
//
//  Created by Eng.Omar Elsayed on 08/08/2024.
//

import Foundation
import GenericNetworkLayer

protocol NetworkMangerProtocol {
  func getImages(_ endpoint: EndPointProtocol) async throws -> [ImageDataFromApi]
}
