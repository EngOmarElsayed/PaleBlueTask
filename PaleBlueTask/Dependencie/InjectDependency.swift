//
//  InjectDependency.swift
//  PaleBlueTask
//
//  Created by Eng.Omar Elsayed on 08/08/2024.
//

import Foundation
import Injection
import GenericNetworkLayer

@InjecteValues extension InjectedValues {
  var httpClient: GenericNetworkLayer = GenericNetworkLayer()
  var networkManger: NetworkMangerProtocol = NetworkManger()
  var imageGridLogic: ImageGridLogicProtocol = ImageGridLogic()
}
