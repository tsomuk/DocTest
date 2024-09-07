//
//  DoctocModel.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 17.03.2024.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let responce = try? JSONDecoder().decode(Responce.self, from: jsonData)

import Foundation

// MARK: - Responce
struct Responce: Codable {
    let count: Int
    let previous: JSONNull?
    let message: String
    let errors: JSONNull?
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let users: [User]
}

// MARK: - User
struct User: Codable, Identifiable {
    let id, slug, firstName, patronymic: String
    let lastName, gender: String
    let genderLabel: GenderLabel
    let specialization: [Specialization]
    let ratings: [Rating]
    let ratingsRating: Double
    let seniority, textChatPrice, videoChatPrice, homePrice: Int
    let hospitalPrice: Int
    let avatar: String?
    let nearestReceptionTime: Int?
    let freeReceptionTime: [FreeReceptionTime]
    let educationTypeLabel: EducationTypeLabel?
    let higherEducation: [HigherEducation]
    let workExpirience: [WorkExpirience]
    let advancedTraining: [AdvancedTraining]
    let rank: Int
    let rankLabel: String
    let scientificDegree: Int
    let scientificDegreeLabel: ScientificDegreeLabel
    let category: Int
    let categoryLabel: CategoryLabel
    let isFavorite: Bool

    enum CodingKeys: String, CodingKey {
        case id, slug
        case firstName = "first_name"
        case patronymic
        case lastName = "last_name"
        case gender
        case genderLabel = "gender_label"
        case specialization, ratings
        case ratingsRating = "ratings_rating"
        case seniority
        case textChatPrice = "text_chat_price"
        case videoChatPrice = "video_chat_price"
        case homePrice = "home_price"
        case hospitalPrice = "hospital_price"
        case avatar
        case nearestReceptionTime = "nearest_reception_time"
        case freeReceptionTime = "free_reception_time"
        case educationTypeLabel = "education_type_label"
        case higherEducation = "higher_education"
        case workExpirience = "work_expirience"
        case advancedTraining = "advanced_training"
        case rank
        case rankLabel = "rank_label"
        case scientificDegree = "scientific_degree"
        case scientificDegreeLabel = "scientific_degree_label"
        case category
        case categoryLabel = "category_label"
        case isFavorite = "is_favorite"
    }
}

// MARK: - AdvancedTraining
struct AdvancedTraining: Codable {
    let id: Int
    let organization, position: String
    let endDate: Int
    let file: String
    let isModerated: Bool

    enum CodingKeys: String, CodingKey {
        case id, organization, position
        case endDate = "end_date"
        case file
        case isModerated = "is_moderated"
    }
}

enum CategoryLabel: String, Codable {
    case вторая = "вторая"
    case высшая = "высшая"
    case нет = "нет"
    case первая = "первая"
}

// MARK: - EducationTypeLabel
struct EducationTypeLabel: Codable {
    let id: Int
    let name: String
}

// MARK: - FreeReceptionTime
struct FreeReceptionTime: Codable {
    let time: Int
}

enum GenderLabel: String, Codable {
    case женщина = "Женщина"
    case мужчина = "Мужчина"
}

// MARK: - HigherEducation
struct HigherEducation: Codable {
    let id: Int
    let university, specialization, qualification: String
    let startDate, endDate: Int
    let untilNow, isModerated: Bool

    enum CodingKeys: String, CodingKey {
        case id, university, specialization, qualification
        case startDate = "start_date"
        case endDate = "end_date"
        case untilNow = "until_now"
        case isModerated = "is_moderated"
    }
}

// MARK: - Rating
struct Rating: Codable {
    let id: Int
    let name: Name
    let value: Double
}

enum Name: String, Codable {
    case внимательность = "Внимательность"
    case ответственность = "Ответственность"
    case профессионализм = "Профессионализм"
    case пунктуальность = "Пунктуальность"
    case рейтинг = "Рейтинг"
}

enum ScientificDegreeLabel: String, Codable {
    case докторМедицинскихНаук = "доктор медицинских наук"
    case кандидатМедицинскихНаук = "кандидат медицинских наук"
    case нет = "нет"
}

// MARK: - Specialization
struct Specialization: Codable {
    let id: Int
    let name: String
    let isModerated: Bool

    enum CodingKeys: String, CodingKey {
        case id, name
        case isModerated = "is_moderated"
    }
}

// MARK: - WorkExpirience
struct WorkExpirience: Codable {
    let id: Int
    let organization, position: String
    let startDate: Int
    let endDate: Int?
    let untilNow, isModerated: Bool

    enum CodingKeys: String, CodingKey {
        case id, organization, position
        case startDate = "start_date"
        case endDate = "end_date"
        case untilNow = "until_now"
        case isModerated = "is_moderated"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    public var hashValue: Int {
            return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}


extension Responce {
        
    static let mockDoctor: User = .init(
        id: "4b86d20f-aa71-4f10-acee-0f55f0b2c8ca",
        slug: "tsedrik_Andrej_2c8ca",
        firstName: "Айболит",
        patronymic: "Докторович",
        lastName: "Пилюлькин",
        gender: "муж",
        genderLabel: .женщина,
        specialization: [],
        ratings: [],
        ratingsRating: 4.3,
        seniority: 7,
        textChatPrice: 200,
        videoChatPrice: 300,
        homePrice: 400,
        hospitalPrice: 1500,
        avatar: "https://media.istockphoto.com/id/1327024466/photo/portrait-of-male-doctor-in-white-coat-and-stethoscope-standing-in-clinic-hall.jpg?s=1024x1024&w=is&k=20&c=9dGjXLWwRAimcACr0jOZDmmLcH0P29fi2ibKunQ6xpo=",
        nearestReceptionTime: nil,
        freeReceptionTime: [],
        educationTypeLabel: nil,
        higherEducation: [],
        workExpirience: [],
        advancedTraining: [],
        rank: 4,
        rankLabel: "доктор наук",
        scientificDegree: 2,
        scientificDegreeLabel: .докторМедицинскихНаук,
        category: 123,
        categoryLabel: .вторая,
        isFavorite: true
    )
}
