//
//  DoctorCardView.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 16.03.2024.
//

import SwiftUI

struct DoctorCardView: View {
    let surname: String
    let name: String
    let patronymic: String
    let speciality: String
    let expYears: Int
    let price: Int
    let rating: Int
    @State var isFavorite = false
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 225)
            VStack(spacing: 8) {
                HStack(alignment: .top) {
                    Image(.mockPhoto)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("\(surname)\n\(name) \(patronymic)")
                            .font(.system(size: 16, weight: .semibold))
                            .lineLimit(3)
                        
                        RatingView(rating: rating)
                        
                        HStack {
                            Text(speciality + " •")
                            Text("Стаж \(expYears) лет")
                        } .foregroundColor(.gray)
                            .font(.system(size: 14))
                        
                        Text("от \(price) ₽")
                            .font(.system(size: 16, weight: .semibold))
                            
                    }
                    Spacer()
                    Button(action: {
                        isFavorite.toggle()
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .aspectRatio(contentMode: .fit)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.accent)
                            
                    }
                } .padding(.horizontal, 32)
                
                NavigationLink(destination: DoctorDetailView().toolbarRole(.editor)) {
                    DefaultButtonView(buttonTitle: "Записаться")
                        
                }
            }
        }
    }
}

struct DoctorCardView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorCardView(
            surname: "Иванова",
            name: "Марина",
            patronymic: "Викторовна",
            speciality: "Педиатр",
            expYears: 7,
            price: 450,
            rating: 5
        )
        .previewLayout(.sizeThatFits)
    }
}


