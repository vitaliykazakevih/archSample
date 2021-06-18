//
//  ServiceContainer.swift
//  TestArchitecture
//
//  Created by Kazakevich, Vitaly on 18.06.21.
//

import Foundation

final class DependencyContainer {

    // Dummy implementation.
    static let shared = DependencyContainer()
    private init() {}

    lazy var network = TestNetworkService()
    lazy var openTok: OpenTokService = TestOpenTokService(dependencies: .init(network: network))
}
