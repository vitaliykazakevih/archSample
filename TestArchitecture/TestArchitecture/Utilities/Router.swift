//
//  Router.swift
//  TestArchitecture
//
//  Created by Kazakevich, Vitaly on 18.06.21.
//

import Foundation

class Router {
    private var children: [Router] = []

    final func addChild(_ child: Router) {
        children.append(child)
    }

    final func removeChild(_ child: Router) {
        _ = children.firstIndex { $0 === child }
            .map { children.remove(at: $0) }
    }
}
