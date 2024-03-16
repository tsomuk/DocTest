//
//  DoctorCardView.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 16.03.2024.
//

import SwiftUI

struct DoctorCardView: View {
    
    
    func getRaiting(raiting: Int) -> String {
        switch raiting {
        case 1:
            return "􀋃"
        case 2:
            return "􀋃􀋃"
        case 3:
            return "􀋃􀋃􀋃"
        case 4:
            return "􀋃􀋃􀋃􀋃"
        case 5:
            return "􀋃􀋃􀋃􀋃􀋃"
        default:
            fatalError("invalid rating")
        }
    }
    
    
    var body: some View {
        
        
        
        ZStack(content: {
            Color.background.edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 225, alignment: .center)
            VStack {
                HStack(alignment: .top) {
                    Image(.mockPhoto)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                    VStack(alignment: .leading) {
                        Text("Фамилия")
                            .font(.system(size: 22, weight: .bold))
                        Text("Имя Отчество")
                            .font(.system(size: 22, weight: .bold))
                        Text("⭐️⭐️⭐️⭐️⭐️")
                        HStack {
                            Text("Педиатор •")
                            Text("Стаж 9 лет")
                        } .foregroundColor(.gray)
                        Text("от 400 ₽")
                            .font(.title2)
                            .bold()
                    }
                    Button("💜") {
                        print("favorite")
                    }
                }
                Button(action: {
                    print("Make an apointment")
                }) {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(.accent))
                        .frame(width: 300, height: 60, alignment: .center)
                        .overlay(
                            Text("Записаться"))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
            }
        })
    }
    
}

struct DoctorCardView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorCardView()
            .previewLayout(.sizeThatFits)
    }
}
