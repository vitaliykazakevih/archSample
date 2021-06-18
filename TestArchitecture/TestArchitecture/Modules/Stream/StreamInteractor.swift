//
//  StreamInteractor.swift
//  TestArchitecture
//
//  Created by Kazakevich, Vitaly on 18.06.21.
//

import Foundation

extension StreamInteractor {
    struct Dependencies {
        let openTokService: OpenTokService
    }

    struct Parameters {
        let userName: String
    }
}

final class StreamInteractor {
    private let parameters: Parameters
    private let dependencies: Dependencies
    private weak var view: StreamViewable?
    private weak var output: StreamOutput?

    init(parameters: Parameters,
         dependencies: Dependencies,
         view: StreamViewable,
         output: StreamOutput) {
        self.parameters = parameters
        self.dependencies = dependencies
        self.view = view
        self.output = output
    }
}

extension StreamInteractor: StreamInteractable {
    func didLoad() {
        _ = dependencies.openTokService.connect()
        // then
        view?.configure(with: .init())
    }

    func didTapConnect() {
        _ = dependencies.openTokService.publish(.init(id: "0"))
        // then
        view?.showSuccess()
    }

    func didTapFinish() {
        output?.startPageShouldFinish()
    }
}
