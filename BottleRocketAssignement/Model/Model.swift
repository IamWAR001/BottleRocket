//
//  LunchModel.swift
//  BottleRocketAssignement
//
//  Created by  Created by Nicholas Gilbert on 4/15/21.

import Foundation

// MARK: - Lunch
struct LunchData: Codable{
    var restaurants: [Restaurant]
}

// MARK: - Restaurant
struct Restaurant: Codable {
    let name: String
    let backgroundImageURL: String
    let category: String
    let contact: Contact?
    let location: Location?
    
    init(name:String,
         backgroundImageURL:String,
         category:String,
         location: Location,
         contact:Contact?){
        self.name = name
        self.backgroundImageURL = backgroundImageURL
        self.category = category
        self.contact = contact
        self.location = location
    }
}
// MARK: - Contact
struct Contact: Codable {
    let phone, formattedPhone: String
    let twitter, facebook, facebookUsername, facebookName: String?
}
// MARK: - Location
struct Location: Codable {
    let address: String
    let crossStreet: String?
    let lat, lng: Double
    let postalCode: String?
    let cc: Cc
    let city: City
    let country: Country
    let formattedAddress: [String]
}

enum Cc: String, Codable {
    case us = "US"
}

enum City: String, Codable {
    case addison = "Addison"
    case dallas = "Dallas"
}

enum Country: String, Codable {
    case unitedStates = "United States"
}
