//
//  DetailView.swift
//  7-Watch-Notes Watch App
//
//  Created by solgo on 20/11/2022.
//

import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTIES
    let note : Note
    let count : Int  //total number of notes array
    let index : Int //current note's index
    
    @State private var isCreditPresented: Bool = false
    @State private var isSettingPresented: Bool = false
    
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            //HEADER
            HeaderView()
            
            
            //CONTENT
            Spacer()
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }//: SCROLL
            Spacer()
            
            //FOOTER
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingPresented) {
                        SettingView()
                    }
                    
                
                Spacer()
                
                Text("\(count) / \(index + 1)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditPresented) {
                        CreditView()
                    }
            }//: HSTACK
            .foregroundColor(.secondary)
            
            
        }//: VSTACK
        .padding()
    }
}


// MARK: - PREVIEW
struct DetailView_Previews: PreviewProvider {
    static var sampleData: Note = Note(id: UUID(), text: "hello world very long text asj haskdhakd ahkd ahksd askdha kashdaskd askjahs adkjsh ksdhask dadhkj ashkjda sk")
    
    static var previews: some View {
        DetailView(note: sampleData, count: 1, index: 0)
    }
}
