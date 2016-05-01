//
//  XRGuideViewCell.h
//  XRNewFeatureGuide
//
//  Created by Ru on 1/5/16.
//  Copyright © 2016年 Ru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XRGuideViewCell : UICollectionViewCell


// ** 图片  */
@property (nonatomic,strong) UIImage *image;

// ** 页数,到尾页显示开始按钮 */
@property (nonatomic,assign) NSInteger page;

@end
