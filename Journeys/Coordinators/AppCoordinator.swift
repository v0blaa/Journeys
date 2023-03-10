//
//  AppCoordinator.swift
//  Journeys
//
//  Created by Ищенко Анастасия on 07.11.2022.
//
import Foundation
import UIKit

class AppCoordinator: NSObject, CoordinatorProtocol {

    var childCoordinators = [CoordinatorProtocol]()
    let tabBarController: UITabBarController
    weak var journeysCoordinatorInput: CoordinatorProtocol?
    weak var accountCoordinatorInput: CoordinatorProtocol?
    
    private var firebaseService: FirebaseServiceProtocol

    init(tabBarController: UITabBarController, firebaseService: FirebaseServiceProtocol) {
        self.tabBarController = tabBarController
        self.firebaseService = firebaseService
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.backgroundColor = UIColor(asset: Asset.Colors.Background.brightColor)
    }

    func start() {
        tabBarController.delegate = self
        
        // TODO: Add color
        tabBarController.tabBar.tintColor = UIColor(asset: Asset.Colors.Icons.iconsColor)
        TabBarPage.allCases.forEach {
            getTabController($0)
        }
    }

    // TODO: finish
    func finish() {

    }
    
    // MARK: Private

    private func getTabController(_ page: TabBarPage) {
        switch page {
        case .journeys:
            let journeysCoordinator = JourneysCoordinator(rootTabBarController: tabBarController,
                                                          firebaseService: firebaseService)
            journeysCoordinator.start()
            childCoordinators.append(journeysCoordinator)
            journeysCoordinatorInput = journeysCoordinator

        case .account:
            let accountCoordinator = AccountCoordinator(rootTabBarController: tabBarController,
                                                        firebaseService: firebaseService)
            accountCoordinator.start()
            childCoordinators.append(accountCoordinator)
            accountCoordinatorInput = accountCoordinator
        }
    }
}

// MARK: UITabBarControllerDelegate

extension AppCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // TODO: Implement didSelect method
    }
}
