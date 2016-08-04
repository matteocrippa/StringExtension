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
        
        return !self.isEmpty && self.rangeOfCharacterFromSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet) == nil
    }
    
    // MARK: - Email validation
    var isEmail: Bool {
        
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}", options: .CaseInsensitive)
            return regex.firstMatchInString(self, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
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
        return self.substringWithRange(self.startIndex..<self.startIndex.advancedBy(i + 1))
    }
    
    subscript (r: Range<Int>) -> String {
        get {
            return self.substringWithRange(self.startIndex.advancedBy(r.startIndex)..<self.startIndex.advancedBy(r.endIndex))
        }
    }
    
    var monogram: String {
        
        var monogram = ""
        let words = self.componentsSeparatedByString(" ")
        
        if words.count > 0 {
            monogram = words[0][0]
        }
        if words.count > 1 {
            monogram = "\(monogram)\(words[words.count-1][0])"
        }
        return monogram.uppercaseString
    }
}
