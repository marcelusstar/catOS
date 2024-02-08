//
//  ApiBreedMapper.swift
//  catOS
//
//  Created by rosadiez on 8/2/24.
//

import Foundation

class ApiBreedMapper: Mapper {

    let apiWeightMapper: ApiWeightMapper = ApiWeightMapper()

    func map(_ entity: BreedEntity) -> Breed {
        Breed(
            weight: apiWeightMapper.map(entity.weight ?? WeightEntity(imperial: "", metric: "")),
            id: entity.id,
            name: entity.name ?? "",
            temperament: entity.temperament ?? "",
            origin: entity.origin ?? "",
            countryCodes: entity.countryCodes ?? "",
            countryCode: entity.countryCode ?? "",
            description: entity.description ?? "",
            lifeSpan: entity.lifeSpan ?? "",
            indoor: entity.indoor == 1,
            lap: entity.lap == 1,
            altNames: entity.altNames ?? "",
            adaptability: entity.adaptability ?? 0,
            affectionLevel: entity.affectionLevel ?? 0,
            childFriendly: entity.childFriendly ?? 0,
            dogFriendly: entity.dogFriendly ?? 0,
            energyLevel: entity.energyLevel ?? 0,
            grooming: entity.grooming ?? 0,
            healthIssues: entity.healthIssues ?? 0,
            intelligence: entity.intelligence ?? 0,
            sheddingLevel: entity.sheddingLevel ?? 0,
            socialNeeds: entity.socialNeeds ?? 0,
            strangerFriendly: entity.strangerFriendly ?? 0,
            vocalisation: entity.vocalisation ?? 0,
            experimental: entity.experimental == 1,
            hairless: entity.hairless == 1,
            natural: entity.natural == 1,
            rare: entity.rare == 1,
            rex: entity.rex == 1,
            suppressedTail: entity.suppressedTail == 1,
            shortLegs: entity.shortLegs == 1,
            wikipediaURL: entity.wikipediaURL ?? "",
            hypoallergenic: entity.hypoallergenic == 1,
            referenceImageID: entity.referenceImageID ?? ""
        )
    }
}

