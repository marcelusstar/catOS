//
//  ApiBreedMapperTests.swift
//  catOSTests
//
//  Created by rosadiez on 1/9/24.
//

import Foundation

import XCTest
@testable import catOS

class ApiBreedMapperTests: XCTestCase {
    
    var apiBreedMapper: ApiBreedMapper!
    
    override func setUp() {
        super.setUp()
        apiBreedMapper = ApiBreedMapper()
    }
    
    override func tearDown() {
        apiBreedMapper = nil
        super.tearDown()
    }
    
    func testBreedEntityMappingToBreed() {
        // Given
        let weightEntity = WeightDTO(imperial: "7 - 15", metric: "3 - 7")
        let breedEntity = BreedDTO(
            id: "abys",
            name: "Abyssinian",
            weight: weightEntity,
            temperament: "Active, Energetic, Independent, Intelligent, Gentle",
            origin: "Egypt",
            countryCodes: "EG",
            countryCode: "EG",
            description: "The Abyssinian is easy to care for, and a joy to have in your home.",
            lifeSpan: "14 - 15",
            indoor: 1,
            lap: 1,
            altNames: "Aby",
            adaptability: 5,
            affectionLevel: 5,
            childFriendly: 3,
            dogFriendly: 4,
            energyLevel: 5,
            grooming: 1,
            healthIssues: 2,
            intelligence: 5,
            sheddingLevel: 2,
            socialNeeds: 5,
            strangerFriendly: 5,
            vocalisation: 1,
            experimental: 0,
            hairless: 0,
            natural: 1,
            rare: 0,
            rex: 0,
            suppressedTail: 0,
            shortLegs: 0,
            wikipediaURL: "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
            hypoallergenic: 0,
            referenceImageID: "0XYvRd7oD"
        )
        
        // When
        let breed = apiBreedMapper.mapValues(breedEntity)
        
        // Then
        XCTAssertEqual(breed.id, "abys")
        XCTAssertEqual(breed.name, "Abyssinian")
        XCTAssertEqual(breed.weight.imperial, "7 - 15")
        XCTAssertEqual(breed.weight.metric, "3 - 7")
        XCTAssertEqual(breed.temperament, "Active, Energetic, Independent, Intelligent, Gentle")
        XCTAssertEqual(breed.origin, "Egypt")
        XCTAssertEqual(breed.countryCodes, "EG")
        XCTAssertEqual(breed.countryCode, "EG")
        XCTAssertEqual(breed.description, "The Abyssinian is easy to care for, and a joy to have in your home.")
        XCTAssertEqual(breed.lifeSpan, "14 - 15")
        XCTAssertTrue(breed.indoor)
        XCTAssertTrue(breed.lap)
        XCTAssertEqual(breed.altNames, "Aby")
        XCTAssertEqual(breed.adaptability, 5)
        XCTAssertEqual(breed.affectionLevel, 5)
        XCTAssertEqual(breed.childFriendly, 3)
        XCTAssertEqual(breed.dogFriendly, 4)
        XCTAssertEqual(breed.energyLevel, 5)
        XCTAssertEqual(breed.grooming, 1)
        XCTAssertEqual(breed.healthIssues, 2)
        XCTAssertEqual(breed.intelligence, 5)
        XCTAssertEqual(breed.sheddingLevel, 2)
        XCTAssertEqual(breed.socialNeeds, 5)
        XCTAssertEqual(breed.strangerFriendly, 5)
        XCTAssertEqual(breed.vocalisation, 1)
        XCTAssertFalse(breed.experimental)
        XCTAssertFalse(breed.hairless)
        XCTAssertTrue(breed.natural)
        XCTAssertFalse(breed.rare)
        XCTAssertFalse(breed.rex)
        XCTAssertFalse(breed.suppressedTail)
        XCTAssertFalse(breed.shortLegs)
        XCTAssertEqual(breed.wikipediaURL, "https://en.wikipedia.org/wiki/Abyssinian_(cat)")
        XCTAssertFalse(breed.hypoallergenic)
        XCTAssertEqual(breed.referenceImageID, "0XYvRd7oD")
    }
    
    func testBreedEntityMappingWithNilValues() {
        // Given
        let breedEntity = BreedDTO(
            id: "abys",
            name: nil,
            weight: nil,
            temperament: nil,
            origin: nil,
            countryCodes: nil,
            countryCode: nil,
            description: nil,
            lifeSpan: nil,
            indoor: nil,
            lap: nil,
            altNames: nil,
            adaptability: nil,
            affectionLevel: nil,
            childFriendly: nil,
            dogFriendly: nil,
            energyLevel: nil,
            grooming: nil,
            healthIssues: nil,
            intelligence: nil,
            sheddingLevel: nil,
            socialNeeds: nil,
            strangerFriendly: nil,
            vocalisation: nil,
            experimental: nil,
            hairless: nil,
            natural: nil,
            rare: nil,
            rex: nil,
            suppressedTail: nil,
            shortLegs: nil,
            wikipediaURL: nil,
            hypoallergenic: nil,
            referenceImageID: nil
        )
        
        // When
        let breed = apiBreedMapper.mapValues(breedEntity)
        
        // Then
        XCTAssertEqual(breed.id, "abys")
        XCTAssertEqual(breed.name, "")
        XCTAssertEqual(breed.weight.imperial, "")
        XCTAssertEqual(breed.weight.metric, "")
        XCTAssertEqual(breed.temperament, "")
        XCTAssertEqual(breed.origin, "")
        XCTAssertEqual(breed.countryCodes, "")
        XCTAssertEqual(breed.countryCode, "")
        XCTAssertEqual(breed.description, "")
        XCTAssertEqual(breed.lifeSpan, "")
        XCTAssertFalse(breed.indoor)
        XCTAssertFalse(breed.lap)
        XCTAssertEqual(breed.altNames, "")
        XCTAssertEqual(breed.adaptability, 0)
        XCTAssertEqual(breed.affectionLevel, 0)
        XCTAssertEqual(breed.childFriendly, 0)
        XCTAssertEqual(breed.dogFriendly, 0)
        XCTAssertEqual(breed.energyLevel, 0)
        XCTAssertEqual(breed.grooming, 0)
        XCTAssertEqual(breed.healthIssues, 0)
        XCTAssertEqual(breed.intelligence, 0)
        XCTAssertEqual(breed.sheddingLevel, 0)
        XCTAssertEqual(breed.socialNeeds, 0)
        XCTAssertEqual(breed.strangerFriendly, 0)
        XCTAssertEqual(breed.vocalisation, 0)
        XCTAssertFalse(breed.experimental)
        XCTAssertFalse(breed.hairless)
        XCTAssertFalse(breed.natural)
        XCTAssertFalse(breed.rare)
        XCTAssertFalse(breed.rex)
        XCTAssertFalse(breed.suppressedTail)
        XCTAssertFalse(breed.shortLegs)
        XCTAssertEqual(breed.wikipediaURL, "")
        XCTAssertFalse(breed.hypoallergenic)
        XCTAssertEqual(breed.referenceImageID, "")
    }
}
