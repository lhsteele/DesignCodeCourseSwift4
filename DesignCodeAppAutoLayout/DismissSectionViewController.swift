//
//  DismissSectionViewController.swift
//  DesignCodeAppAutoLayout
//
//  Created by Lisa Steele on 9/13/18.
//  Copyright © 2018 lisahsteele. All rights reserved.
//

import UIKit

class DismissSectionViewController: NSObject, UIViewControllerAnimatedTransitioning {
    var cellFrame: CGRect!
    var cellTransform: CATransform3D!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let origin = transitionContext.viewController(forKey: .from) as! SectionViewController
        let containerView = transitionContext.containerView
        containerView.addSubview(origin.view)
        
        let animator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.7) {
            let widthConstrant = origin.scrollView.widthAnchor.constraint(equalToConstant: 304)
            let heightConstraint = origin.scrollView.heightAnchor.constraint(equalToConstant: 248)
            let bottomConstraint = origin.scrollView.bottomAnchor.constraint(equalTo: origin.coverView.bottomAnchor)
            let titleTopConstraint = origin.titleLabel.topAnchor.constraint(equalTo: origin.titleLabel.superview!.topAnchor, constant: 20)
            
            NSLayoutConstraint.activate([widthConstrant, heightConstraint, bottomConstraint, titleTopConstraint])
            origin.view.layoutIfNeeded()
            
            let translate = CATransform3DMakeTranslation(self.cellFrame.origin.x, self.cellFrame.origin.y, 0.0)
            let transform = CATransform3DConcat(translate, self.cellTransform)
            origin.view.layer.transform = transform
            origin.view.layer.zPosition = 999
            
            origin.scrollView.layer.cornerRadius = 14
            origin.scrollView.layer.shadowOpacity = 0.25
            origin.scrollView.layer.shadowOffset.height = 10
            origin.scrollView.layer.shadowRadius = 20
            
            let moveUpTransform = CGAffineTransform(translationX: 0, y: -100)
            let scaleUpTransform = CGAffineTransform(scaleX: 2, y: 2)
            let removeFromViewTransform = moveUpTransform.concatenating(scaleUpTransform)
            origin.closeVisualEffectView.alpha = 0
            origin.closeVisualEffectView.transform = removeFromViewTransform
            origin.subheadVisualEffectView.alpha = 0
            origin.subheadVisualEffectView.transform = removeFromViewTransform
            origin.titleLabel.transform = .identity
            
        }
        animator.addCompletion { (finished) in
            transitionContext.completeTransition(true)
        }
        animator.startAnimation()
    }
    

}
