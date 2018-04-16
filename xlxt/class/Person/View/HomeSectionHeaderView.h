//
//  HomeSectionHeaderView.h
//  游戏直播
//
//  Created by tarena on 16/9/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^pop)();
@interface HomeSectionHeaderView : UICollectionReusableView<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *HeadIV;
@property (weak, nonatomic) IBOutlet UILabel *NameLb;
@property (weak, nonatomic) IBOutlet UILabel *ScoreLb;
@property(nonatomic, copy)pop block;
@property(nonatomic)NSNotification *notification;
@property (nonatomic)UIWebView *WV;
@end
