//
//  CustomPresentationController.swift
//  MyTodoList_UICoded
//
//  Created by t2023-m0026 on 1/30/24.
//

import UIKit

class CustomPresentationController: UIPresentationController {
    
    private var originalPosition : CGPoint = CGPoint(x: 0, y: 0)
    private var currentTouchedPosition : CGPoint?
    
    // modalView 뒤에 위치해 blur 효과를 주기 위한 별도의 view
    private let dimmingView : UIView = {
        let dimmingView = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterialDark))
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        return dimmingView
    }()
    
    // modalView의 크기와 위치 지정
    override var frameOfPresentedViewInContainerView: CGRect {
        let screenBounds = UIScreen.main.bounds
        
        // modalView의 크기 지정
        let size = CGSize(width: screenBounds.width,
                          height: screenBounds.height * 0.65)
        // modalView의 위치 지정
        let origin = CGPoint(x: .zero, y: screenBounds.height * 0.35)
        return CGRect(origin: origin, size: size)
    }
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        presentedView?.autoresizingMask = [
            .flexibleTopMargin,
            .flexibleBottomMargin,
            .flexibleRightMargin,
            .flexibleLeftMargin
        ]
        presentedView?.translatesAutoresizingMaskIntoConstraints = true
    }
    
    // modalView의 시작과 끝
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        // modalView가 나타날 때 실행할 코드
        guard let superview = presentingViewController.view else { return }
        superview.addSubview(dimmingView)
        setupDimmingViewLayout(in : superview)
        adoptPanGestureRecognizer()
        dimmingView.alpha = 0
        
        presentingViewController.transitionCoordinator?.animate(alongsideTransition: {_ in
            self.dimmingView.alpha = 0.5
        })
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        // modalView가 사라질 때 실행할 코드
        
        presentingViewController.transitionCoordinator?.animate(
            alongsideTransition: { _ in
                self.dimmingView.alpha = 0
            }, completion: { _ in
                self.dimmingView.removeFromSuperview()
            })
    }
    
    private func setupDimmingViewLayout(in view: UIView) {
        NSLayoutConstraint.activate([
            dimmingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dimmingView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func adoptPanGestureRecognizer() {
        guard let adoptedView = containerView else { return }
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dismissView(_:)))
        adoptedView.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc func dismissView(_ sender: UIPanGestureRecognizer) {
        guard let presentedView = presentedView else { return }
        let transaltion = sender.translation(in: presentedView)
        let velocity = sender.velocity(in: presentedView)
        
        switch sender.state {
        case .began:
            originalPosition = presentedView.center
            currentTouchedPosition = sender.location(in: presentedView)
        case .changed:
            presentedView.center.y = originalPosition.y + transaltion.y * 0.1
        case .ended:
            if velocity.y >= 100 {
                presentedViewController.dismiss(animated: true)
            } else {
                UIView.animate(withDuration: 0.2) { [self] in
                    presentedView.center = originalPosition
                }
            }
        default:
            break
        }
    }
}

// modalView 커스텀 델리게이트 설정. presentationController 메서드가 커스텀한 PresentationController를 반환
class CustomTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
