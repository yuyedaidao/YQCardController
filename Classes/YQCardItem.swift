//
//  YQCardItem.swift
//  YQCardController
//
//  Created by Wang on 15/8/1.
//  Copyright (c) 2015年 Wang. All rights reserved.
//

import UIKit

class YQCardItem: UIView {

    let contentView:UIView! = UIView()
    let reuseIdentifier:NSString
    
    init (reuseIdentifier:NSString){
        self.reuseIdentifier = reuseIdentifier;
        super.init(frame:CGRectZero)
        self.addSubview(self.contentView);
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override func layoutSubviews() {
        self.contentView.frame = self.bounds;
    }

}
