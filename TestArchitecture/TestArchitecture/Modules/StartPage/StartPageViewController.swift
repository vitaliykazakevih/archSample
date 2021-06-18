//
//  StartPageViewController.swift
//  TestArchitecture
//
//  Created by Kazakevich, Vitaly on 18.06.21.
//

import UIKit

final class StartPageViewController: UIViewController {
    // UI can go to storyboard
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let startButton = UIButton()

    var interactor: StartPageInteractable?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        interactor?.didLoad()
    }
}

extension StartPageViewController: StartPageViewable {
    func configure(with viewModel: StartPageViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
    }
}

private extension StartPageViewController {
    func setupUI() {
        view.backgroundColor = .blue
        let container = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, startButton])
        container.translatesAutoresizingMaskIntoConstraints = false
        container.spacing = 16
        container.axis = .vertical

        view.addSubview(container)

        descriptionLabel.numberOfLines = 0

        NSLayoutConstraint.activate([
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        startButton.addTarget(self, action: #selector(didTapStart), for: .touchUpInside)
        startButton.setTitle("Start", for: .normal)
    }

    @objc func didTapStart() {
        interactor?.didTapStart()
    }
}
