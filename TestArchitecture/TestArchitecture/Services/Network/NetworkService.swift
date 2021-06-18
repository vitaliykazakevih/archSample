//
//  NetworkService.swift
//  TestArchitecture
//
//  Created by Kazakevich, Vitaly on 18.06.21.
//

import Foundation

protocol NetworkService {
    func makeRequest<T>() -> Response<T>
}

final class TestNetworkService: NetworkService {
    func makeRequest<T>() -> Response<T> {
        return .init(value: "response")
    }
}
