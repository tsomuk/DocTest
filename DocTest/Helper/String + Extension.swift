//
//  String + Extension.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 22.03.2024.
//

import Foundation

extension String {
    var capitalizedSentence: String {
        
        let firstLetter = self.prefix(1).capitalized
        
        let remainingLetters = self.dropFirst().lowercased()
        
        return firstLetter + remainingLetters
    }
}
