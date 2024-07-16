//
//  String+Ext.swift
//  Appetizer
//
//  Created by Balogun Kayode on 04/07/2024.
//
import Foundation
import RegexBuilder

extension String {
    var isValidEmail: Bool {
        let emailRegex = Regex {
            /^/
            OneOrMore {
                CharacterClass(
                    .anyOf("._%+-"),
                    ("A"..."Z"),
                    ("0"..."9"),
                    ("a"..."z")
                )
            }
            "@"
            OneOrMore {
                CharacterClass(
                    .anyOf("-"),
                    ("A"..."Z"),
                    ("a"..."z"),
                    ("0"..."9")
                )
            }
           "."
            Repeat(2...64) {
                CharacterClass(
                    ("A"..."Z"),
                    ("a"..."z")
                )
            }
            /$/
        }
        return (self.wholeMatch(of: emailRegex ) != nil)
//        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
//        return emailPredicate.evaluate(with: self)
    }
}
