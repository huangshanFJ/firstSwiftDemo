//
//  UIScrollView+Eye.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/25.
//  Copyright © 2016年 方健. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    
    //MARK: --------------------------- 下拉刷新 --------------------------
    /**
     下拉刷新
     */
    func headerViewPullToRefresh(callback:(() -> Void)?) {
        // 创建headerview
        let headerView : EYEPullToRefreshHeaderView = EYEPullToRefreshHeaderView.headerView()
        self.addSubview(headerView)
        headerView.beginRefreshingCallback = callback
        headerView.state = .Normal
    }
    
    /**
     开始下拉刷新
     */
    func headerViewBeginRefreshing() {
        for object : AnyObject in self.subviews {
            if object is EYEPullToRefreshHeaderView {
                object.beginRefreshing()
            }
        }
    }
    
    /**
     *  结束下拉刷新
     */
    func headerViewEndRefresh() {
        for object : AnyObject in self.subviews{
            if object is EYEPullToRefreshHeaderView {
                object.endRefreshing()
            }
        }
    }
    //MARK: --------------------------- 上拉加载更多 --------------------------
    
    /**
     上拉加载更多
     */
    func footerViewPullToRefresh(callback : (()->Void)?) {
        let footView : EYEPullToRefreshFooterView = EYEPullToRefreshFooterView.footerView()
        self.addSubview(footView)
        footView.beginRefreshingCallback = callback
        footView.state = .Normal
    }
    
    /**
     开始上拉加载更多
     */
    func footerBeginRefreshing() {
        for object : AnyObject in self.subviews {
            if object is EYEPullToRefreshFooterView {
                object.beginRefreshing()
            }
        }
    }
    
    
    /**
     结束上拉加载更多
     */
    func footerViewEndRefresh()
    {
        for object : AnyObject in self.subviews{
            if object is EYEPullToRefreshFooterView {
                object.endRefreshing()
            }
        }
    }
}