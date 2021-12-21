//
//  DetailData.swift
//  DramaInfo
//
//  Created by Yundong Lee on 2021/12/21.
//

import Foundation

// MARK: - DetailData
struct DetailData: Codable {
    let name: String
    let number_of_episodes, number_of_seasons: Int
    let seasons: [Season]
}

// MARK: - Season
struct Season: Codable {
    let airDate: String
    let episodeCount, id: Int
    let name, overview: String
    let posterPath: String
    let seasonNumber: Int

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeCount = "episode_count"
        case id, name, overview
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
    }
}


