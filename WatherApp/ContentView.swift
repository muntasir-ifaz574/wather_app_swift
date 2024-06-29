//
//  ContentView.swift
//  WatherApp
//
//  Created by Muntasir Efaz on 6/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    private var wicklyWather: [WatherPotcust] = [
        WatherPotcust(weekDayName: "SUN", imageName: "cloud.sun.fill", tempNum: 29),
        WatherPotcust(weekDayName: "MON", imageName: "cloud.sun.rain.fill", tempNum: 30),
        WatherPotcust(weekDayName: "TUE", imageName: "cloud.sun.bolt.fill", tempNum: 27),
        WatherPotcust(weekDayName: "WED", imageName: "sun.rain.fill", tempNum: 31),
        WatherPotcust(weekDayName: "THU", imageName: "sun.max.fill", tempNum: 33),
    ]
    var body: some View {
        ZStack{
            BackgroudView(
                isNight: isNight
            )
            
            VStack(spacing: 8){
                
                CityNameView(cityName: "Dhaka, BD")
               
                MainWatherTempView(
                    watherIcon: isNight ? "cloud.moon.fill" : "cloud.sun.rain.fill",tempNum: 29)
               
                HStack(spacing: 20){
                    ForEach(wicklyWather){ WatherPotcust in
                        WatherHorizantalView(
                         wather: WatherPotcust
                        )
                    }
                   
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    ButtonView(
                        buttonTitle: "Change Day Time",
                        backgroudColor: .white,
                        textColor: .blue
                    )
                        
                }
                
                Spacer()
            }
            
        }
    }
}

#Preview {
    ContentView()
}

struct WatherPotcust:Identifiable{
    let id = UUID()
    var weekDayName: String
    var imageName: String
    var tempNum: Int
    
}

struct WatherHorizantalView: View {
    var wather: WatherPotcust
    var body: some View {
        VStack{
            Text(wather.weekDayName)
                .font(.system(size: 16,weight: .medium,design: .default))
                .foregroundColor(.white)
            Image(systemName: wather.imageName)
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(.white, .yellow, .blue)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40cd)
            Text("\(wather.tempNum)°")
                .font(.system(size: 28,weight: .medium,design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroudView: View {
    var isNight: Bool
    
    var body: some View {
        LinearGradient(
            colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ).ignoresSafeArea(.all)
    }
}

struct CityNameView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32,weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWatherTempView: View {
    var watherIcon: String
    var tempNum: Int
    var body: some View {
        VStack{
            Image(systemName: watherIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            Text("\(tempNum)°")
                .font(.system(size: 70,weight: .medium))
                .foregroundStyle(.white)
            
        }
        .padding(.bottom, 40)
    }
}



