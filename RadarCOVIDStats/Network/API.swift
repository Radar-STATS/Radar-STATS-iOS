//
//  API.swift
//  RadarCOVIDStats
//
//  Original idea by Pedro José Pereira Vieito
//  Created by Jorge J. Ramos on 24/09/2020.
//

import Foundation

struct API {
    struct GitHub {
        static let stats = HTTPEndpoint(address: "https://raw.githubusercontent.com/pvieito/RadarCOVID-Report/master/Data/Resources/Current/RadarCOVID-Report-Summary-Results.json", method: .GET)
    }
}
