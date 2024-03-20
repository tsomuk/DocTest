//
//  RatingView.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 18.03.2024.
//

import SwiftUI

struct RatingView: View {
    
    var rating: Int
    
    var body: some View {
        HStack(spacing: 2) {
            if rating > 0 {
                ForEach(1...rating, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.accentColor)
                }
            }
            if rating != 5 {
                ForEach(1...(5 - rating), id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.gray)
                }
            }
            
        }
        .font(.system(size: 14))
    }
}

#Preview {
    RatingView(rating: 3)
}
