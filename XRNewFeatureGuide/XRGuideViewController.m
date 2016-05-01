//
//  XRGuideViewController.m
//  XRNewFeatureGuide
//
//  Created by Ru on 1/5/16.
//  Copyright © 2016年 Ru. All rights reserved.
//

#import "XRGuideViewController.h"
#import "XRGuideViewCell.h"
#import "UIView+Frame.h"

@interface XRGuideViewController ()

// ** guide 图片* /
@property (nonatomic,weak) UIImageView *guide;

// ** guideLargeText 图片* /
@property (nonatomic,weak) UIImageView *guideLargeText;

// ** guideSmallText 图片* /
@property (nonatomic,weak) UIImageView *guideSmallText;

// ** 上次的偏移量 */
@property (nonatomic,assign) CGFloat lastOffsetX;
@end

@implementation XRGuideViewController

static NSString * const reuseIdentifier = @"Cell";


/**
 *  重新初始化方法· 将设置flowLayout方法封装
 *
 *  @return 已经设置好FlowLayout 的UICollectionViewController
 */
-(instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCollectionView];
    [self addChildView];
    


}

-(void)addChildView
{
    UIImageView *guide = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide1"]];
    [self.collectionView addSubview:guide];
    guide.centetX = self.view.centetX;
    self.guide = guide;
    
    UIImageView *guideLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLine"]];
    [self.collectionView addSubview:guideLine];
    guideLine.x -= 170;
    
    UIImageView *guideLargeText = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    [self.collectionView addSubview:guideLargeText];
    guideLargeText.centetX = self.view.centetX;
    guideLargeText.centetY = self.view.height * 0.7;
    self.guideLargeText = guideLargeText;
    
    UIImageView *guideSmallText = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    [self.collectionView addSubview:guideSmallText];
    guideSmallText.centetX = self.view.centetX;
    guideSmallText.centetY = self.view.height * 0.8;
    self.guideSmallText = guideSmallText;
}


-(void)setupCollectionView
{
    self.collectionView.backgroundColor = [UIColor yellowColor];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[XRGuideViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XRGuideViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSString *guideBack = [NSString stringWithFormat:@"guide%ldBackground568h",indexPath.item+1];
    cell.image = [UIImage imageNamed:guideBack];
    cell.page = indexPath.item + 1;

    return cell;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat currentOffsetX = scrollView.contentOffset.x;
    
    CGFloat deltaX = currentOffsetX - self.lastOffsetX;
    
    self.guide.x += 2*deltaX;
    self.guideSmallText.x += 2*deltaX;
    self.guideLargeText.x += 2*deltaX;
    
    //更换图片
    NSInteger page = currentOffsetX / [UIScreen mainScreen].bounds.size.width + 1;
    self.guide.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%zd",page]];
    self.guideLargeText.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%zd",page]];
    self.guideSmallText.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%zd",page]];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.guide.x -= deltaX;
        self.guideSmallText.x -= deltaX;
        self.guideLargeText.x -= deltaX;
    }];
    
    self.lastOffsetX = currentOffsetX;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
