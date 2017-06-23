//
//  ALSlidingNavigationBar.swift
//  testnav
//
//  Created by Aleksander Lorenc on 17/06/2017.
//  Copyright © 2017 unwrappedsoftware. All rights reserved.
//

import UIKit

open class ALSlidingNavigationBar {
    var navigationBar: UINavigationBar!
    var navigationBarView: UIView!
    var navigationItem: UINavigationItem!

    open var anchorView: UIView?
    open var anchorOffsetY: CGFloat?

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

        let offsetY = min(self.navigationBarView.frame.height + self.navigationBar.frame.height, max(0, offset - anchorOffset))

        let navigationBarHeight = self.navigationBar.frame.height
        let navigationBarWidth = self.navigationBar.frame.width

        self.navigationBarView.center = CGPoint(
            x: navigationBarWidth / 2.0,
            y: max(
                navigationBarHeight / 2.0,
                navigationBarHeight + self.navigationBarView.frame.height / 2.0 - offsetY
            )
        )

        self.navigationBarView.isHidden = (offsetY > 0)
    }

    open func getAnchorOffset(convertView: UIView) -> CGFloat {
        if let anchorView = self.anchorView {
            var frame = anchorView.convert(anchorView.frame.origin, to: convertView)
            frame = CGPoint(x: frame.x, y: frame.y - anchorView.bounds.height)

            return frame.y
        } else if let anchorOffsetY = self.anchorOffsetY {
            return anchorOffsetY
        }

        return 0.0
    }
}
