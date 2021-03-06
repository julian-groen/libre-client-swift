//
//  LibreCGMManager+UI.swift
//  LibreKitUI
//
//  Created by Julian Groen on 13/05/2020.
//  Copyright © 2020 Julian Groen. All rights reserved.
//

import HealthKit
import LoopKitUI
import LibreKit

extension LibreCGMManager: CGMManagerUI {
    
    public static func setupViewController() -> (UIViewController & CGMManagerSetupViewController & CompletionNotifying)? {
        return LibreManagerSetupViewController()
    }
    
    public func settingsViewController(for glucoseUnit: HKUnit) -> (UIViewController & CompletionNotifying) {
        let settings = LibreManagerSettingsViewController(cgmManager: self, glucoseUnit: glucoseUnit, allowsDeletion: true)
        let navigation = SettingsNavigationViewController(rootViewController: settings)
        
        UserDefaults.standard.glucoseUnit = glucoseUnit
        
        return navigation
    }
    
    public var smallImage: UIImage? {
        return nil
    }
    
}
