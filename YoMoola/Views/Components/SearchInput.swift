//
//  SearchInput.swift
//  YoMoola
//
//  Created by Blue Heron on 2/8/23.
//

import SwiftUI

struct SearchInput: View {
    @Binding var searchString: String
    var labelText: String
    var body: some View {
        HStack {
            Text(Image(systemName: "magnifyingglass"))
                .font(.title3)
                .foregroundColor(.accentColor)
            TextField(labelText, text: $searchString)
        }
    }
}

struct SearchInput_Previews: PreviewProvider {
    @State static var searchString = ""
    static var previews: some View {
        SearchInput(searchString: $searchString, labelText: "label")
    }
}
