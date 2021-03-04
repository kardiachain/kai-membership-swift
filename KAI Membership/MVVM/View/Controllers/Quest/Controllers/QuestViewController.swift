//
//  QuestViewController.swift
//  KAI Membership
//
//  Created by Anh Kiệt on 23/02/2021.
//

import UIKit
import RxSwift

class QuestViewController: BaseViewController {
    
    // MARK: Properties
    let viewModel = QuestViewModel()
    
    private(set) lazy var childViewController: NestedScrollViewController = {
        let childVC = NestedScrollViewController(with: self)
        childVC.delegate = self
        
        return childVC
    }()
    
    private(set) lazy var headerView: QuestHeaderView = {
        let view = QuestHeaderView()
        view.selectedSegmentIndexChanged = { [weak self] in
            guard let this = self else { return }
            
            let containerScrollView = this.childViewController.containerScrollView
//            lastContentOffsetX = containerScrollView.contentOffset.x
            let y = containerScrollView.contentOffset.y
            this.childViewController.containerScrollView.setContentOffset(CGPoint(x: containerScrollView.frame.width * CGFloat($0), y: y), animated: true)
        }
        
        return view
    }()
    
    // MARK: Life cycle's
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.add(childViewController)
        fetchData()
    }
    
    // MARK: Data fetching
    private func fetchData() {
        viewModel.getTheQuestsList().subscribe(on: MainScheduler.instance).subscribe(onNext: { [weak self] quest in
            guard let this = self else { return }
            
            
        }, onError: { error in
            debugPrint("Get the quests list error: \((error as? APIErrorResult)?.message ?? "ERROR")")
        }).disposed(by: disposeBag)
    }
}
