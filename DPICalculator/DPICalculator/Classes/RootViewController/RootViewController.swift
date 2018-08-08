//
//  ViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 10.02.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    static let shared:RootViewController = RootViewController()
    private var currentViewController: UIViewController

    init() {
        currentViewController = MainViewController()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not yet implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewController(currentViewController)
        currentViewController.view.frame = view.bounds
        view.addSubview(currentViewController.view)
        currentViewController.didMove(toParentViewController: self)
        currentViewController.updateViewConstraints()
    }

    private func replaceCurrentViewController(for newViewController: UIViewController) {
        currentViewController.willMove(toParentViewController: nil)
        currentViewController.view.removeFromSuperview()
        currentViewController.removeFromParentViewController()
        currentViewController = newViewController
        currentViewController.updateViewConstraints()
    }

    private func animateFadeTransition(to newViewController: UIViewController, completion: (() -> Void)? = nil) {
        currentViewController.willMove(toParentViewController: nil)

        addChildViewController(newViewController)
        currentViewController.view.frame = newViewController.view.bounds

        transition(from: currentViewController,
                   to: newViewController,
                   duration: 0.5,
                   options: [.transitionCrossDissolve, .curveEaseOut],
                   animations: {
                    [weak self] in
                    self?.view.addSubview(newViewController.view)
        }) { [weak self] completed in
            self?.currentViewController.removeFromParentViewController()
            self?.currentViewController.view.removeFromSuperview()
            newViewController.didMove(toParentViewController: self)
            self?.currentViewController = newViewController
            completion?()
        }
    }

    @objc func showExampleViewController(){
        let newViewController = ExampleViewController()
        addChildViewController(newViewController)
        newViewController.view.frame = view.bounds
        view.addSubview(newViewController.view)
        newViewController.didMove(toParentViewController: self)
        replaceCurrentViewController(for: newViewController)
    }


    
}

