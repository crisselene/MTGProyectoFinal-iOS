//
//  NetworkFetchingProtocol.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 8/8/23.
//

import Foundation

protocol NetworkFetchingProtocol {

    func data(url: URLRequest) async throws  -> (Data, URLResponse)
}
