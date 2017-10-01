//
//  OnlineCompetition.swift
//
//  Copyright © 2017 Skyderby. All rights reserved.

import Foundation

struct OnlineCompetitionResult: Codable {
    let competition: OnlineCompetition
    let overallRank: Int
    let overallResult: Double

    enum CodingKeys: String, CodingKey {
        case competition = "online_competition"
        case overallRank = "overall_rank"
        case overallResult = "overall_result"
    }
}

struct OnlineCompetitionGroup: Codable {
    let id: Int
    let name: String
}

struct OnlineCompetition: Codable {
    let id: Int
    let name: String
    let discipline: String

    let rangeFrom: Double
    let rangeTo: Double
    let disciplineParameter: Int
    let periodFrom: Date
    let periodTo: Date
    let jumpsKind: String
    let suitsKind: String
    let displayHighestGr: Bool
    let displayHighestSpeed: Bool
    let units: String

    let group: OnlineCompetitionGroup

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case discipline

        case rangeFrom = "range_from"
        case rangeTo = "range_to"
        case disciplineParameter = "discipline_parameter"
        case periodFrom = "period_from"
        case periodTo = "period_to"
        case jumpsKind = "jumps_kind"
        case suitsKind = "suits_kind"
        case displayHighestGr = "display_highest_gr"
        case displayHighestSpeed = "display_highest_speed"
        case units

        case group
    }
}
