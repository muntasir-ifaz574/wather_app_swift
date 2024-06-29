//
//  WatherButton.swift
//  WatherApp
//
//  Created by Muntasir Efaz on 6/30/24.
//

import SwiftUI

struct ButtonView: View {
    var buttonTitle: String
    var backgroudColor: Color
    var textColor: Color
    var body: some View {
        Text(buttonTitle)
            .frame(width: 280,height: 50)
            .background(backgroudColor.gradient)
            .font(.system(size: 20,weight: .bold,design: .default))
            .foregroundColor(textColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ButtonView(buttonTitle: "Test button", backgroudColor: .blue, textColor: .white)
}

