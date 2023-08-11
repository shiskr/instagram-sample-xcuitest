//
//  ApplicationStyle.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 31.07.2023.
//

import Foundation
import SwiftUI

public class ApplicationStyle {
    public struct colors {
        public enum shade {
            case shade75
            case shade62
            case shade38
            case shade24
            case shade15
            case shade9

            func alpha() -> CGFloat {
                switch self {
                    case .shade75: return 0.75
                    case .shade62: return 0.62
                    case .shade38: return 0.38
                    case .shade24: return 0.24
                    case .shade15: return 0.15
                    case .shade9: return 0.09
                }
            }
        }
        
        public static func transparent() -> Color { Color.clear }
        public static func white() -> Color { Color(hex: 0xFFFFFF) }
        public static func black() -> Color { Color(hex: 0x000000) }
        public static func blue() -> Color { Color(hex: 0x0095F6) }
        public static func gray() -> Color { Color(hex: 0x737373) }
        public static func lightGray() -> Color { Color(hex: 0xFAFAFA) }
        public static func red() -> Color { Color(.systemRed) }
        
        public static func lightBlue(shade: shade) -> Color {
            switch shade {
                case .shade38: return Color(hex: 0xBCCEFB)
                case .shade24: return Color(hex: 0xC4D9FF)
                case .shade15: return Color(hex: 0xDEE9FF)
                case .shade9: return Color(hex: 0xE9F1FF)
                default: return self.transparent()
            }
        }
    }
    
    public struct fonts {
        public static func regular(size: CGFloat) -> Font {
            return Font.system(size: size)
        }

        public static func bold(size: CGFloat) -> Font {
            return Font.system(size: size).bold()
        }

        public static func italic(size: CGFloat) -> Font {
            return Font.system(size: size).italic()
        }
    }
    
    struct images {
        struct names {
            static func instagram() -> String { "instagram_logo_image"}
        }
    }
}
