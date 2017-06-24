//
//  ViewController.swift
//  ALSlidingNavigationBar
//
//  Created by Aleksander Lorenc on 06/18/2017.
//  Copyright (c) 2017 Aleksander Lorenc. All rights reserved.
//

import UIKit
import ALSlidingNavigationBar

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var relationView: UILabel!

    var navigationBarView: UILabel!
    var slidingNavigationBar: ALSlidingNavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBarView = UILabel(
            frame: CGRect(x: 0,
                          y: 0,
                          width: self.navigationController!.navigationBar.frame.width,
                          height: self.navigationController!.navigationBar.frame.height
            )
        )

        self.navigationBarView.textAlignment = .center
        self.navigationBarView.text = "💩🎃"
        self.navigationBarView.isUserInteractionEnabled = true

        self.navigationBarView.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(self.navigationBarViewClicked))
        )

        self.slidingNavigationBar = ALSlidingNavigationBar(
            navigationBar: self.navigationController!.navigationBar,
            navigationItem: self.navigationItem,
            navigationBarView: self.navigationBarView
        )

        // self.slidingNavigationBar.setAnchor(view: self.relationView)
        self.slidingNavigationBar.setAnchor(offsetY: 100)
    }

    func navigationBarViewClicked() {
        self.navigationBarView!.text = "🎃💩"
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.slidingNavigationBar.didScroll(offset: scrollView.contentOffset.y, convertView: self.view)
    }
}
