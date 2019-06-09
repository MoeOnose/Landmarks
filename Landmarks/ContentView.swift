//
//  ContentView.swift
//  Landmarks
//
//  Created by 小野瀬萌 on 2019/06/05.
//  Copyright © 2019 小野瀬萌. All rights reserved.
//

import SwiftUI

//combine compornents
struct ContentView : View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)

            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Turtle Rock")
                        .font(.title)
                    HStack {
                        Text("Joshua Tree National Park.")
                            .font(.subheadline)
                        Spacer()
                        Text("California")
                            .font(.subheadline)
                    }
                }
            }
            .padding()
            Spacer()
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
