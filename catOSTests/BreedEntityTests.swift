//
//  BreedEntityTests.swift
//  catOSTests
//
//  Created by rosadiez on 1/9/24.
//

import XCTest
@testable import catOS


class BreedEntityTests: XCTestCase {
    
    func testBreedEntityInitialization() {
        // Given
        let weight = WeightEntity(imperial: "7 - 15", metric: "3 - 7")
        
        // When
        let breedEntity = BreedEntity(
            id: "abys",
            name: "Abyssinian",
            weight: weight,
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
        
        // Then
        XCTAssertEqual(breedEntity.id, "abys")
        XCTAssertEqual(breedEntity.name, "Abyssinian")
        XCTAssertEqual(breedEntity.weight?.imperial, "7 - 15")
        XCTAssertEqual(breedEntity.weight?.metric, "3 - 7")
        XCTAssertEqual(breedEntity.temperament, "Active, Energetic, Independent, Intelligent, Gentle")
        XCTAssertEqual(breedEntity.origin, "Egypt")
        XCTAssertEqual(breedEntity.countryCodes, "EG")
        XCTAssertEqual(breedEntity.countryCode, "EG")
        XCTAssertEqual(breedEntity.description, "The Abyssinian is easy to care for, and a joy to have in your home.")
        XCTAssertEqual(breedEntity.lifeSpan, "14 - 15")
        XCTAssertEqual(breedEntity.indoor, 1)
        XCTAssertEqual(breedEntity.lap, 1)
        XCTAssertEqual(breedEntity.altNames, "Aby")
        XCTAssertEqual(breedEntity.adaptability, 5)
        XCTAssertEqual(breedEntity.affectionLevel, 5)
        XCTAssertEqual(breedEntity.childFriendly, 3)
        XCTAssertEqual(breedEntity.dogFriendly, 4)
        XCTAssertEqual(breedEntity.energyLevel, 5)
        XCTAssertEqual(breedEntity.grooming, 1)
        XCTAssertEqual(breedEntity.healthIssues, 2)
        XCTAssertEqual(breedEntity.intelligence, 5)
        XCTAssertEqual(breedEntity.sheddingLevel, 2)
        XCTAssertEqual(breedEntity.socialNeeds, 5)
        XCTAssertEqual(breedEntity.strangerFriendly, 5)
        XCTAssertEqual(breedEntity.vocalisation, 1)
        XCTAssertEqual(breedEntity.experimental, 0)
        XCTAssertEqual(breedEntity.hairless, 0)
        XCTAssertEqual(breedEntity.natural, 1)
        XCTAssertEqual(breedEntity.rare, 0)
        XCTAssertEqual(breedEntity.rex, 0)
        XCTAssertEqual(breedEntity.suppressedTail, 0)
        XCTAssertEqual(breedEntity.shortLegs, 0)
        XCTAssertEqual(breedEntity.wikipediaURL, "https://en.wikipedia.org/wiki/Abyssinian_(cat)")
        XCTAssertEqual(breedEntity.hypoallergenic, 0)
        XCTAssertEqual(breedEntity.referenceImageID, "0XYvRd7oD")
    }
    
    func testBreedEntityEncoding() throws {
        // Given
        let weight = WeightEntity(imperial: "7 - 15", metric: "3 - 7")
        let breedEntity = BreedEntity(
            id: "abys",
            name: "Abyssinian",
            weight: weight,
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
        let jsonData = try JSONEncoder().encode(breedEntity)
        
        // Then
        XCTAssertNotNil(jsonData)
        
        let jsonString = String(data: jsonData, encoding: .utf8)
        XCTAssertNotNil(jsonString)
        XCTAssertTrue(jsonString!.contains("\"id\":\"abys\""))
    }
    
    func testBreedEntityDecoding() throws {
        // Given
        let jsonString = """
        {
            "id": "abys",
            "name": "Abyssinian",
            "weight": {
                "imperial": "7 - 15",
                "metric": "3 - 7"
            },
            "temperament": "Active, Energetic, Independent, Intelligent, Gentle",
            "origin": "Egypt",
            "countryCodes": "EG",
            "countryCode": "EG",
            "description": "The Abyssinian is easy to care for, and a joy to have in your home.",
            "lifeSpan": "14 - 15",
            "indoor": 1,
            "lap": 1,
            "altNames": "Aby",
            "adaptability": 5,
            "affectionLevel": 5,
            "childFriendly": 3,
            "dogFriendly": 4,
            "energyLevel": 5,
            "grooming": 1,
            "healthIssues": 2,
            "intelligence": 5,
            "sheddingLevel": 2,
            "socialNeeds": 5,
            "strangerFriendly": 5,
            "vocalisation": 1,
            "experimental": 0,
            "hairless": 0,
            "natural": 1,
            "rare": 0,
            "rex": 0,
            "suppressedTail": 0,
            "shortLegs": 0,
            "wikipediaURL": "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
            "hypoallergenic": 0,
            "referenceImageID": "0XYvRd7oD"
        }
        """
        
        let jsonData = jsonString.data(using: .utf8)!
        
        // When
        let decodedEntity = try JSONDecoder().decode(BreedEntity.self, from: jsonData)
        
        // Then
        XCTAssertEqual(decodedEntity.id, "abys")
        XCTAssertEqual(decodedEntity.name, "Abyssinian")
        XCTAssertEqual(decodedEntity.weight?.imperial, "7 - 15")
        XCTAssertEqual(decodedEntity.weight?.metric, "3 - 7")
        XCTAssertEqual(decodedEntity.temperament, "Active, Energetic, Independent, Intelligent, Gentle")
    }
    
    func testBreedEntityDecodingWithMissingValues() throws {
        // Given
        let jsonString = """
        {
            "id": "abys"
        }
        """
        
        let jsonData = jsonString.data(using: .utf8)!
        
        // When
        let decodedEntity = try JSONDecoder().decode(BreedEntity.self, from: jsonData)
        
        // Then
        XCTAssertEqual(decodedEntity.id, "abys")
        XCTAssertNil(decodedEntity.name)
        XCTAssertNil(decodedEntity.weight)
        XCTAssertNil(decodedEntity.temperament)
    }
}
