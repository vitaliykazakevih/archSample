//
//  StartPageContract.swift
//  TestArchitecture
//
//  Created by Kazakevich, Vitaly on 18.06.21.
//

import Foundation

protocol StartPageViewable: AnyObject {
    func configure(with viewModel: StartPageViewModel)
}

protocol StartPageInteractable: AnyObject {
    func didLoad()
    func didTapStart()
}

protocol StartPageOutput: AnyObject {
    func startPageShouldStart()
}

struct StartPageViewModel {
    let title: String
    let description: String
}
