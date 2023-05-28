//
//  ContentView.swift
//  7-Watch-Notes Watch App
//
//  Created by solgo on 20/11/2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @AppStorage("lineCount") var lineCount: Int = 1
    
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    // MARK: - FUNCTION
    func getDocumentDir() -> URL {
        let path  = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func saveData() {
//        dump(notes) /// dump the notes to console
        do {
            //1, Convert notes to data using JSONEncoder
            let data = try JSONEncoder().encode(notes)
            
            //2. Get URL to save file with getDocumentDir()
            let url = getDocumentDir().appendingPathComponent("notes")
            
            //3. Write data to given URL
            try data.write(to: url)
        }catch{
            print("Saving data has failed")
        }
    }
    
    
    func loadData() {
        DispatchQueue.main.async {
            do{
                //1. Get URL of saved file with getDocumentDir()
                let url = getDocumentDir().appendingPathComponent("notes")
                
                //2. Create new property for the data
                let data = try Data(contentsOf: url)
                
                //3. Decode the data
                notes = try JSONDecoder().decode([Note].self, from: data)
            }catch{
                print("Filed to load data")
            }
        }
        
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            saveData()
        }
    }
    
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add New Note", text: $text)
                    
                    Button {
                        guard !text.isEmpty else {return}
                        
                        let note = Note(id: UUID(), text: text)
                        notes.append(note)
                        text = ""
                        saveData()
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                    }
                    .fixedSize()
    //                .buttonStyle(BorderedButtonStyle(tint: .accentColor))
                    .buttonStyle(.plain)
                    .foregroundColor(.accentColor)

                }//: HSTACK
                
                if notes.count > 0 {
                    List{
                        ForEach(0..<notes.count, id: \.self) { i in
                            NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
                                HStack{
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(.accentColor)
                                    
                                    Text(notes[i].text)
                                        .lineLimit(lineCount)
                                        .padding(.leading,5)
                                }//: HSTACK
                            }//: NAVIGATION LINK
                            
                        }//: LOOP
                        .onDelete { offset in
                            delete(offsets: offset)
                        }
                        
                    }//: LIST
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .padding(25)
                    Spacer()
                }
               
                
                
                
            }//: VSTACK
            .padding()
            .navigationTitle("Notes")
            
        }.onAppear(){
            loadData()
        }
        
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
