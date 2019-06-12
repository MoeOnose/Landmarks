//
//  UserData.swift
//  Landmarks
//
//  Created by 小野瀬萌 on 2019/06/13.
//  Copyright © 2019 小野瀬萌. All rights reserved.
//

import SwiftUI
import Combine //まってた〜〜！

//Rxのプロパティ作ってる感覚に似てる
//BindableObjectはclassで定義する必要あり
final class UserData: BindableObject {
    // 🤔publisher Moyaでも出て来たな
    //Combineのプロパティ 値を購読して返す
    let didChange = PassthroughSubject<UserData, Never>()
    
    //初期値
    var showFaviritesOnly: Bool = false {
        didSet {
            didChange.send(self)
        }
    }
    var landmarks: [Landmark] = landmarkData {
        didSet {
            didChange.send(self)
        }
    }
    
    
    
}
