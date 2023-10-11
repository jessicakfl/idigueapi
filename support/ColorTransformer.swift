//
//  ColorTransformer.swift
//  IdigueApi
//
//  Created by jessica bai on 10/10/23.
//

import UIKit

class ColorTransformer: NSSecureUnarchiveFromDataTransformer {
    override static var allowedTopLevelClasses: [AnyClass] {
        [UIColor.self]
    }

    static func register() {
        let className = String(describing: ColorTransformer.self)
        let name = NSValueTransformerName(className)

        let transformer = ColorTransformer()
        ValueTransformer.setValueTransformer(
            transformer, forName: name)
    }
}
