//
//  DoctorCardView.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 16.03.2024.
//

import SwiftUI

struct DoctorCardView: View {
    
    @State var doctor: User
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
                        Text("\(doctor.lastName)\n\(doctor.firstName) \(doctor.patronymic)")
                            .font(.system(size: 16, weight: .semibold))
                            .lineLimit(3)
                        
                        RatingView(rating: doctor.rank)
                        
                        HStack {
                            Text("Педиатр" + " •")
                            Text("Стаж \(doctor.seniority) лет")
                        } .foregroundColor(.gray)
                            .font(.system(size: 14))
                        
                        Text("от \(doctor.videoChatPrice) ₽")
                            .font(.system(size: 16, weight: .semibold))
                            
                    }
                    Spacer()
                    Button(action: {
                        isFavorite.toggle()
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 24, height: 20)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.accent)
                            
                    }
                } .padding(.horizontal, 32)
                
                NavigationLink(destination: DoctorDetailView().toolbarRole(.editor)) {
                    DefaultButtonView(buttonTitle: "Записаться", extraPadding: 32)
                             
                }
            }
        }
    }
}

//struct DoctorCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        DoctorCardView(doctor)
//
//        .previewLayout(.sizeThatFits)
//    }
//}


