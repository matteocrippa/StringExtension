//
//  StringExtension.swift
//  boostco.de
//
//  Created by Matteo Crippa on 03/08/2016.
//  Copyright © 2016 boostco.de. All rights reserved.
//

public extension String {
    
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
    
    // MARK: - Mnogram generator
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
}
