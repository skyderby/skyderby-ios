//
//  NetworkLogger.swift
//
//  Copyright © 2017 Evgeny Aleksandrov. All rights reserved.

import Moya
import Result

/// Logs network activity (outgoing requests and incoming responses).
final class NetworkLoggerPlugin: PluginType {
    /// If true, also logs response body data.
    public let isVerbose: Bool
    public let cURL: Bool

    public init(verbose: Bool = false, cURL: Bool = false) {
        self.cURL = cURL
        self.isVerbose = verbose
    }

    public func willSend(_ request: RequestType, target: TargetType) {
        if let request = request as? CustomDebugStringConvertible, cURL {
            Log.info("Sending request: " + request.debugDescription)
        } else if let urlRequest = request.request {
            let httpMethod = urlRequest.httpMethod ?? ""
            Log.info("Sending request: " + httpMethod + " " + urlRequest.description)
        } else {
            Log.error("Sending request: (invalid request)")
        }
    }

    public func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        switch result {
        case .success(let response):
            let statusString = "Received response (\(response.statusCode)) from \(response.request?.description ?? "")."

            if 200..<400 ~= response.statusCode {
                Log.info(statusString)
            } else {
                Log.error(statusString)
            }

            if isVerbose {
                Log.debug(logNetworkResponse(response.response, data: response.data, target: target))
            }
        case .failure(let error):
            switch error {
            case .underlying(let error, _):
                Log.error("Received networking error: \(error as NSError)")
            default:
                Log.error("Received networking error: \(error)")
            }
        }
    }

    private func logNetworkResponse(_ response: HTTPURLResponse?, data: Data?, target: TargetType) -> String {
        guard let response = response else {
            return "Received empty network response for \(target)."
        }

        var output: String = ""
        output += response.description

        if let data = data, let stringData = String(data: data, encoding: String.Encoding.utf8) {
            output += "\n"
            output += stringData
        }

        return output
    }
}
