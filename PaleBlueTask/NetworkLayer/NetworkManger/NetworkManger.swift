//
//  NetworkManger.swift
//  PaleBlueTask
//
//  Created by Eng.Omar Elsayed on 08/08/2024.
//

import Foundation
import Injection
import protocol GenericNetworkLayer.EndPointProtocol

final class NetworkManger {
  @Injected(\.httpClient) private var httpClient
}

extension NetworkManger: NetworkMangerProtocol {
  func getImages(_ endpoint: EndPointProtocol) async throws -> [ImageDataFromApi] {
    let apiResult: (result: ApiResponse, statusCode: Int) = try await httpClient.data(for: endpoint)
    return apiResult.result.hits
  }
}
