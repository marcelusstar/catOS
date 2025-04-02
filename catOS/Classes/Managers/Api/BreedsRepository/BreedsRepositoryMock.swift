//
//  BreedsRepositoryDefault.swift
//  catOS
//
//  Created by Marcelo Moran on 2/4/25.
//

struct BreedsRepositoryMock: BreedsRepository {
    func getBreeds() async throws -> [Breed] {
        
        let breed1 = Breed(
            weight: Weight(imperial: "7 - 10", metric: "3 - 5"),
            id: "abys",
            name: "Abyssinian",
            temperament: "Active, Energetic, Independent, Intelligent, Gentle",
            origin: "Egypt",
            countryCodes: "EG",
            countryCode: "EG",
            description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
            lifeSpan: "14 - 15",
            indoor: false,
            lap: true,
            altNames: "",
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
        
        let breed2 = Breed(
            weight: Weight(imperial: "7 - 10", metric: "3 - 5"),
            id: "aege",
            name: "Aegean",
            temperament: "Affectionate, Social, Intelligent, Playful, Active",
            origin: "Greece",
            countryCodes: "GR",
            countryCode: "GR",
            description: "Native to the Greek islands known as the Cyclades in the Aegean Sea, these are natural cats, meaning they developed without humans getting involved in their breeding. As a breed, Aegean Cats are rare, although they are numerous on their home islands. They are generally friendly toward people and can be excellent cats for families with children.",
            lifeSpan: "9 - 12",
            indoor: false,
            lap: true,
            altNames: "",
            adaptability: 5,
            affectionLevel: 4,
            childFriendly: 4,
            dogFriendly: 4,
            energyLevel: 3,
            grooming: 3,
            healthIssues: 1,
            intelligence: 3,
            sheddingLevel: 3,
            socialNeeds: 4,
            strangerFriendly: 4,
            vocalisation: 3,
            experimental: false,
            hairless: false,
            natural: false,
            rare: false,
            rex: false,
            suppressedTail: false,
            shortLegs: false,
            wikipediaURL: "https://en.wikipedia.org/wiki/Aegean_cat",
            hypoallergenic: false,
            referenceImageID: "ozEvzdVM-"
        )

        let breed3 = Breed(
            weight: Weight(imperial: "7 - 16", metric: "3 - 7"),
            id: "abob",
            name: "American Bobtail",
            temperament: "Intelligent, Interactive, Lively, Playful, Sensitive",
            origin: "United States",
            countryCodes: "US",
            countryCode: "US",
            description: "American Bobtails are loving and incredibly intelligent cats possessing a distinctive wild appearance. They are extremely interactive cats that bond with their human family with great devotion.",
            lifeSpan: "11 - 15",
            indoor: false,
            lap: true,
            altNames: "",
            adaptability: 5,
            affectionLevel: 5,
            childFriendly: 4,
            dogFriendly: 5,
            energyLevel: 3,
            grooming: 1,
            healthIssues: 1,
            intelligence: 5,
            sheddingLevel: 3,
            socialNeeds: 3,
            strangerFriendly: 3,
            vocalisation: 3,
            experimental: false,
            hairless: false,
            natural: false,
            rare: false,
            rex: false,
            suppressedTail: true,
            shortLegs: false,
            wikipediaURL: "https://en.wikipedia.org/wiki/American_Bobtail",
            hypoallergenic: false,
            referenceImageID: "hBXicehMA"
        )

        
        return [breed1, breed2, breed3]
    }
    
    func getBreed(id: String) async throws -> Breed {
        return Breed(
            weight: Weight(imperial: "7 - 10", metric: "3 - 5"),
            id: "abys",
            name: "Abyssinian",
            temperament: "Active, Energetic, Independent, Intelligent, Gentle",
            origin: "Egypt",
            countryCodes: "EG",
            countryCode: "EG",
            description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
            lifeSpan: "14 - 15",
            indoor: false,
            lap: true,
            altNames: "",
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
    }
}
