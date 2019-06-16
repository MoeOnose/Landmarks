//
//  Badge.swift
//  Landmarks
//
//  Created by 小野瀬萌 on 2019/06/16.
//  Copyright © 2019 小野瀬萌. All rights reserved.
//

import SwiftUI

struct Badge : View {
    var body: some View {
        //バッジのパスをGeometryReaderでラップ。値を親のviewのサイズに応じて可変にする
        //描画する形状(六角形)の2つの寸法のうち最小のものを使用すると、六角形を含むビューが正方形ではない場合にバッジの縦横比が維持される。🤔
        GeometryReader { geometry in
            
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                //以下二つの定数を使用してバッジをそのジオメトリ(描画する形状(六角形))の中心に配置する。
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(to: CGPoint(
                    x: xOffset + width * 0.95,
                    y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                HexagonParameters.points.forEach {
                    path.addLine(
                        to: .init(
                            x: xOffset + width * $0.useWidth.0 * $0.xFactors.0,
                            y: height * $0.useHeight.0 * $0.yFactors.0
                        )
                    )
                    //図形の角をベジェ曲線で描画
                    path.addQuadCurve(
                        to: .init(
                            x: xOffset + width * $0.useWidth.1 * $0.xFactors.1,
                            y: height * $0.useHeight.1 * $0.yFactors.1
                        ),
                        control: .init(
                            x: xOffset + width * $0.useWidth.2 * $0.xFactors.2,
                            y: height * $0.useHeight.2 * $0.yFactors.2
                        )
                    )
                }
            }
                //背景色 グラデーション(単純にColor指定すれば単色になる)
            .fill(LinearGradient(
                gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: .init(x: 0.5, y: 0),
                endPoint: .init(x: 0.5, y: 0.6)
            ))
                //縦横比を1:1に保つ。祖先のviewの比率が異なっても維持できるようになる
            .aspectRatio(1, contentMode: .fit)
        }
    }
    static let gradientStart = Color(red: 239.0/255, green: 120.0/255, blue: 221.0/255)
    static let gradientEnd = Color(red: 239.0/255, green: 172.0/255, blue: 120.0/255)
}

#if DEBUG
struct Badge_Previews : PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
#endif
