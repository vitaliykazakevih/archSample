//
//  StreamRouter.swift
//  TestArchitecture
//
//  Created by Kazakevich, Vitaly on 18.06.21.
//

import UIKit

protocol StreamRouterDelegate: AnyObject {
    func streamPageShouldFinish(_ router: Router)
}

extension StreamRouter {
    struct Parameters {
        let userName: String
    }
}

final class StreamRouter: Router {
    private let container: DependencyContainer
    private let parameters: Parameters

    weak var delegate: StreamRouterDelegate?

    init(container: DependencyContainer, parameters: Parameters) {
        self.container = container
        self.parameters = parameters
    }

    func show(transition: (UIViewController) -> Void) {
        transition(makeViewController())
    }
}

extension StreamRouter: StreamOutput {
    func startPageShouldFinish() {
        delegate?.streamPageShouldFinish(self)
    }
}

private extension StreamRouter {
    func makeViewController() -> UIViewController {
        let streamViewController = StreamViewController()
        let interactor = StreamInteractor(
            parameters: .init(userName: parameters.userName),
            dependencies: .init(openTokService: container.openTok),
            view: streamViewController,
            output: self)
        streamViewController.interactor = interactor
        return streamViewController
    }
}
