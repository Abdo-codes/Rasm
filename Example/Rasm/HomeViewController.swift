//
//  ViewController.swift
//  Rasm
//
//  Created by knight6700 on 03/19/2024.
//  Copyright (c) 2024 knight6700. All rights reserved.
//

import UIKit
import SwiftUI
import RasmButtons

enum Types: String, CaseIterable {
    case Buttons
    case textFields
}
class TableViewController: UIViewController {
    
    // Create a UITableView instance
    let tableView = UITableView()

    // Sample data
    let data: [Types] = Types.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the title
        title = "Rasm Components"
        
        // Add tableView to the view
        view.addSubview(tableView)
        
        // Set up the table view's frame and constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Register the cell class
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Set the data source and delegate
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource

extension TableViewController: UITableViewDataSource {
    // Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // Cell for row at index path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].rawValue
        return cell
    }
}

// MARK: - UITableViewDelegate

extension TableViewController: UITableViewDelegate {
    // Did select row at index path
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch data[indexPath.row] {
        case .Buttons:
            let vc = UIHostingController(rootView: ButtonsView())
            self.navigationController?.pushViewController(vc, animated: true)
        case .textFields:
            let vc = UIHostingController(rootView: TextFieldsView())
            self.navigationController?.pushViewController(vc, animated: true)
//             let bottomSheetTransitioningDelegate = BottomSheetTransitioningDelegate()
//            let bottomSheetVC = BottomSheetViewController()
//            bottomSheetVC.modalPresentationStyle = .custom
//            bottomSheetVC.transitioningDelegate = bottomSheetTransitioningDelegate
//            present(bottomSheetVC, animated: true, completion: nil)
//            print("Selected \(data[indexPath.row])")
        }
    }
}

import UIKit

class BottomSheetViewController: UIViewController {
    
    private let handleAreaHeight: CGFloat = 44.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupHandleArea()
    }
    
    private func setupHandleArea() {
    }
}
import UIKit

enum BottomSheetHeight {
    case small
    case medium
    case large
}

class BottomSheetPresentationController: UIPresentationController {
    
    private let dimmingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.alpha = 0.0
        return view
    }()
    
    private var panGestureRecognizer: UIPanGestureRecognizer!
    private var presentedViewHeight: CGFloat = 0
    private var currentHeight: BottomSheetHeight = .medium
    private let cornerRadius: CGFloat = 16.0
    
    override var shouldRemovePresentersView: Bool {
        return false
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }
        let yOffset: CGFloat
        switch currentHeight {
        case .small:
            yOffset = containerView.bounds.height * 0.75
        case .medium:
            yOffset = containerView.bounds.height * 0.5
        case .large:
            yOffset = containerView.bounds.height * 0.25
        }
        let height = containerView.bounds.height - yOffset
        presentedViewHeight = height
        return CGRect(x: 0, y: yOffset, width: containerView.bounds.width, height: height)
    }
    
    override func presentationTransitionWillBegin() {
        guard let containerView = containerView else { return }
        
        dimmingView.frame = containerView.bounds
        containerView.insertSubview(dimmingView, at: 0)
        
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 1.0
        }, completion: nil)
        
        setupPresentedViewCornerRadius()
        setupPanGestureRecognizer()
    }
    
    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0.0
        }, completion: { _ in
            self.dimmingView.removeFromSuperview()
        })
    }
    
    private func setupPresentedViewCornerRadius() {
        presentedView?.layer.cornerRadius = cornerRadius
        presentedView?.layer.masksToBounds = true
    }
    
    private func setupPanGestureRecognizer() {
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        presentedView?.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc private func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        guard let containerView = containerView else { return }
        let translation = recognizer.translation(in: containerView)
        let velocity = recognizer.velocity(in: containerView)
        
        switch recognizer.state {
        case .changed:
            let newY = max(presentedView!.frame.minY + translation.y, containerView.bounds.height * 0.25)
            presentedView?.frame.origin.y = newY
            recognizer.setTranslation(.zero, in: containerView)
        case .ended:
            let velocityThreshold: CGFloat = 500
            if velocity.y > velocityThreshold {
                presentedViewController.dismiss(animated: true, completion: nil)
            } else {
                let yOffset = presentedView!.frame.minY
                if yOffset > containerView.bounds.height * 0.6 {
                    currentHeight = .small
                } else if yOffset > containerView.bounds.height * 0.35 {
                    currentHeight = .medium
                } else {
                    currentHeight = .large
                }
                animateToCurrentHeight()
            }
        default:
            break
        }
    }
    
    private func animateToCurrentHeight() {
        guard let containerView = containerView else { return }
//        UIView.animate(withDuration: 0.3) {
            self.presentedView?.frame = self.frameOfPresentedViewInContainerView
//            self.dimmingView.alpha = self.currentHeight == .small ? 0.0 : 1.0
//        }
    }
}


import UIKit

class BottomSheetTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return BottomSheetPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BottomSheetPresentAnimationController()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BottomSheetDismissAnimationController()
    }
}

import UIKit

class BottomSheetPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toView = transitionContext.view(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toView)
        
        let finalFrame = transitionContext.finalFrame(for: transitionContext.viewController(forKey: .to)!)
        let initialFrame = finalFrame.offsetBy(dx: 0, dy: containerView.bounds.height)
        toView.frame = initialFrame
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toView.frame = finalFrame
        }, completion: { finished in
            transitionContext.completeTransition(finished)
        })
    }
}
import UIKit

class BottomSheetDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        
        let finalFrame = fromView.frame.offsetBy(dx: 0, dy: fromView.frame.height)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromView.frame = finalFrame
        }, completion: { finished in
            transitionContext.completeTransition(finished)
        })
    }
}
