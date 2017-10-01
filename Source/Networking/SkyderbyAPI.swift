//
//  SkyderbyAPI.swift
//
//  Copyright © 2017 Skyderby. All rights reserved.

import Moya

let skyderbyProvider = MoyaProvider<SkyderbyAPI>(plugins: [NetworkLoggerPlugin()])

enum SkyderbyAPI {
    case getUser(userId: Int)

}

extension SkyderbyAPI: TargetType {
    static var baseDomain = "https://skyderby.ru"
    var baseURL: URL { return URL(string: SkyderbyAPI.baseDomain.appending("/api/v1"))! }

    var path: String {
        switch self {
        case .getUser(let userId):
            return "/profiles/\(userId)"
        }
    }

    var parameters: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }

    var task: Task {
        if let requestParameters = parameters {
            if method == .post {
                return .requestParameters(parameters: requestParameters, encoding: JSONEncoding.default)
            } else {
                return .requestParameters(parameters: requestParameters, encoding: URLEncoding.default)
            }
        }
        return .requestPlain
    }

    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }

    var headers: [String : String]? {
        return nil
    }

    var sampleData: Data {
        return Data()
    }
}
