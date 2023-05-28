//
//  NewTaskItemView.swift
//  6-Devote
//
//  Created by giangbb on 16/11/2022.
//

import SwiftUI

struct NewTaskItemView: View {
    // MARK: -  PROPERTIES
    @Environment(\.managedObjectContext) private var viewContext
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @State var task: String = ""
    
    @Binding var isShowing: Bool
    
    
    
    // MARK: -  FUNCTIONS
    private func addItem() {
        withAnimation {
            guard !task.isEmpty else {return}
            
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            task = ""
            hideKeyBoard()
            isShowing = false
        }
    }
    
    // MARK: -  BODY
    var body: some View {
        VStack{
            Spacer()
            
            VStack(spacing: 16) {
                TextField("New Task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(
                        isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                    )
                    .cornerRadius(10)
            
                Button {
                    addItem()
                    playSound(sound: "sound-ding", type: "mp3")
                    feedBack.notificationOccurred(.success)
                } label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                }
                .disabled(task.isEmpty)
                .onTapGesture {
                    if task.isEmpty {
                        playSound(sound: "sound-tap", type: "mp3")
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(task.isEmpty ? .blue : .pink)
                .cornerRadius(10)
                

            }//: VSTACK
            .padding(.horizontal)
            .padding(.vertical,30)
            .background(
                isDarkMode ? Color(UIColor.secondarySystemBackground) : Color.white
            )
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)
        }//: VSTACK
        .padding()
    }
}

// MARK: -  PREVIEW
struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
