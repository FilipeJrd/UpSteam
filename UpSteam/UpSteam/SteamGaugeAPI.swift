//
//  SteamGauge.swift
//  UpSteam
//
//  Created by Filipe Jordão on 09/03/17.
//  Copyright © 2017 FilipeJrd. All rights reserved.
//
import Moya
import Foundation

let SteamGaugeProvider = MoyaProvider<SteamGauge>()

public enum SteamGauge{
    case status
}

extension SteamGauge: TargetType {

    public var baseURL: URL { return URL(string: "http://steamgaug.es")! }
    public var path : String {
        switch self {
        case .status:
            return "/api/v2"
        }
    }
    public var method: Moya.Method {
        return .get
    }
    public var parameters: [String:Any]? {
        switch self {
        default:
            return nil
        }
    }
    public var parameterEncoding: ParameterEncoding{
        return URLEncoding.default
    }
    public var task: Task{
        return .request
    }
    public var validate: Bool{
        switch self {
        default:
            return false
        }
    }
    public var sampleData: Data{
        return Data()
    }
}

public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

