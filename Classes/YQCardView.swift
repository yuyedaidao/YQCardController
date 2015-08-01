//
//  YQCardView.swift
//  YQCardController
//
//  Created by Wang on 15/8/1.
//  Copyright (c) 2015年 Wang. All rights reserved.
//

import UIKit

protocol YQCardViewDelegate{
    func cardView(cardView: YQCardView, itemAtIndex index: NSInteger) -> YQCardItem
    func cardView(cardView: YQCardView, edgeInsetsForItemAtIndex index: NSInteger) -> UIEdgeInsets
    
}

class YQCardView: UIView {

    
    var resuableItemDic: Dictionary<String,AnyObject> = [:]
    var itemArrayDic: Dictionary<String,[YQCardItem]> = [:]
    
    func registerNib(nib: UINib, forItemReuseIdentifier identifier: String) {
        self.resuableItemDic[identifier] = nib
    }
    func registerClass(itemClass: AnyClass, forItemReuseIdentifier identifier: String) {
        self.resuableItemDic[identifier] = itemClass
    }
    func dequeueReusableItemWithIdentifier(identifier: String) -> AnyObject? {
        
        if let registerObj: AnyObject = self.resuableItemDic[identifier] {
            if let array = self.itemArrayDic[identifier] {
                //找到可用的item，被隐藏的就是可用的
                var resuableItem: YQCardItem? = nil
                for item in array {
                    if(item.hidden) {
                        item.hidden = false
                        resuableItem = item
                        break
                    }
                }
                if resuableItem != nil {
                    if let nibObj = registerObj as? UINib {
                        resuableItem = nibObj.instantiateWithOwner(nil, options: nil).last as? YQCardItem

                    }else if let classObj: AnyClass = registerObj as? AnyClass {
//                         classObj(reuseIdentifier: identifier)
                        if let obj: YQCardItem.Type = classObj as YQCardItem.Type {
                            obj(reuseIdentifier: identifier)
                        }
                    }
                }
                
                if let resultItem = resuableItem {
                    return resuableItem
                }else{
                    assertionFailure("很抱歉，您注册的可能并不是YQCardItem或其子类")
                }
                
            }
        
        }else{
            assertionFailure("您还没有注册以\(identifier)为标记的YQCardItem")
        }
        return nil;
    }

}
