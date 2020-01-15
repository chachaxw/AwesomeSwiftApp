//
//  MenuItemView.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/1/14.
//  Copyright © 2020 Chacha. All rights reserved.
//

import SwiftUI

struct MenuItemView: View {

    var index: Int
    var item: MenuItem
    var isExpanded: Bool = true
    var width: CGFloat
    var height: CGFloat
    var onTap: (() -> Void)?

    @available(iOS 13.0, *)
    private var animationIn: Animation {
        Animation
            .spring(dampingFraction: 0.6)
            .speed(1.5)
            .delay(0.02 * Double(index))
    }

    @available(iOS 13.0, *)
    private var animationOut: Animation {
        Animation.spring().speed(1.9)
    }

    private var showSelected: Bool {
        item.isSelected && isExpanded
    }

    @available(iOS 13.0, *)
    private var backgroundColor: Color {
        return isExpanded ? (showSelected ? Color("menuTextSelectedBackground") : Color.clear) : Color("menuDots")
    }

    @available(iOS 13.0.0, *)
    var body: some View {
        VStack {
            Image(showSelected ? item.selectedImageName : item.imageName)
            Text(item.title)
                .font(.menu)
                .foregroundColor(showSelected ? Color("menuTextSelected") : Color("menuText"))
                .opacity(isExpanded ? 1 : 0)
                .frame(width: width)
        }
        .scaleEffect(x: isExpanded ? 1 : 0, y: isExpanded ? 1 : 0)
        .frame(width: isExpanded ? width : 5, height: isExpanded ? height : 5)
        .background(backgroundColor)
        .cornerRadius(isExpanded ? 10 : 1)
        .animation(isExpanded ? animationIn : animationOut)
        .onTapGesture {
            self.onTap?()
        }
    }
}

@available(iOS 13.0, *)
private extension Font {
    static var menu: Font {
        return system(size: 15, weight: .semibold, design: .default)
    }
}

struct MenuItemViewPreview: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        MenuItemView(
            index: 0,
            item: DefaultMenuItem(title: "Inbox", imageName: "inboxIcon", selectedImageName: "inboxIconRed"),
            width: 90,
            height: 70
        )
    }
}
