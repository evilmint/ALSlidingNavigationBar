//
//  ALSlidingNavigationBar.swift
//  testnav
//
//  Created by Aleksander Lorenc on 17/06/2017.
//  Copyright © 2017 unwrappedsoftware. All rights reserved.
//

import UIKit

@objc public protocol ALSlidingNavigationBarDelegate: class {
    @objc optional func navigationBarViewChangedVisibility(isVisible: Bool)
    @objc optional func offsetDidChange(_ offset: CGFloat)
}

open class ALSlidingNavigationBar {
    var navigationBar: UINavigationBar!
    var navigationBarView: UIView!
    var navigationItem: UINavigationItem!

    open var anchorView: UIView?
    open var anchorOffsetY: CGFloat?

    public weak var delegate: ALSlidingNavigationBarDelegate?

    public init(navigationBar: UINavigationBar, navigationItem: UINavigationItem, navigationBarView: UIView) {
        self.navigationBarView = navigationBarView
        self.navigationBar = navigationBar
        self.navigationItem = navigationItem

        self.initializeSlidingNavbar()
    }

    open func setAnchor(offsetY: CGFloat) {
        self.anchorOffsetY = offsetY
        self.anchorView = nil
    }

    open func setAnchor(view: UIView) {
        self.anchorView = view
        self.anchorOffsetY = nil
    }

    open func initializeSlidingNavbar() {
        self.navigationBar.clipsToBounds = true
        self.navigationItem.titleView = self.navigationBarView
        self.navigationBarView.isHidden = true
    }

    open func didScroll(offset: CGFloat, convertView: UIView) {
        let anchorOffset: CGFloat = self.getAnchorOffset(convertView: convertView)

        let offsetYRaw = (offset - anchorOffset)
        let offsetY = min(
            self.navigationBarView.frame.height + self.navigationBar.frame.height,
            max(0, offsetYRaw)
        )

        self.navigationBarView.center = CGPoint(
            x: self.navigationBar.frame.width / 2.0,
            y: max(
                self.navigationBar.frame.height / 2.0,
                self.navigationBar.frame.height + self.navigationBarView.frame.height / 2.0 - offsetY
            )
        )

        let isNavigationBarViewHidden = (offsetY <= 0)

        self.delegate?.offsetDidChange?(offsetYRaw)

        if isNavigationBarViewHidden != self.navigationBarView.isHidden {
            self.delegate?.navigationBarViewChangedVisibility?(isVisible: !isNavigationBarViewHidden)
            self.navigationBarView.isHidden = isNavigationBarViewHidden
        }
    }

    open func getAnchorOffset(convertView: UIView) -> CGFloat {
        if let anchorView = self.anchorView {
            var frame = anchorView.convert(anchorView.frame.origin, to: convertView)
            frame = CGPoint(x: frame.x, y: frame.y - anchorView.bounds.height)

            return frame.y
        } else if self.anchorOffsetY != nil {
            return self.anchorOffsetY!
        }

        return 0.0
    }
}
