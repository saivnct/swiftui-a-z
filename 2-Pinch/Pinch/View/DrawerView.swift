//
//  DrawerView.swift
//  Pinch
//
//  Created by giangbb on 07/11/2022.
//

import SwiftUI

struct DrawerView: View {
    @State private var isIconCollapsed: Bool = true
    let pages: [Page]
    
    var onSelectedItem: ((_ id: Int) -> Void)?
    
    var body: some View {
        HStack(spacing: 12) {
            // MARK: -  DRAWER HANDLE
            Image(systemName: isIconCollapsed ? "chevron.compact.left" : "chevron.compact.right")
                .resizable()
                .scaledToFit()
                .frame(height: 40)
                .padding(8)
                .foregroundStyle(.secondary)
                .onTapGesture { _ in
                    withAnimation(.easeOut(duration: 0.5)){
                        isIconCollapsed.toggle()
                    }
                }
            
            // MARK: -  THUMBNAILS
            ForEach(pages) { page in
                Image(page.thumbnailName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                    .opacity(isIconCollapsed ? 0 : 1)
                    .animation(.easeOut(duration: 0.5), value: isIconCollapsed)
                    .onTapGesture {
                        if let onSelectedItem = onSelectedItem {
                            onSelectedItem(page.id)
                        }
                    }
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
        .background(.ultraThinMaterial)
        .cornerRadius(12)
        .frame(width: UIScreen.main.bounds.width)
        .offset(x: isIconCollapsed ? UIScreen.main.bounds.width - 45 : UIScreen.main.bounds.width - 245)
    }
}

struct DrawerView_Previews: PreviewProvider {
    static var previews: some View {
        DrawerView(pages: pagesData)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
