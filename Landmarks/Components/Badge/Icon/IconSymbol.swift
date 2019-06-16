//
//  IconSymbol.swift
//  Landmarks
//
//  Created by 小野瀬萌 on 2019/06/16.
//  Copyright © 2019 小野瀬萌. All rights reserved.
//

import SwiftUI
//山の形を作る
struct IconSymbol : View {
    static let symbolColor = Color(red: 79.0/255, green: 79.0/255, blue: 191.0/255)
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.030 //外枠と図形の間のmarginみたいなもん
                let middle = width / 2
                let topWidth = 0.226 * width
                let topHeight = 0.488 * height
                //山のtop部分
                path.addLines([
                    //スタート
                    CGPoint(x: middle, y: spacing),
                    //左下のポイント
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    //真ん中下のポイント
                    CGPoint(x: middle, y: topHeight / 2 + spacing),
                    //右下のポイント
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    //ゴール
                    CGPoint(x: middle, y: spacing)
                ])
                //🤔ここ何してる
                path.move(to: CGPoint(x:middle, y: topHeight/2 + spacing * 3))
                //山のbottom部分
                path.addLines([
                    //左上のポイント　top部分の左下に合わせる(双方からspacingを入れることでsmall gapを産んでいる)
                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
                    //左下のポイント 親のフレームからspacing分の余白をとった位置から
                    CGPoint(x: spacing, y: height - spacing),
                    //右下のポイント 左と同様にspacingの余白を取りたいので引いてる
                    CGPoint(x: width - spacing, y: height - spacing),
                    //右上のポイント
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    //真ん中のポイント topのgap側のポイントはspacingを引いてるが、真ん中だけは要素を広く取るために足している そのため (足している分 + 本来引く分　 + bottom側の分で　spacing * 3)
                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                ])
                
            }
            .fill(Self.symbolColor)
    }
    }
}

#if DEBUG
struct IconSymbol_Previews : PreviewProvider {
    static var previews: some View {
        IconSymbol()
    }
}
#endif
