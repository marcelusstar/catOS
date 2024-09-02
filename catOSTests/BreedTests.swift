//
//  BreedTests.swift
//  catOSTests
//
//  Created by rosadiez on 1/9/24.
//

import XCTest
@testable import catOS

// Assuming the Breed struct is already imported or defined in this file.

class BreedTests: XCTestCase {
    
    func testBreedInitialization() {
        // Given
        let weight = Weight(imperial: "7 - 15", metric: "3 - 7")
        let breed = Breed(
            weight: weight,
            id: "abys",
            name: "Abyssinian",
            temperament: "Active, Energetic, Independent, Intelligent, Gentle",
            origin: "Egypt",
            countryCodes: "EG",
            countryCode: "EG",
            description: "The Abyssinian is easy to care for, and a joy to have in your home.",
            lifeSpan: "14 - 15",
            indoor: true,
            lap: true,
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
            experimental: false,
            hairless: false,
            natural: true,
            rare: false,
            rex: false,
            suppressedTail: false,
            shortLegs: false,
            wikipediaURL: "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
            hypoallergenic: false,
            referenceImageID: "0XYvRd7oD"
        )
        
        // Then
        XCTAssertEqual(breed.weight.imperial, "7 - 15")
        XCTAssertEqual(breed.weight.metric, "3 - 7")
        XCTAssertEqual(breed.id, "abys")
        XCTAssertEqual(breed.name, "Abyssinian")
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
}
