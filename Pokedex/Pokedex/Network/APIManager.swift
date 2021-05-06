//
//  APIManager.swift
//  Pokedex
//
//  Created by 이준성 on 2021/05/04.
//

import Moya
import SwiftyJSON

struct APIManger {

    private let provider = MoyaProvider<APIService>()

    func fetch(_ api: APIService, completion: @escaping (JSON) -> Void, failure: @escaping (Error) -> Void) {
        provider.request(api) { result in
            switch result {
            case let .success(response):
                completion(JSON(response.data))

            case let .failure(error):
                failure(error)
            }
        }
    }
}
