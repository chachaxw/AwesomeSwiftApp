//
//  ContentView.swift
//  
//
//  Created by chacha on 2020/1/14.
//

import SwiftUI

@available(iOS 13.0, *)
struct ContentView: View {

    var emails: [Email]
    var menuItems: [MenuItem]
    
    @State private var isMenuOpen = false
    
    @available(iOS 13.0, *)
    var body: some View {
        ZStack(alignment: .top) {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            EmailListView(emails: emails, isMenuOpen: isMenuOpen)
                .blur(radius: isMenuOpen ? 1 : 0)
            
            Color(UIColor.black.withAlphaComponent(isMenuOpen ? 0.32 : 0))
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    self.toggleMenu()
            }
            
            MenuBarView(isOpen: isMenuOpen, menuItems: menuItems, onToggle: {
                self.toggleMenu()
            }) {
                
            }
        }
    }
    
    private func toggleMenu() {
        withAnimation {
            self.isMenuOpen.toggle()
        }
    }
}

@available(iOS 13.0.0, *)
struct ContentViewPreview: PreviewProvider {
    static var previews: some View {
        
    }
}
