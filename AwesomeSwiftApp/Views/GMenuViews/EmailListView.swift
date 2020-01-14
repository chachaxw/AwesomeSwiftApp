//
//  EmailListView.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2020/1/10.
//  Copyright © 2020 Chacha. All rights reserved.
//

import SwiftUI

struct EmailListView: View {

    var emails: [Email]
    var isMenuOpen = false

    @available(iOS 13.0, *)
    private var animation: Animation {
        Animation
            .spring(dampingFraction: 0.65)
            .speed(1.4)
            .delay(0.1)
    }

    private var title: String {
        Data.Constants.menuItems.first {
            $0.isSelected
        }?.title.uppercased() ?? ""
    }

    @available(iOS 13.0.0, *)
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(title)
                    .padding(.top, 20)
                    .padding(.bottom, 6)
                    .padding(.leading, 6)
                    .font(.caption)
                    .foregroundColor(Color("text"))

                ForEach(emails) {
                    EmailView(email: $0)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                        .padding(.horizontal, 16)
                        .contextMenu {
                            Button(action: {}) {
                                Text("Delete")
                                Image(systemName: "trash")
                            }
                            Button(action: {}) {
                                Text("Archive")
                                Image(systemName: "archivebox")
                            }
                        }
                }
                .padding(.top, 16)
            }
            .padding(.top, 7 + (self.isMenuOpen ? 200 : 50))
            .animation(animation)
        }
    }
}

struct EmailListViewPreview: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        EmailListView(emails: .init(
            repeating: Email(
                sender: "Chacha",
                time: "15:59",
                title: "Chacha",
                description: "Get an Chacha Store Gift Card of up to $200 on select products during" +
                    "our four-day shopping event. And more offers now through Monday."
            ),
            count: 20
        ))
    }
}
