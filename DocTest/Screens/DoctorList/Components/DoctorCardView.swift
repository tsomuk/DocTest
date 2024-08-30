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
    
    let backgroundGradient = LinearGradient(
        colors: [Color.red, Color.blue],
        startPoint: .top, endPoint: .bottom)
    
    
    
    
    var body: some View {
        
            VStack(spacing: 8) {
                HStack(alignment: .top) {
                    AsyncImage(url: URL(string: doctor.avatar ?? "")) { phase in
                        switch phase {
                        case .empty:
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundStyle(.accent)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .cornerRadius(25)
                         default:
                            EmptyView()
                        }
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        Text("\(doctor.lastName)\n\(doctor.firstName) \(doctor.patronymic)")
                            .font(.system(size: 16, weight: .semibold))
                            .lineLimit(3)
                        
                        RatingView(rating: doctor.rank)
                        
                        HStack {
                            Text("Педиатр" + " •")
                            Text(doctor.seniority.getYearsStringCard())
                        } .foregroundColor(.gray)
                            .font(.system(size: 14))
                        
                        Text("от \(findMinimumPrice() ?? 0) ₽")
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
                
                NavigationLink(destination: DoctorDetailView(doctor: doctor).toolbarRole(.editor))
                {
                    DefaultButtonView(buttonTitle: "Записаться", extraPadding: 32)
                }

            } 
            .frame(maxWidth: .infinity)
            .frame(height: 225)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, 16)
            .shadow(radius: 40)
    }
       
    
    func findMinimumPrice() -> Int? {
        [doctor.hospitalPrice, doctor.textChatPrice, doctor.videoChatPrice].min()
    }
    
}

#Preview {
    DoctorCardView(doctor: DoctorMock.mrKim)
}
