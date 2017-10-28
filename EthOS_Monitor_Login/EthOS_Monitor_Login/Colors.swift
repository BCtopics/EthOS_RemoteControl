//
//  Colors.swift
//  Altfolio
//
//  Created by Bradley GIlmore on 6/29/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

extension UIColor {
    
    //FIXME: - Change to actual colors
    
    //MARK: - Colors In Use
    
    // Table View Background
    
    static var backgroundGray: UIColor {
        return UIColor(displayP3Red: 235 / 255.0 , green: 233 / 255.0, blue: 233 / 255.0, alpha: 1.0)
    }
    
    // Total Balance View

    static var gradiantPurple: UIColor {
        return UIColor(displayP3Red: 105 / 255.0, green: 148 / 255.0, blue: 229 / 255.0, alpha: 0.64)
    }

    static var gradiantBlue: UIColor {
        return UIColor(displayP3Red: 108 / 255.0, green: 237 / 255.0, blue: 239 / 255.0, alpha: 1.0)
    }

    // Lines

    static var whiteLineClear: UIColor {
        return UIColor(displayP3Red: 255 / 255.0, green: 255 / 255.0, blue: 255 / 255.0, alpha: 0.0)
    }

    static var whiteLineSemiClear: UIColor {
        return UIColor(displayP3Red: 255 / 255.0, green: 255 / 255.0, blue: 255 / 255.0, alpha: 0.51)
    }

    // Profit / Loss

    static var positiveGreen: UIColor {
        return UIColor(displayP3Red: 0 / 255.0, green: 212 / 255.0, blue: 99 / 255.0, alpha: 1.00)
    }

    static var negativeRed: UIColor {
        return UIColor(displayP3Red: 255 / 255.0, green: 0 / 255.0, blue: 69 / 255.0, alpha: 1.00)
    }

    //MARK: - Old Colors For Past Versions

    static var oldPositiveGreen: UIColor {
        return UIColor(displayP3Red: 110 / 255.0, green: 167 / 255.0, blue: 55 / 255.0, alpha: 1.0)
    }

    static var oldNegativeRed: UIColor {
        return UIColor(displayP3Red: 204 / 255.0, green: 93 / 255.0, blue: 94 / 255.0, alpha: 1.0)
    }

    static var buttonTextOrange: UIColor {
        return UIColor(displayP3Red: 239 / 255.0, green: 173 / 255.0, blue: 78 / 255.0, alpha: 1)
    }

    static var backgroundTintGreen: UIColor {
        return UIColor(displayP3Red: 229 / 255.0, green: 240 / 255.0, blue: 230 / 255.0, alpha: 1)
    }
    
    static var backgroundDarkerGreen: UIColor {
        return UIColor(displayP3Red: 8 / 255.0, green: 89 / 255.0, blue: 95 / 255.0, alpha: 1)
    }

    static var backgroundBlue: UIColor {
        return UIColor(displayP3Red: 11 / 255.0, green: 92 / 255.0, blue: 147 / 255.0, alpha: 1.0)
    }

    static var darkerBlue: UIColor {
        return UIColor(displayP3Red: 31 / 255.0, green: 64 / 255.0, blue: 113 / 255.0, alpha: 1.0)
    }

}

