//
//  ALSlidingNavigationBar.swift
//  testnav
//
//  Created by Aleksander Lorenc on 17/06/2017.
//  Copyright © 2017 unwrappedsoftware. All rights reserved.
//

import UIKit

public class ALSlidingNavigationBar {
    var navigationBar: UINavigationBar!
    var navigationBarView: UIView!
    var navigationItem: UINavigationItem!

    var anchorView: UIView?
    var anchorOffsetY: CGFloat?

    public init(navigationBar: UINavigationBar, navigationItem: UINavigationItem, navigationBarView: UIView) {
        self.navigationBarView = navigationBarView
        self.navigationBar = navigationBar
        self.navigationItem = navigationItem

        self.initializeSlidingNavbar()
    }

    public func setAnchor(offsetY: CGFloat) {
        self.anchorOffsetY = offsetY
        self.anchorView = nil
    }

    public func setAnchor(view: UIView) {
        self.anchorView = view
        self.anchorOffsetY = nil
    }

    private func initializeSlidingNavbar() {
        self.navigationBar.clipsToBounds = true
        self.navigationItem.titleView = self.navigationBarView
        self.navigationBarView.isHidden = true
    }

    public func didScroll(offset: CGFloat, convertView: UIView) {
        var anchorOffset: CGFloat = 0

        if let anchorView = self.anchorView {
            var frame = anchorView.convert(anchorView.frame.origin, to: convertView)
            frame = CGPoint(x: frame.x, y: frame.y - anchorView.bounds.height)

            anchorOffset = frame.y
        } else if let anchorOffsetY = self.anchorOffsetY {
            anchorOffset = anchorOffsetY
        }

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

        if offsetY > 0 {
            self.navigationBarView.isHidden = false
        } else {
            self.navigationBarView.isHidden = true
        }
    }
}
