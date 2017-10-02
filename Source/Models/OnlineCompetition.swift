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
    enum JumpsKind: String, Codable {
        case skydive
        case base
    }

    enum SuitsKind: String, Codable {
        case wingsuit
        case tracksuit
        case monotrack
        case slick
    }

    enum Discipline: String, Codable {
        case time
        case distance
        case speed
        case distanceInTime = "distance_in_time"
        case distanceInAltitude = "distance_in_altitude"
    }

    let id: Int
    let name: String
    let discipline: Discipline

    let rangeFrom: Double
    let rangeTo: Double
    let disciplineParameter: Int
    let periodFrom: Date
    let periodTo: Date
    let jumpsKind: JumpsKind
    let suitsKind: SuitsKind
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
