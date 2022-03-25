//
//  PrintHelper.swift
//  tunki-user
//
//  Created by Alexis Gonzalo Quarin on 07/09/2019.
//  Copyright © 2019 InDigital. All rights reserved.
//

import UIKit

extension NSObject {

    /// Realiza un log utilizando el método print que solo será visible en modo debug
    ///
    /// FORMATO:
    ///     Log: ----------------------------------
    ///
    ///     Class: [#class]
    ///     Function: [#function]
    ///     Line: [#line]
    ///
    ///     Message
    ///
    ///     [inputString]
    ///
    ///     End log -------------------------------
    ///
    /// - Parameters:
    ///   - input: input a loguear
    ///   - separator: separador que se utilizará en caso de ser más de un elemento
    ///   - line: opcional, tomará por defecto la linea que realiza el log
    ///   - function: optional, tomará por defecto el nombre de la función que lo esá llamando
    public func log(_ input: Any?..., separator: String = " ", line: Int = #line, function: String = #function) {
        
        let output = input.map { "\(String(describing: $0))" }.joined(separator: separator)
        
        Swift.print("""
            
            Log: ----------------------------------
            
            Class: \(type(of: self))
            Function: \(function)
            Line: \(line)
            
            Message
            
            \(output)
            
            End log -------------------------------
            
            """)
    }
}
