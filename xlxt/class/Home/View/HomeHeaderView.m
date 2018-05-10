//
//  HomeHeaderView.m
//  xlxt
//
//  Created by xlky on 2018/3/30.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.

#import "HomeHeaderView.h"
#import "bannerModel.h"
#import "BannerButton.h"
#import "SGAdvertScrollView.h"
#import "advertmodel.h"
@interface HomeHeaderView ()<SGAdvertScrollViewDelegate>
{
    CGFloat totalHeight;
}

@property (nonatomic,strong)SGAdvertScrollView *advertScrollView;
@end
@implementation HomeHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        //设置背景颜色
        self.backgroundColor = COLORA(246,249,250, 1);
        
        //添加banner
        [self addSubview:self.bannerView];
    
        [self.bannerView imageViewClick:^(SQBannarView * _Nonnull barnerview, NSInteger index) {
          
            
            [self.delegate BannerClick:index];
            
        }];
        
        //添加banner下方按钮
        [self addBannerButton];
        
        //添加新闻滚动条
        [self Adadvertscrollview];
        
        //添加正式分区头
        [self addHeaderofsection];
        
         
    }
    return self;
}


-(void)addBannerButton{
    float w = kScreenW/6;
    float h = 70;
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"smallinfo" ofType:@"plist"];
    NSArray * rooms = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    //添加横滚条下方的按钮
    int i = 0;
    
    for (NSDictionary *dic in rooms) {
        
        BannerButton *btn1 = [[BannerButton alloc]initWithFrame:CGRectMake(i%6*w, i/6*h+2+kScreenW*4.7/10, w, h)];
        btn1.tag = i;
        
        btn1.dic = dic;
        
        [btn1 addTarget:self action:@selector(Btnaction0:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn1];
        i++;
        
    }
    totalHeight +=h*2;
    UIView *space = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenW*4.7/10+142, kScreenW, 14)];
    space.backgroundColor = WhiteColor;
    [self addSubview:space];
}


-(void)Adadvertscrollview
{
  //  NSArray *TitleArr = @[@{@"Title":@"杏林学堂新闻1"},@{@"Title":@"杏林学堂直播"},@{@"Title":@"杏林学堂消息"}];
    
    UIView *adverview = [[UIView alloc]initWithFrame:CGRectMake(0, 2*70+kScreenW*4.7/10+30, kScreenW, 40)];
    adverview.backgroundColor = WhiteColor;
    [self addSubview:adverview];

    UIImageView *newsIV = [[UIImageView alloc]initWithFrame:CGRectMake(12, 10, 24, 24)];
    newsIV.image = [UIImage imageNamed:@"xlnews"];
    [adverview addSubview:newsIV];
    
    UIView *lineview = [[UIView alloc]initWithFrame:CGRectMake(46, 10, 1, 24)];
    lineview.backgroundColor = MainGrayColor;
     [adverview addSubview:lineview];
    
    
    self.advertScrollView = [[SGAdvertScrollView alloc] init];
    self.advertScrollView.titles = @[@"杏林学堂新闻1", @"杏林学堂直播", @"杏林学堂消息"];
    self.advertScrollView.delegate = self;
    self.advertScrollView.frame = CGRectMake(56, 10, kScreenW-70, 24);
    [adverview addSubview:self.advertScrollView];
    totalHeight +=adverview.height+24;
}

-(void)addHeaderofsection
{
    UIView *lineview = [[UIView alloc]initWithFrame:CGRectMake(12, totalHeight+12, 4, 20)];
    lineview.backgroundColor = COLOR(103, 173, 72);
    [self addSubview:lineview];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(27, totalHeight+12, 120, 18)];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.backgroundColor = ClearColor;
    titleLabel.text =@"推荐课程";
    [self addSubview:titleLabel];
    
    UIButton *morebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    morebtn.frame = CGRectMake(kScreenW-60, totalHeight+15, 56, 13);
    morebtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [morebtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [morebtn setTitle:@"更多>" forState: UIControlStateNormal];
    [morebtn addTarget:self action:@selector(Btnaction0:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:morebtn];
    
}
-(void)Btnaction0:(BannerButton *)btn1
{
   
    [self.delegate ImageBtnClick:btn1.tag];
}
-(SQBannarView *)bannerView
{
    if (!_bannerView) {
        _bannerView = [[SQBannarView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW*4.7/10) viewSize:CGSizeMake(kScreenW, kScreenW*4.7/10)];
        
        totalHeight +=_bannerView.height;
        NSMutableArray *imageViews = @[].mutableCopy;
        for (NSInteger i=0; i<4; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"adv%ld.png",i+1]];
            [imageViews addObject:image];
        }
        
        _bannerView.items = imageViews;
        
    }
    return _bannerView;
}

- (void)advertScrollView:(SGAdvertScrollView *)advertScrollView didSelectedItemAtIndex:(NSInteger)index {
  
    [self.delegate AdverViewClick:index];
}

-(void)setBannerArray:(NSArray *)BannerArray
{
    _BannerArray = BannerArray;
    NSMutableArray *imageViews = [NSMutableArray array];
    for (NSInteger i=0; i<4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"adv%ld.png",i+1]];
        [imageViews addObject:image];
    }
    
    for (bannerModel *banner in _BannerArray) {
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:ImgUrl(banner.ImgUrl)]]];
        [imageViews addObject:image];
    }
    self.bannerView.items = imageViews;
    [self.bannerView.myCollectionView reloadData];
    
}
-(void)setAdverArray:(NSArray *)AdverArray
{
    _AdverArray = AdverArray;
    NSMutableArray *marr = [NSMutableArray array];
    for (advertmodel *advert in _AdverArray) {
        NSString *titlestr =advert.Title;
        [marr addObject:titlestr];
    }
    self.advertScrollView.titles = marr.copy;
    
}
- (void)updateFocusIfNeeded {
    
}

@end
