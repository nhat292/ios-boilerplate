//
//  APITarget.swift
//  Boilerplate
//
//  Created by Quyen Xuan on 3/29/18.
//  Copyright © 2018 Innovatube. All rights reserved.
//

import Alamofire
import Moya

protocol APITargetType: TargetType, AccessTokenAuthorizable {}

extension APITargetType {

    /// The target's base `URL`.
    // swiftlint:disable force_unwrapping
    var baseURL: URL {
        return URL(string: BoilerplateClientAPIKeys.basePath)!
    }
    // swiftlint:enable force_unwrapping

    /// The type of HTTP task to be performed.
    var task: Task {
        let encoding: ParameterEncoding
        switch method {
        case .post:
            encoding = JSONEncoding.default
        default:
            encoding = URLEncoding.default
        }
        if let requestParameters = parameters {
            return .requestParameters(parameters: requestParameters, encoding: encoding)
        }
        return .requestPlain
    }

    /// The headers to be used in the request.
    var headers: [String: String]? {
        return nil
    }

    var parameters: [String: Any]? {
        return nil
    }

    var authorizationType: AuthorizationType {
        return .none
    }
}
