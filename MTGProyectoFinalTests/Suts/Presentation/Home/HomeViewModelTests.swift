//
//  HomeViewModelTests.swift
//  MTGProyectoFinalTests
//
//  Created by Díez Sobrino Cristina on 8/8/23.
//

import XCTest
@testable import MTGProyectoFinal

final class HomeViewModelTests: XCTestCase {
    
    var sut: HomeViewModel?

    override func setUpWithError() throws {
        try super.setUpWithError()
        let mockRepository = MockRespository()
        sut = HomeViewModel(repository: mockRepository)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testHomeViewModel_whenSearching_expectCardsContainsSearchedWordOnNameOrTypes() throws {
        //GIVEN

        let cards = [Card(imageUrl: "", name: "one", text: "", cmc: 0, colors: nil, manaCost: "", type: "", types: [""], supertypes: nil, subtypes: nil, rarity: "", power: "", toughness: ""),
                     Card(imageUrl: "", name: "searchedWord", text: "", cmc: 0, colors: nil, manaCost: "", type: "", types: [""], supertypes: nil, subtypes: nil, rarity: "", power: "", toughness: ""),
                     Card(imageUrl: "", name: "three", text: "", cmc: 0, colors: nil, manaCost: "", type: "searchedWord anotherType", types: [""], supertypes: nil, subtypes: nil, rarity: "", power: "", toughness: "")]
        
        //WHEN
        sut?.cards = cards
        sut?.searchText = "searchedWord"
        //THEN
        XCTAssertNotNil(sut?.filteredCards.first)
        XCTAssertEqual(sut?.filteredCards.count, 2)
        XCTAssertEqual(sut?.filteredCards.first?.name, "searchedWord")
        XCTAssertTrue(((sut?.filteredCards.last?.type.contains("searchedWord")) != nil))
        
    }
    
    func testHomeViewModel_whenSearchingWithNoInput_expectShowAllCards() throws {
        //GIVEN
        let cards = [Card(imageUrl: "", name: "one", text: "", cmc: 0, colors: nil, manaCost: "", type: "", types: [""], supertypes: nil, subtypes: nil, rarity: "", power: "", toughness: ""),
                     Card(imageUrl: "", name: "two", text: "", cmc: 0, colors: nil, manaCost: "", type: "", types: [""], supertypes: nil, subtypes: nil, rarity: "", power: "", toughness: ""),
                     Card(imageUrl: "", name: "three", text: "", cmc: 0, colors: nil, manaCost: "", type: "", types: [""], supertypes: nil, subtypes: nil, rarity: "", power: "", toughness: "")]
        //WHEN
        sut?.cards = cards
        sut?.searchText = ""
        //THEN
        XCTAssertNotNil(sut?.filteredCards.first)
        XCTAssertEqual(sut?.filteredCards.count, 3) //must show all cards because theres no filter word
        XCTAssertEqual(sut?.filteredCards.first?.name, "one") //first must be one
        
    }

    func testPerformanceExample() throws {
        let expectation = XCTestExpectation(description: "ERROR")
        sut?.getCards(){
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(sut?.cards.count, 1)
    }

}
