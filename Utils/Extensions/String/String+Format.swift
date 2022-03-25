//
//  String+Format.swift
//  tunki-user
//
//  Created by Gonzalo Quarin on 5/20/20.
//  Copyright © 2020 InDigital. All rights reserved.
//

import UIKit

extension String {
    
    func withoutSpecialCharacters() -> String {
        return self.components(separatedBy: CharacterSet.symbols).joined(separator: emptyString)
    }
    
    /// 1 - Remueve los caracteres especiales
    /// 2 - Reemplaza los espacios (" ") por underscore ("_")
    /// 3 - Formatea a lower case
    /// - Returns: String con el formato de analytics "palabra1_palabra2"
    func analyticNameFormat() -> String {
        var name = self.withoutSpecialCharacters()
        name = name.replacingOccurrences(of: whiteSpace, with: underscore)
        name = name.lowercased()
        
        return name
    }
}
