//
//  EYEPopularWeekController.swift
//  EyepetizerApp
//
//  Created by 梁亦明 on 16/3/20.
//  Copyright © 2016年 xiaoming. All rights reserved.
//

import UIKit
import Alamofire

class EYEPopularWeekController: UIViewController, LoadingPresenter {

    /// 加载view
    var loaderView : EYELoaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(collectionView)
        
        // 获取数据
        setupLoaderView()
        getData()
    }
    //MARK: --------------------------- Private Methods --------------------------
    private func getData(api : String = FJAPIHeapler.API_Popular_Weakly) {
        setLoaderViewHidden(false)
        Alamofire.request(.GET, api).responseSwiftyJSON ({ [unowned self](request, response, json, error) -> Void in
            // 字典转模型 刷新数据
            if json != .null && error == nil {
                let dataDict = json.rawValue as! NSDictionary
                let itemArray = dataDict["videoList"] as! NSArray
                
                self.modelList = itemArray.map({ (dict) -> ItemModel in
                    ItemModel(dict: dict as? NSDictionary)
                })
                
                self.collectionView.reloadData()
            }
            
            self.setLoaderViewHidden(true)
            })
    }
    
    //MARK: --------------------------- Getter or Setter --------------------------
    // 模型
    private var modelList : [ItemModel] = [ItemModel]()
    
    /// collectionView
    private lazy var collectionView : EYECollectionView = {
        
        let rect = CGRectMake(0, 0, UIConstant.SCREEN_WIDTH, UIConstant.SCREEN_HEIGHT-UIConstant.UI_TAB_HEIGHT-UIConstant.UI_CHARTS_HEIGHT-UIConstant.UI_NAV_HEIGHT)
        var collectionView : EYECollectionView = EYECollectionView(frame: rect, collectionViewLayout:EYECollectionLayout())
        let layout = collectionView.collectionViewLayout as! EYECollectionLayout
        layout.footerReferenceSize = CGSize(width: collectionView.width, height: 50)
        collectionView.registerClass(EYEPopularFooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: EYEPopularFooterView.reuseIdentifier)

        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
   
}

 //MARK: --------------------------- UICollectionViewDelegate,UICollectionViewDataSource --------------------------
extension EYEPopularWeekController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelList.count
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = cell as! EYEChioceCell
        cell.model = modelList[indexPath.row]
        cell.index = "\(indexPath.row+1)"
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(EYEChioceCell.reuseIdentifier, forIndexPath: indexPath) as! EYEChioceCell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if self.parentViewController is EYEPopularController {
            (parentViewController as! EYEPopularController).selectCell = collectionView.cellForItemAtIndexPath(indexPath) as! EYEChioceCell
        }
        
        let model = modelList[indexPath.row]
        self.navigationController?.pushViewController(EYEVideoDetailController(model: model), animated: true)
    }
    
    /**
     *  section FootView
     */
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let footView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter, withReuseIdentifier: EYEPopularFooterView.reuseIdentifier, forIndexPath: indexPath)
        return footView
    }
}

