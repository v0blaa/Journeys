//
//  Pages.swift
//  Journeys
//
//  Created by Сергей Адольевич on 07.12.2022.
//

import Foundation
import UIKit

enum TabBarPage: CaseIterable {
    case journeys
    case account

    var pageTitle: String {
        switch self {
        case .journeys:
            return L10n.journeys
        case .account:
            return L10n.account
        }
    }

    var numberOfPage: Int {
        switch self {
        case .journeys:
            return 0
        case .account:
            return 2
        }
    }

    var pageIconName: String {
        switch self {
        case .journeys:
            return "globe.europe.africa.fill"
        case .account:
            return "person.fill"
        }
    }
}
