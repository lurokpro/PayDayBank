//
//  User.swift
//  PayDayBank
//
//  Created by Сергей Мирошниченко on 07.03.2020.
//  Copyright © 2020 7rlines. All rights reserved.
//

import Foundation

struct User: Codable {
    let id : Int
    let firstname : String
    let lastname : String
    let password : String
    let gender : String
    let email : String
    let dob : String
    let phone : String
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstname = "First Name"
        case lastname = "Last Name"
        case gender
        case email
        case dob
        case phone
        case password
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = (try? container.decode(Int.self, forKey: .id)) ?? 0
        self.firstname = (try? container.decode(String.self, forKey: .firstname)) ?? ""
        self.lastname = (try? container.decode(String.self, forKey: .lastname)) ?? ""
        self.gender = (try? container.decode(String.self, forKey: .gender)) ?? ""
        self.email = (try? container.decode(String.self, forKey: .email)) ?? ""
        self.password = (try? container.decode(String.self, forKey: .password)) ?? ""
        self.phone = (try? container.decode(String.self, forKey: .phone)) ?? ""
        self.dob = (try? container.decode(String.self, forKey: .dob)) ?? ""
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.id, forKey: .id)
        try container.encode(self.firstname, forKey: .firstname)
        try container.encode(self.lastname, forKey: .lastname)
        try container.encode(self.password, forKey: .password)
        try container.encode(self.gender, forKey: .gender)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.dob, forKey: .dob)
        try container.encode(self.phone, forKey: .phone)
    }
}
