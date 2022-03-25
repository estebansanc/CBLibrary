//
//  AppTrackingTransparency+Permissions.swift
//  tunki-user
//
//  Created by Gonzalo Quarin on 29/04/21.
//  Copyright © 2021 InDigital. All rights reserved.
//

import UIKit

import AppTrackingTransparency
import AdSupport

//NEWLY ADDED PERMISSIONS FOR iOS 14
func requestAppTrackingTransparencyPermission() {
	if #available(iOS 14, *) {
		ATTrackingManager.requestTrackingAuthorization { status in
			switch status {
			case .authorized:
				// Tracking authorization dialog was shown
				// and we are authorized
				print("Authorized")
				// Now that we are authorized we can get the IDFA
				print(ASIdentifierManager.shared().advertisingIdentifier)
			case .denied:
				// Tracking authorization dialog was
				// shown and permission is denied
				print("Denied")
			case .notDetermined:
				// Tracking authorization dialog has not been shown
				print("Not Determined")
			case .restricted:
				print("Restricted")
			@unknown default:
				print("Unknown")
			}
		}
	}
}
