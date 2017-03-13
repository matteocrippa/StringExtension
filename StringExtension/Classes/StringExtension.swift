//
//  StringExtension.swift
//  boostco.de
//
//  Created by Matteo Crippa on 03/08/2016.
//  Copyright © 2016 boostco.de. All rights reserved.
//

public extension String {
    
    // MARK: - Localization
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    func localize(with params: CVarArg...) -> String {        
        return String(format: self.localized, params)
    }
    
    // MARK: - Numeric
    var isNumeric: Bool {
        
        return !self.isEmpty && self.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    // MARK: - Email validation
    var isEmail: Bool {
        
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        } catch {
            return false
        }
    }
    
    // MARK: - Generate omiss string
    var omiss: String {
        
        if self.characters.count == 0 {
            return "--"
        } else {
            return self
        }
    }
    
    // MARK: - Monogram generator
    subscript (i: Int) -> String {
        return self.substring(with: self.startIndex..<self.characters.index(self.startIndex, offsetBy: i + 1))
    }
    
    subscript (r: Range<Int>) -> String {
        get {
            return self.substring(with: self.characters.index(self.startIndex, offsetBy: r.lowerBound)..<self.characters.index(self.startIndex, offsetBy: r.upperBound))
        }
    }
    
    var monogram: String {
        
        var monogram = ""
        let words = self.components(separatedBy: " ")
        
        if words.count > 0 {
            monogram = words[0][0]
        }
        if words.count > 1 {
            monogram = "\(monogram)\(words[words.count-1][0])"
        }
        return monogram.uppercased()
    }
    
    
    // MARKL - Html 2 string
    var html2AttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    // MARK: - UIColor
    var uiColor: UIColor? {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 1.0

        if self.hasPrefix("#") {
            let index   = self.characters.index(self.startIndex, offsetBy: 1)
            let hex     = self.substring(from: index)
            let scanner = Scanner(string: hex)
            var hexValue: CUnsignedLongLong = 0
            if scanner.scanHexInt64(&hexValue) {
                switch (hex.characters.count) {
                case 3:
                    red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                    green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                    blue  = CGFloat(hexValue & 0x00F)              / 15.0
                case 4:
                    red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                    green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                    blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                    alpha = CGFloat(hexValue & 0x000F)             / 15.0
                case 6:
                    red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                    blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
                case 8:
                    red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                    green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                    blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                    alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
                default:
                    return nil
                }
            } else {
                return nil
            }
        } else {
            return nil
        }
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

}
