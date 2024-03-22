//
//  String + Extension.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 22.03.2024.
//

import Foundation


extension Int {
    func getYearsStringCard() -> String {
        var yearsString: String!
        if self == 0 {
            return "Нет стажа"
        }
        if "1".contains("\(self % 10)") {
            yearsString = "год"
        }
        if "234".contains("\(self % 10)") {
            yearsString = "года"
        }
        if "567890".contains("\(self % 10)") {
            yearsString = "лет"
        }
        if 11...14 ~= self % 100 {
            yearsString = "лет"
        }
        return "Стаж \(self) " + yearsString
    }
}

extension Int {
    func getYearsStringDetail() -> String {
        var yearsString: String!
        if self == 0 {
            return "Нет опыта работы"
        }
        if "1".contains("\(self % 10)") {
            yearsString = "год"
        }
        if "234".contains("\(self % 10)") {
            yearsString = "года"
        }
        if "567890".contains("\(self % 10)") {
            yearsString = "лет"
        }
        if 11...14 ~= self % 100 {
            yearsString = "лет"
        }
        return "Опыт работы: \(self) " + yearsString
    }
}

