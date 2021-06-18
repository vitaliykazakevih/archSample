//
//  StreamContract.swift
//  TestArchitecture
//
//  Created by Kazakevich, Vitaly on 18.06.21.
//

import Foundation

protocol StreamViewable: AnyObject {
    func configure(with viewModel: StreamViewModel)
    func showSuccess()
}

protocol StreamInteractable: AnyObject {
    func didLoad()
    func didTapConnect()
    func didTapFinish()
}

protocol StreamOutput: AnyObject {
    func startPageShouldFinish()
}

struct StreamViewModel {}
