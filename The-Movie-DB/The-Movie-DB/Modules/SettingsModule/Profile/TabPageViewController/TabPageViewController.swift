//
//  TabPageViewController.swift
//  TabPageViewController
//
//  Created by EndouMari on 2016/02/24.
//  Copyright © 2016年 EndouMari. All rights reserved.
//

import UIKit

open class TabPageViewController: UIPageViewController {
    open var isInfinity: Bool = false
    open var option: TabPageOption = TabPageOption()
    open var tabItems: [(viewController: UIViewController, title: String)] = []

    var currentIndex: Int? {
        guard let viewController = viewControllers?.first else {
            return nil
        }
        return tabItems.map{ $0.viewController }.firstIndex(of: viewController)
    }
    fileprivate var beforeIndex: Int = 0
    fileprivate var tabItemsCount: Int {
        return tabItems.count
    }
    fileprivate var defaultContentOffsetX: CGFloat {
        return self.view.bounds.width
    }
    fileprivate var shouldScrollCurrentBar: Bool = true
    lazy fileprivate var tabView: TabView = self.configuredTabView()

    public init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        setupPageViewController()
        setupScrollView()
    }

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if tabView.superview == nil {
            tabView = configuredTabView()
        }

        if let currentIndex = currentIndex , isInfinity {
            tabView.updateCurrentIndex(currentIndex, shouldScroll: true)
        }
    }

    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        tabView.layouted = true
    }

    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
    }
}

// MARK: - Public Interface

public extension TabPageViewController {

    func displayControllerWithIndex(_ index: Int, direction: UIPageViewController.NavigationDirection, animated: Bool) {

        beforeIndex = index
        shouldScrollCurrentBar = false
        let nextViewControllers: [UIViewController] = [tabItems[index].viewController]

        let completion: ((Bool) -> Void) = { [weak self] _ in
            self?.shouldScrollCurrentBar = true
            self?.beforeIndex = index
        }

        setViewControllers(
            nextViewControllers,
            direction: direction,
            animated: animated,
            completion: completion)

        guard isViewLoaded else { return }
        tabView.updateCurrentIndex(index, shouldScroll: true)
    }
}

// MARK: - View

extension TabPageViewController {

    fileprivate func setupPageViewController() {
        dataSource = self
        delegate = self
                
        setViewControllers([tabItems[beforeIndex].viewController],
                           direction: .forward,
                           animated: false,
                           completion: nil)
    }

    fileprivate func setupScrollView() {
        // Disable PageViewController's ScrollView bounce
        let scrollView = view.subviews.compactMap { $0 as? UIScrollView }.first
        scrollView?.scrollsToTop = false
        scrollView?.delegate = self
        scrollView?.backgroundColor = option.pageBackgoundColor
        scrollView?.contentInsetAdjustmentBehavior = .never
    }

    fileprivate func configuredTabView() -> TabView {
        let tabView = TabView(isInfinity: isInfinity, option: option)
        tabView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tabView)
        
        let constraints = [
            tabView.heightAnchor.constraint(equalToConstant: option.tabHeight),
            tabView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tabView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tabView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)

        tabView.pageTabItems = tabItems.map({ $0.title})
        tabView.updateCurrentIndex(beforeIndex, shouldScroll: true)

        tabView.pageItemPressedBlock = { [weak self] (index: Int, direction: UIPageViewController.NavigationDirection) in
            self?.displayControllerWithIndex(index, direction: direction, animated: true)
        }

        return tabView
    }
}

// MARK: - UIPageViewControllerDataSource

extension TabPageViewController: UIPageViewControllerDataSource {

    fileprivate func nextViewController(_ viewController: UIViewController, isAfter: Bool) -> UIViewController? {

        guard var index = tabItems.map({$0.viewController}).firstIndex(of: viewController) else {
            return nil
        }

        if isAfter {
            index += 1
        } else {
            index -= 1
        }

        if isInfinity {
            if index < 0 {
                index = tabItems.count - 1
            } else if index == tabItems.count {
                index = 0
            }
        }

        if index >= 0 && index < tabItems.count {
            return tabItems[index].viewController
        }
        return nil
    }

    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nextViewController(viewController, isAfter: true)
    }

    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nextViewController(viewController, isAfter: false)
    }
}

// MARK: - UIPageViewControllerDelegate

extension TabPageViewController: UIPageViewControllerDelegate {

    public func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        shouldScrollCurrentBar = true
        tabView.scrollToHorizontalCenter()

        // Order to prevent the the hit repeatedly during animation
        tabView.updateCollectionViewUserInteractionEnabled(false)
    }

    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let currentIndex = currentIndex , currentIndex < tabItemsCount {
            tabView.updateCurrentIndex(currentIndex, shouldScroll: false)
            beforeIndex = currentIndex
        }

        tabView.updateCollectionViewUserInteractionEnabled(true)
    }
}

// MARK: - UIScrollViewDelegate

extension TabPageViewController: UIScrollViewDelegate {

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x == defaultContentOffsetX || !shouldScrollCurrentBar {
            return
        }

        // (0..<tabItemsCount)
        var index: Int
        if scrollView.contentOffset.x > defaultContentOffsetX {
            index = beforeIndex + 1
        } else {
            index = beforeIndex - 1
        }
        
        if index == tabItemsCount {
            index = 0
        } else if index < 0 {
            index = tabItemsCount - 1
        }

        let scrollOffsetX = scrollView.contentOffset.x - view.frame.width
        tabView.scrollCurrentBarView(index, contentOffsetX: scrollOffsetX)
    }

    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        tabView.updateCurrentIndex(beforeIndex, shouldScroll: true)
    }
}
