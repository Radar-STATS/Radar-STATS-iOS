//
//  HTTPEnpoint.swift
//  RadarCOVIDStats
//
//  Original idea by Pedro José Pereira Vieito
//  Created by Jorge J. Ramos on 24/09/2020.
//

import Foundation

struct HTTPEndpoint: Equatable {
    private(set) var address: String
    private(set) var method: HTTPMethod
}

func == (lhs: HTTPEndpoint, rhs: HTTPEndpoint) -> Bool {
    return lhs.address == rhs.address && lhs.method == rhs.method
}