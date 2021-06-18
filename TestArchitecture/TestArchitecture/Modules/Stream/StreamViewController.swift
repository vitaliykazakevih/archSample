//
//  StreamViewController.swift
//  TestArchitecture
//
//  Created by Kazakevich, Vitaly on 18.06.21.
//

import UIKit

final class StreamViewController: UIViewController {
    // UI can go to storyboard
    private let connectButton = UIButton()
    private let finishButton = UIButton()

    var interactor: StreamInteractable?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        interactor?.didLoad()
    }
}

extension StreamViewController: StreamViewable {
    func configure(with viewModel: StreamViewModel) {
        // configuration
    }

    func showSuccess() {
        let alert = UIAlertController(title: "Cool",
                                      message: "it's coming from interactor",
                                      preferredStyle: .alert)

        alert.addAction(.init(title: "Ok", style: .default) { [weak self] _ in
            self?.presentedViewController?.dismiss(animated: true)
        })
        present(alert, animated: true)
    }
}

private extension StreamViewController {
    func setupUI() {
        view.backgroundColor = .green
        let container = UIStackView(arrangedSubviews: [connectButton, finishButton])
        container.translatesAutoresizingMaskIntoConstraints = false
        container.spacing = 16
        container.axis = .vertical

        view.addSubview(container)

        NSLayoutConstraint.activate([
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        finishButton.addTarget(self, action: #selector(didTapFinish), for: .touchUpInside)
        finishButton.setTitle("Finish", for: .normal)

        connectButton.addTarget(self, action: #selector(didTapConnect), for: .touchUpInside)
        connectButton.setTitle("Connect", for: .normal)
    }

    @objc func didTapConnect() {
        interactor?.didTapConnect()
    }

    @objc func didTapFinish() {
        interactor?.didTapFinish()
    }
}
