//
//  StartPageRouter.swift
//  TestArchitecture
//
//  Created by Kazakevich, Vitaly on 18.06.21.
//

import UIKit

extension StartPageRouter {
    struct Parameters {
        let userName: String // actually it comes from service inside the interactor. but for example it's here
    }
}

final class StartPageRouter: Router {
    private let container: DependencyContainer
    private let parameters: Parameters

    private weak var viewController: UIViewController?

    init(container: DependencyContainer, parameters: Parameters) {
        self.container = container
        self.parameters = parameters
    }

    func show(transition: (UIViewController) -> Void) {
        let controller = makeViewController()
        viewController = controller
        transition(controller)
    }
}

extension StartPageRouter: StartPageOutput {
    func startPageShouldStart() {
        let streamRouter = StreamRouter(container: container,
                                        parameters: .init(userName: parameters.userName))
        streamRouter.delegate = self
        streamRouter.show {
            viewController?.present($0, animated: true)
            addChild(streamRouter)
        }
    }
}

extension StartPageRouter: StreamRouterDelegate {
    func streamPageShouldFinish(_ router: Router) {
        viewController?.dismiss(animated: true)
        removeChild(router)
    }
}

private extension StartPageRouter {
    func makeViewController() -> UIViewController {
        let startPageViewController = StartPageViewController()
        let interactor = StartPageInteractor(
            parameters: .init(userName: parameters.userName),
            view: startPageViewController,
            output: self)
        startPageViewController.interactor = interactor
        return startPageViewController
    }
}
