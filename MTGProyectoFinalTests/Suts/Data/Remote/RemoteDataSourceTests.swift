//
//  RemoteDataSourceTests.swift
//  MTGProyectoFinalTests
//
//  Created by Díez Sobrino Cristina on 8/8/23.
//

import XCTest
@testable import MTGProyectoFinal

final class RemoteDataSourceTests: XCTestCase {

    var sut: RemoteDataSourceProtocol?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = RemoteDataSourceImpl()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
        
    }

    func testRemoteDataSource_whenGetCardsWithSuccessResult_expectCards() async throws {
        // GIVEN
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolMock.self]
        
        // Inyectamos la configuración nuestra al mock
        let mockURLSession = URLSession.init(configuration: configuration)
        sut = RemoteDataSourceImpl(session: mockURLSession)
        
        // Le metemos el request handler con status code y la data que queramos
        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            let cards = AllCards(cards: [Card(imageUrl: "", name: "one", text: "", cmc: 0, colors: nil, manaCost: "", type: "", types: [""], supertypes: nil, subtypes: nil, rarity: "", power: "", toughness: "")])
            let data = try JSONEncoder().encode(cards) // Requiere cambiar hero a Encodable --> Decodable + Encodable = Codable
            return (response, data)
        }
        
        // WHEN
        guard let cards = try? await sut?.getCards() else {
            XCTFail("Cards must contain a card")
            return
        }
        
        // THEN
        XCTAssertNotNil(cards.first)
        XCTAssertEqual(cards.first?.name, "one")
    }

}
