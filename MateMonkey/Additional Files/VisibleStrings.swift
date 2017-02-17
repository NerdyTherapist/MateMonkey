//
//  VisibleStrings.swift
//  MateMonkey
//
//  Created by Peter on 04.02.17.
//  Copyright © 2017 Jurassic Turtle. All rights reserved.
//

import Foundation

struct VisibleStrings {
    
    static let callAlertTitle = NSLocalizedString("Make a phone call", comment: "Title for an alert when the user is about to make a phone call.")
    static let callAlertMessage = NSLocalizedString("Do you want to call this dealer?", comment: "Message for an alert when the user is about to make a phone call.")
    static let callAlertConfirm = NSLocalizedString("Call", comment: "Call confirmation action for an alert when the user is about to make a phone call.")
    
    static let cancel = NSLocalizedString("Cancel", comment: "Generic cancel for use in an alert.")
    static let ok = NSLocalizedString("OK", comment: "Generic OK for use in an alert.")
    
    static let missingFieldAlertTitle = NSLocalizedString("Missing Entry", comment: "Title for an alert when a required field for a dealer is empty.")
    static let missingFieldAlertMessage = NSLocalizedString("This field can not be empty: ", comment: "Message for an alert when a required field for a dealer is empty.")
    
    static let missingName = NSLocalizedString("Name", comment: "Reason for an alert when the user does not provide a required field: dealer name")
    static let missingStreet = NSLocalizedString("Street", comment: "Reason for an alert when the user does not provide a required field: street name")
    static let missingCountry = NSLocalizedString("Country", comment: "Reason for an alert when the user does not provide a required field: country")
    static let missingCity = NSLocalizedString("City", comment: "Reason for an alert when the user does not provide a required field: city")
    static let missingPostal = NSLocalizedString("ZIP Code", comment: "Reason for an alert when the user does not provide a required field: postal")

}