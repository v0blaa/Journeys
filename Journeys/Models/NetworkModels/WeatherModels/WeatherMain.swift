//
//  WeatherMain.swift
//  ArchitecureDemo
//
//  Created by Yury Bogdanov on 26.03.2022.
//

import Foundation

struct WeatherMain: Decodable {
    let date: [String]
    let weatherCode: [Int]
    let temperatureMax: [Float]
    let temperatureMin: [Float]
    
    
    enum CodingKeys: String, CodingKey {
        case date = "time"
        case weatherCode = "weathercode"
        case temperatureMax = "temperature_2m_max"
        case temperatureMin = "temperature_2m_min"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        date = try values.decode([String].self, forKey: .date)
        weatherCode = try values.decode([Int].self, forKey: .weatherCode)
        temperatureMax = try values.decode([Float].self, forKey: .temperatureMax)
        temperatureMin = try values.decode([Float].self, forKey: .temperatureMin)
    }
}
