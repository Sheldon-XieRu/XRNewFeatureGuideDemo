//
//  XRGuideViewCell.m
//  XRNewFeatureGuide
//
//  Created by Ru on 1/5/16.
//  Copyright © 2016年 Ru. All rights reserved.
//

#import "XRGuideViewCell.h"
#import "UIView+Frame.h"
@interface XRGuideViewCell ()

// ** 开始按钮 * /
@property (nonatomic,weak) UIButton *startButton;

// ** 可以复用的imageView * /
@property (nonatomic,weak) UIImageView *imageView;
@end


@implementation XRGuideViewCell

-(UIButton *)startButton
{
    if (_startButton == nil) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        _startButton = button;
        [_startButton setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [_startButton sizeToFit];
        _startButton.center = CGPointMake(self.width * 0.5, self.height * 0.9);
        [self.contentView addSubview:_startButton];
    }
    return _startButton;
}

-(UIImageView *)imageView
{
    if (_imageView == nil) {
        UIImageView *imageview = [[UIImageView alloc]init];
        imageview.frame = self.bounds;
        _imageView = imageview;
        [self.contentView addSubview:_imageView];
    }
    
    return _imageView;
}

-(void)setImage:(UIImage *)image
{
    _image = image;
    self.imageView.image = image;
}


-(void)setPage:(NSInteger)page
{
    _page = page;
    if (page == 4) {
        self.startButton.hidden = NO;
    }else{
        self.startButton.hidden = YES;
    }
}

@end
