//
//  TextInputs.swift
//  YoMoola
//
//  Created by Blue Heron on 2/1/23.
//

import SwiftUI

struct TextFieldBordered: View {
    var labelText: String
    @Binding var inputString: String
    var body: some View {
        VStack(alignment: .leading) {
            TextField(labelText, text: $inputString)
                .autocapitalization(.words)
                .padding()
                .background(Color(uiColor: UIColor.tertiaryLabel))
                .cornerRadius(5.0)
                .padding(.bottom)
        }
    }
}

struct TextInputs_Previews: PreviewProvider {
    @State static var inputString1 = ""
    @State static var inputString2 = "Test String"
    static var previews: some View {
//        TextFieldBordered(labelText: "Label Text", inputString: $inputString1)
        TextFieldBordered(labelText: "Label Text", inputString: $inputString2)
    }
}
