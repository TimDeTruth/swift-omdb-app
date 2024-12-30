//
//  SearchBar.swift
//  OMDBApi
//
//  Created by Timmy Lau on 2024-12-16.
//

import SwiftUI


/// A reusable SearchBar view that accepts user inputs and notifies changes via a callback.
struct SearchBar: View {
    @Binding var text:String
    var placeholder:String
    var onTextChange: (String) -> Void //callback
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .onChange(of: text) { oldValue, newValue in
                onTextChange(newValue)
            }
    }
}

#Preview {
    @Previewable @State var text = "Batman"
    SearchBar(
        text: $text,
        placeholder: "Search for movies...",
        onTextChange: { newValue in
            print("Text changed to: \(newValue)")
        }
    )
}
