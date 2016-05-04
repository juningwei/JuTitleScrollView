//
//  JuTitleScrollView.h
//  JuTitleScrollView
//
//  Created by 鞠凝玮 on 16/3/9.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JuTitleScrollViewDelegate <NSObject>

@required
- (void)juTitleScrollViewSelected:(NSInteger)index;

@end

@interface JuTitleScrollView : UIView
@property (nonatomic, weak)id<JuTitleScrollViewDelegate>delegate;

@property (nonatomic, copy)NSArray *titleArray;

-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray;

@end
