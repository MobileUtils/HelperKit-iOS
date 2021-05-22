//
//  String.swift
//  IOSHelperKit
//
//  Created by Basheer Ahamed.S on 22/05/21.
//

import Foundation
import UIKit

public extension String {
    
    func toInt() -> Int {
        return Int(self) ?? .defaultValue
    }
    
    func toDouble() -> Double {
        return Double(self) ?? .defaultValue
    }
    
    var isNotEmpty: Bool {
        !isEmpty
    }
    
    var capitalizeFirstLetter: String {
        return prefix(1).capitalized + dropFirst()
    }
    
    var updateAsAttributedString: NSAttributedString {
        return NSAttributedString(string: self)
    }
    
    var updateAsMutableAttributedString: NSMutableAttributedString {
        return NSMutableAttributedString(attributedString: self.updateAsAttributedString)
    }
    
    func getImageViewInitialLetter() -> String {
        if self.isEmpty{ return "" }
        
        let string = self.trimSpecialCharacters().trimmingCharacters(in: .whitespacesAndNewlines)
        
        let rawValue = string.components(separatedBy: " ")
        
        var result = rawValue[0].prefix(2) as NSString
        if rawValue.count > 1 {
            result = "\(rawValue.first.safelyUnwrap.prefix(1))\(rawValue.last.safelyUnwrap.prefix(1))" as NSString
        }
        return result.uppercased
    }
    
    private func trimSpecialCharacters() -> String {
        
        let characterSet = CharacterSet(charactersIn: "\\\"()'|<>.+/")// You can give your unwanted specialCharacters here.
        let withoutSpecialChars = self.components(separatedBy: characterSet).joined(separator: "")
        return withoutSpecialChars
    }
    
    func stringByReplacingFirstOccurrenceOfString(
        target: String, withString replaceString: String) -> String{
        if let range = self.range(of: target) {
            return self.replacingCharacters(in: range, with: replaceString)
        }
        return self
    }
    
    func stringToDate(dateFormat:String = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z") -> Date{
        let formatter = DateFormatter()
        formatter.dateFormat =  dateFormat
        guard let date = formatter.date(from: self) else{return Date()}
        let milliSecond = date.timeIntervalSinceNow
        
        let currentTimeZone = TimeZone.current
        
        let timeZoneMilliSecond = TimeInterval(currentTimeZone.secondsFromGMT(for: date)) + milliSecond
        return Date(timeIntervalSinceNow: timeZoneMilliSecond)
    }
    
    func getDate() -> String{
        var createdDate : Date = Date()
        var dateString = ""
        createdDate = self.stringToDate()
        let checkYear = createdDate.checkYear()
        if Calendar.current.isDateInToday(createdDate){
            dateString = (createdDate.convert("hh:mm a"))
        }
        else{
            dateString =  (checkYear ? createdDate.convert("dd MMM hh:mm a") : createdDate.getDetailedDate())
        }
        return dateString
    }
    
    func getDetailedDate() -> String {
        return self.stringToDate().convert("dd MMM yyyy hh:mm a")
    }
    
    func convertHtml() -> String{
        var encodedString = self
        encodedString = encodedString.replacingOccurrences(of: "<", with: "&lt;")
        encodedString =  encodedString.replacingOccurrences(of: ">", with: "&gt;")
        return encodedString
    }

    func decodeHtml() -> String{
        var encodedString = self
        encodedString = encodedString.replacingOccurrences(of: "&lt;", with: "<")
        encodedString =  encodedString.replacingOccurrences(of: "&gt;", with: ">")
        return encodedString
    }
    
    func extractEmailAddress() -> [String] {
        var results = [String]()
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let nsText = self as NSString
        do {
            let regExp = try NSRegularExpression(pattern: emailRegex, options: NSRegularExpression.Options.caseInsensitive)
            let range = NSMakeRange(0, self.count)
            let matches = regExp.matches(in: self, options: .reportProgress, range: range)
            
            for match in matches {
                let matchRange = match.range
                results.append(nsText.substring(with: matchRange))
            }
            
        } catch _ { }
        
        return results
    }
    
    mutating func replaceUnwantedString(_ replcaeCharacter:String)->String{
        if let dotRange = self.range(of: replcaeCharacter) {
            self.removeSubrange(dotRange.lowerBound..<(self.endIndex))
        }
        return self
    }
    
    
    func log(file: String = #file,
                    functionName: String = #function,
                    lineNumber: Int = #line) {
        print("\(URL(fileURLWithPath: file).lastPathComponent)-\(functionName):\(lineNumber)  \(self)")
    }
    
    func assertFailure(file: String = #file,
                              functionName: String = #function,
                              lineNumber: Int = #line) {
        assertionFailure("\(URL(fileURLWithPath: file).lastPathComponent)-\(functionName):\(lineNumber)  \(self)")
    }
    
    var encoded: String? {
        let characterSet = CharacterSet(charactersIn: "=+&:,'\"#%/<>?@\\^`{|} ")
        
        if let result = self.addingPercentEncoding(withAllowedCharacters: characterSet.inverted) {
            return result
        }
        
        return nil
    }
    
    func getAttributedString(font: UIFont, color: UIColor? = nil) -> NSMutableAttributedString {
        var attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font]

        if color != nil {
            attributes[NSAttributedString.Key.foregroundColor] = color
        }
        
        return NSMutableAttributedString(attributedString: NSAttributedString(string: self, attributes: attributes))
    }
}
