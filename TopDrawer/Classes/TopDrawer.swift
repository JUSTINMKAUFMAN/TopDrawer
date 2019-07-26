//
//  TopDrawer.swift
//  TopDrawer
//
//  Created by Justin Kaufman on 7/24/19.
//  Copyright © 2019 Justin Kaufman. All rights reserved.
//

import Foundation
import UIKit

public class TopDrawer: UIView {
    public var isVisible: Bool {
        get { return _isVisible }
        set {
            guard newValue != _isVisible else { return }
            toggleVisibility()
        }
    }

    private var _isVisible: Bool = true

    private lazy var panGestureRecognizer: UIPanGestureRecognizer = {
        return UIPanGestureRecognizer(target: self, action: #selector(self.didPanDrawer(_:)))
    }()

    public convenience init(backgroundColor: UIColor) {
        self.init()
        self.backgroundColor = backgroundColor
    }

    public init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func toggleVisibility() {
        let newFrame: CGRect = !_isVisible ? startingFrame() : hiddenFrame()

        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            usingSpringWithDamping: 2.0,
            initialSpringVelocity: 0.75,
            options: .curveEaseInOut,
            animations: {
                self.frame = newFrame
                self.layoutIfNeeded()
            }
        ) { _ in
            self._isVisible.toggle()
        }
    }
}

private extension TopDrawer {
    func setupView() {
        frame = startingFrame()

        backgroundColor = UIColor.lightGray.withAlphaComponent(0.525)

        // Keep the drawer at the top of the visible hierarchy
        layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        layer.masksToBounds = true

        let maskPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(
                width: Constants.cornerRadius,
                height: Constants.cornerRadius
            )
        )

        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer

        let borderLayer = CAShapeLayer()
        borderLayer.frame = bounds
        borderLayer.path = maskPath.cgPath
        borderLayer.lineWidth = 1.0
        borderLayer.strokeColor = UIColor.darkGray.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(borderLayer)

        let grooveSize: CGSize = CGSize(width: 24.0, height: 2.125)

        for index in 0 ..< 2 {
            let x: CGFloat = (bounds.size.width / 2.0) - (grooveSize.width / 2.0)
            let y: CGFloat = bounds.size.height - (grooveSize.height * 3.025) - (CGFloat(index) * (grooveSize.height * 2.5))

            let linePath = UIBezierPath()
            linePath.move(to: CGPoint(x: x, y: y))
            linePath.addLine(to: CGPoint(x: x + grooveSize.width, y: y))

            let shapeLayer = CAShapeLayer()
            shapeLayer.path = linePath.cgPath
            shapeLayer.strokeColor = UIColor.white.withAlphaComponent(0.625).cgColor
            shapeLayer.lineWidth = grooveSize.height
            shapeLayer.fillColor = UIColor.clear.cgColor

            layer.addSublayer(shapeLayer)
        }

        addGestureRecognizer(panGestureRecognizer)
    }

    @objc func didPanDrawer(_ gestureRecognizer: UIPanGestureRecognizer) {
        if [.began, .changed].contains(gestureRecognizer.state) {
            let translation = gestureRecognizer.translation(in: self)
            let centerPoint: CGPoint = CGPoint(
                x: gestureRecognizer.view!.center.x,
                y: gestureRecognizer.view!.center.y + translation.y
            )

            // Don't allow view to be dragged so far down that it detaches from
            // the top, nor too far up that it can't be touch-dragged back down
            if centerPoint.y < (gestureRecognizer.view!.frame.size.height / 2.0) &&
                centerPoint.y > (((gestureRecognizer.view!.frame.size.height / 2.0) - Constants.minimumVisibleHeight) * -1.0) {
                gestureRecognizer.view!.center = centerPoint
            } else {
                gestureRecognizer.view!.center = CGPoint(
                    x: gestureRecognizer.view!.center.x,
                    y: gestureRecognizer.view!.center.y
                )
            }

            gestureRecognizer.setTranslation(CGPoint.zero, in: self)
        }
    }
}

private extension TopDrawer {
    func hiddenFrame() -> CGRect {
        return CGRect(
            x: 0.0,
            y: -Constants.height,
            width: UIScreen.main.bounds.size.width,
            height: Constants.height
        )
    }

    func startingFrame() -> CGRect {
        return CGRect(
            x: 0.0,
            y: -(Constants.height - Constants.minimumVisibleHeight),
            width: UIScreen.main.bounds.size.width,
            height: Constants.height
        )
    }

    func fullFrame() -> CGRect {
        return CGRect(
            x: 0.0,
            y: 0.0,
            width: UIScreen.main.bounds.size.width,
            height: Constants.height
        )
    }
}

private extension TopDrawer {
    struct Constants {
        static let height: CGFloat = UIScreen.main.bounds.size.height - Constants.minimumVisibleHeight
        static let cornerRadius: CGFloat = 22.0
        static let minimumVisibleHeight: CGFloat = 76.0
    }
}
