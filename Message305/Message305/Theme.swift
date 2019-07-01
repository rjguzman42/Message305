//
//  Theme+Message305.swift
//  Message305
//
//  Created by Roberto Guzman on 7/1/19.
//  Copyright © 2019 Fortytwo Sports. All rights reserved.
//

import Foundation
import UIKit

struct Theme {
    
    
    enum Colors {
        //company colors
        case topaz
        case pictionBlue
        case red
        case gold
        case green
        case gunmetal
        case gunmetalLight
        case lightGray
        case titleGray
        case darkGray
        
        //iOS only colors
        case backgroundWhite
        case backgroundBlack
        case backgroundGray
        
        var color: UIColor {
            switch self {
            case .topaz: return UIColor(red: 26/255, green: 186/255, blue: 177/255, alpha: 1.0)
            case .pictionBlue: return UIColor(red: 93/255, green: 168/255, blue: 203/255, alpha: 1.0)
            case .red: return UIColor(red: 205/255, green: 117/255, blue: 100/255, alpha: 1.0)
            case .gold: return UIColor(red: 231/255, green: 170/255, blue: 95/255, alpha: 1.0)
            case .green: return UIColor(red: 151/255, green: 185/255, blue: 109/255, alpha: 1.0)
            case .gunmetal: return UIColor(red: 72/255, green: 87/255, blue: 94/255, alpha: 1.0)
            case .gunmetalLight: return UIColor(red: 0.45, green: 0.52, blue: 0.53, alpha: 1.0)
            case .lightGray: return UIColor(red: 246/255, green: 249/255, blue: 250/255, alpha: 1.0)
            case .titleGray: return UIColor(red: 237/255, green: 243/255, blue: 244/255, alpha: 1.0)
            case .darkGray: return UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1.0)
                
            case .backgroundWhite: return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
            case .backgroundBlack: return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
            case .backgroundGray: return UIColor(red: 237/255, green: 243/255, blue: 244/255, alpha: 1.0)
            }
        }
    }
    
    enum Fonts {
        case regular
        case regularSmall
        case regularSemiLarge
        case regularLarge
        case medium
        case mediumSmall
        case mediumSemiLarge
        case mediumLarge
        case semiBold
        case semiBoldSmall
        case semiBoldSemiLarge
        case semiBoldLarge
        case bold
        case boldSmall
        case boldSemiLarge
        case boldLarge
        
        var font: UIFont {
            switch self {
            case .regular: return monsterrat
            case .regularSmall: return monsterrat
            case .regularSemiLarge: return monsterrat
            case .regularLarge: return monsterrat
            case .medium: return monsterrat
            case .mediumSmall: return monsterrat
            case .mediumSemiLarge: return monsterrat
            case .mediumLarge: return monsterrat
            case .semiBold: return monsterrat
            case .semiBoldSmall: return monsterrat
            case .semiBoldSemiLarge: return monsterrat
            case .semiBoldLarge: return monsterrat
            case .bold: return monsterrat
            case .boldSmall: return monsterrat
            case .boldSemiLarge: return monsterrat
            case .boldLarge: return monsterrat
            }
        }
        
        var monsterrat: UIFont {
            switch self {
            case .regular: return UIFont(name: "Montserrat-Regular", size: 16)!
            case .regularSmall: return UIFont(name: "Montserrat-Regular", size: 12)!
            case .regularSemiLarge: return UIFont(name: "Montserrat-Regular", size: 18)!
            case .regularLarge: return UIFont(name: "Montserrat-Regular", size: 20)!
            case .medium: return UIFont(name: "Montserrat-Medium", size: 16)!
            case .mediumSmall: return UIFont(name: "Montserrat-Medium", size: 12)!
            case .mediumSemiLarge: return UIFont(name: "Montserrat-Medium", size: 18)!
            case .mediumLarge: return UIFont(name: "Montserrat-Medium", size: 20)!
            case .semiBold: return UIFont(name: "Montserrat-SemiBold", size: 16)!
            case .semiBoldSmall: return UIFont(name: "Montserrat-SemiBold", size: 12)!
            case .semiBoldSemiLarge: return UIFont(name: "Montserrat-SemiBold", size: 18)!
            case .semiBoldLarge: return UIFont(name: "Montserrat-SemiBold", size: 20)!
            case .bold: return UIFont(name: "Montserrat-Bold", size: 16)!
            case .boldSmall: return UIFont(name: "Montserrat-Bold", size: 12)!
            case .boldSemiLarge: return UIFont(name: "Montserrat-Bold", size: 18)!
            case .boldLarge: return UIFont(name: "Montserrat-Bold", size: 20)!
            }
        }
        
        var hind: UIFont {
            switch self {
            case .regular: return UIFont(name: "Hind-Regular", size: 16)!
            case .regularSmall: return UIFont(name: "Hind-Regular", size: 12)!
            case .regularSemiLarge: return UIFont(name: "Hind-Regular", size: 18)!
            case .regularLarge: return UIFont(name: "Hind-Regular", size: 20)!
            case .medium: return UIFont(name: "Hind-Medium", size: 16)!
            case .mediumSmall: return UIFont(name: "Hind-Medium", size: 12)!
            case .mediumSemiLarge: return UIFont(name: "Hind-Medium", size: 18)!
            case .mediumLarge: return UIFont(name: "Hind-Medium", size: 20)!
            case .semiBold: return UIFont(name: "Hind-SemiBold", size: 16)!
            case .semiBoldSmall: return UIFont(name: "Hind-SemiBold", size: 12)!
            case .semiBoldSemiLarge: return UIFont(name: "Hind-SemiBold", size: 18)!
            case .semiBoldLarge: return UIFont(name: "Hind-SemiBold", size: 20)!
            case .bold: return UIFont(name: "Hind-Bold", size: 16)!
            case .boldSmall: return UIFont(name: "Hind-Bold", size: 12)!
            case .boldSemiLarge: return UIFont(name: "Hind-Bold", size: 18)!
            case .boldLarge: return UIFont(name: "Hind-Bold", size: 20)!
            }
        }
        
        var nunito: UIFont {
            switch self {
            case .regular: return UIFont(name: "Hind-Regular", size: 16)!
            case .regularSmall: return UIFont(name: "Hind-Regular", size: 12)!
            case .regularSemiLarge: return UIFont(name: "Hind-Regular", size: 18)!
            case .regularLarge: return UIFont(name: "Hind-Regular", size: 20)!
            case .medium: return UIFont(name: "Hind-Medium", size: 16)!
            case .mediumSmall: return UIFont(name: "Hind-Medium", size: 12)!
            case .mediumSemiLarge: return UIFont(name: "Hind-Medium", size: 18)!
            case .mediumLarge: return UIFont(name: "Hind-Medium", size: 20)!
            case .semiBold: return UIFont(name: "Hind-SemiBold", size: 16)!
            case .semiBoldSmall: return UIFont(name: "Hind-SemiBold", size: 12)!
            case .semiBoldSemiLarge: return UIFont(name: "Hind-SemiBold", size: 18)!
            case .semiBoldLarge: return UIFont(name: "Hind-SemiBold", size: 20)!
            case .bold: return UIFont(name: "Hind-Bold", size: 16)!
            case .boldSmall: return UIFont(name: "Hind-Bold", size: 12)!
            case .boldSemiLarge: return UIFont(name: "Hind-Bold", size: 18)!
            case .boldLarge: return UIFont(name: "Hind-Bold", size: 20)!
            }
        }
    }
    
}
