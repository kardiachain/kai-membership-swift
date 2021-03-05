//
//  RootTabbarController.swift
//  Demo KAI
//
//  Created by Anh Kiệt on 22/01/2021.
//

import UIKit

class RootTabbarController: UITabBarController {
    
    // MARK: Properties
    enum TabbarType: Int, CaseIterable {
        case news = 0
        case quest
        case wallet
        case utilities
    }
    
    // MARK: Life cycle's
    override func loadView() {
        super.loadView()
        setViewControllers(viewControllers(), animated: true)
        tabBar.tintColor = .black
        tabBar.isTranslucent = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ActivityServices.activity(userId: AccountManagement.userId ?? "guest")
    }
    
    // MARK: Handle UI
    private func viewControllers() -> [UINavigationController] {
        var navigationControllers: [UINavigationController] = []
        
        TabbarType.allCases.forEach {
            switch $0 {
            case .news:
                let news = NewsViewController()
                let navigationController = UINavigationController(rootViewController: news)
                navigationController.tabBarItem.title = "News"
                navigationController.tabBarItem.image = UIImage(named: "tabbar_news")?.withRenderingMode(.alwaysOriginal)
                navigationController.tabBarItem.selectedImage = UIImage(named: "tabbar_news_selected")?.withRenderingMode(.alwaysOriginal)
                navigationControllers.append(navigationController)
            case .quest:
                let quest = QuestViewController()
                let navigationController = UINavigationController(rootViewController: quest)
                navigationController.tabBarItem.title = "Mission"
                navigationController.tabBarItem.image = UIImage(named: "tabbar_quests")?.withRenderingMode(.alwaysOriginal)
                navigationController.tabBarItem.selectedImage = UIImage(named: "tabbar_quests_selected")?.withRenderingMode(.alwaysOriginal)
                navigationControllers.append(navigationController)
            case .wallet:
                let wallet = WalletViewController()
                let navigationController = UINavigationController(rootViewController: wallet)
                navigationController.tabBarItem.title = "My Wallet"
                navigationController.tabBarItem.image = UIImage(named: "tabbar_wallet")?.withRenderingMode(.alwaysOriginal)
                navigationController.tabBarItem.selectedImage = UIImage(named: "tabbar_wallet_selected")?.withRenderingMode(.alwaysOriginal)
                navigationControllers.append(navigationController)
            case .utilities:
                let utilities = UtilitiesViewController()
                let navigationController = UINavigationController(rootViewController: utilities)
                navigationController.tabBarItem.title = "Utilities"
                navigationController.tabBarItem.image = UIImage(named: "tabbar_utilities")?.withRenderingMode(.alwaysOriginal)
                navigationController.tabBarItem.selectedImage = UIImage(named: "tabbar_utilities_selected")?.withRenderingMode(.alwaysOriginal)
                navigationControllers.append(navigationController)
            }
        }
        
        return navigationControllers
    }
}
