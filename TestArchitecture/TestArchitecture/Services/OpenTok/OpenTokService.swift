//
//  OpenTokService.swift
//  TestArchitecture
//
//  Created by Kazakevich, Vitaly on 18.06.21.
//

import Foundation

protocol OpenTokServiceDelegate {
    func didReceive(signal: Signal)
    func didConnect()
}

protocol OpenTokService {
    func connect() -> Promise<Void>
    func publish(_ stream: Stream) -> Promise<Void> // can be subscriber instead of promises
}

extension TestOpenTokService {
    struct Dependencies {
        let network: NetworkService
    }
}

final class TestOpenTokService: OpenTokService {
    let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func connect() -> Promise<Void> {
        // do magic
        return .init()
    }

    func publish(_ stream: Stream) -> Promise<Void> {
        // do magic
        return .init()
    }
}
