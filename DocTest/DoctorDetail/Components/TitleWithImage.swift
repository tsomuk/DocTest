//
//  TitleWithImage.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 22.03.2024.
//

import SwiftUI

struct TitleWithImage: View {
    let title: String
    let imageName: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 14, height: 14)
            Text(title)
                .font(.system(size: 14))
        }
        .foregroundStyle(.darkGray)
    }
}

#Preview {
    TitleWithImage(title: "Высшая категория", imageName: "cross.case")
}
