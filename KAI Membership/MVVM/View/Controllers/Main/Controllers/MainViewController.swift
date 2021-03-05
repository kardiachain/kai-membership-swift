//
//  MainViewController.swift
//  KAI Membership
//
//  Created by Anh Kiệt on 03/03/2021.
//

import UIKit
import RxSwift

class MainViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    let viewModel = MainViewModel()
    
    private lazy var disposeBag = DisposeBag()
    
    // MARK: Life cycle's
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            if overrideUserInterfaceStyle == .dark {
                imageView.image = UIImage(named: "launch_screen_white")
                activityIndicatorView.color = .white
            } else {
                imageView.image = UIImage(named: "launch_screen")
                activityIndicatorView.color = .black
            }
        } else {
            imageView.image = UIImage(named: "launch_screen")
            activityIndicatorView.color = .black
        }
        
//        fetchData()
        
        Navigator.showTutorialVC()
    }
    
    // MARK: Fetch data
    private func fetchData() {
        viewModel.getAccountsLoggedIntoDevice().subscribe(on: MainScheduler.instance).subscribe { device in
            if let device = device, !device.users.isEmpty {
                Navigator.showSelectAccountVC(device.users)
            } else {
                Navigator.showSignInVC()
            }
        } onError: { error in
            debugPrint("Get accounts logged into device error: \((error as? APIErrorResult)?.message ?? "ERROR")")
            Navigator.showSignInVC()
        }.disposed(by: disposeBag)
    }
}
