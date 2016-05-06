//
//  Reusable+Eye.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/25.
//  Copyright © 2016年 方健. All rights reserved.
//

import Foundation
import UIKit

public protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier : String {
        return String(Self)
    }
}

public extension UICollectionView {
    func registerClass<T : UICollectionView where T : Reusable>(cellClass : T.Type) {
        self.registerClass(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
}