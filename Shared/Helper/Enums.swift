//
//  Enums.swift
//  tunki-user
//
//  Created by Juliana Loaiza Labrador on 9/9/19.
//  Copyright © 2019 InDigital. All rights reserved.
//

import Foundation
import UIKit

enum RegularExpressions: String {
    case positiveNumbers = "^[0-9][0-9]*$"
    case textOnly = "^([^0-9]*)$"
    case numberOnly = "^[0-9]*$"
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    case alphaNumeric = "^[A-Z0-9]*$"
    case textOutEspecialCharacteres = "^([A-Za-zÑñáéíóúÁÉÍÓÚ ]*)$"
    case textNumberOutEspecialCharacteres = "^([A-Z0-9a-zÑñáéíóúÁÉÍÓÚ ]*)$"
}
