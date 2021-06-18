//
//  StartPageInteractor.swift
//  TestArchitecture
//
//  Created by Kazakevich, Vitaly on 18.06.21.
//

import Foundation

extension StartPageInteractor {
    struct Parameters {
        let userName: String
    }
}

final class StartPageInteractor {
    private let parameters: Parameters
    private weak var view: StartPageViewable?
    private weak var output: StartPageOutput?

    init(parameters: Parameters, view: StartPageViewable, output: StartPageOutput) {
        self.parameters = parameters
        self.view = view
        self.output = output
    }
}

extension StartPageInteractor: StartPageInteractable {
    func didLoad() {
        view?.configure(with: .init(title: parameters.userName, description: "Description"))
    }

    func didTapStart() {
        output?.startPageShouldStart()
    }
}
