//
//  TextInputs.swift
//  YoMoola
//
//  Created by Blue Heron on 2/1/23.
//

import SwiftUI

struct TextFieldTheme: ViewModifier {
    let color = UIColor.quaternaryLabel
    let cornerRadius: CGFloat = 7.0
    
    func body(content: Content) -> some View {
        VStack(alignment: .leading) {
            content
                //.autocapitalization(.words)
                .foregroundColor(.text)
                .padding()
                .background(Color(uiColor: color))
                .cornerRadius(cornerRadius)
                .padding(.bottom)
        }
    }
}

struct TextFieldBordered: View {
    var labelText: String
    @Binding var inputString: String
    var body: some View {
        TextField(labelText, text: $inputString)
            .modifier(TextFieldTheme())
    }
}

struct TextFieldSecureBordered: View {
    var labelText: String
    @Binding var inputString: String
    var body: some View {
        SecureField(labelText, text: $inputString)
            .modifier(TextFieldTheme())
    }
}

struct TextInputs_Previews: PreviewProvider {
    @State static var passwordString = "389hiu3h2rhi@FDS"
    @State static var inputString1 = ""
    @State static var inputString2 = "Test string"
    static var previews: some View {
        VStack() {
            TextFieldSecureBordered(labelText: "Label Text", inputString: $passwordString)
            TextFieldBordered(labelText: "Label Text", inputString: $inputString1)
            TextFieldBordered(labelText: "Label Text", inputString: $inputString2)
        }
        .padding()
    }
}
