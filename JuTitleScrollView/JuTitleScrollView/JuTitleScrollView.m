//
//  JuTitleScrollView.m
//  JuTitleScrollView
//
//  Created by 鞠凝玮 on 16/3/9.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "JuTitleScrollView.h"

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
static CGFloat const buttonWidth = 70;

@interface JuTitleScrollView ()<UIScrollViewDelegate>
@property (nonatomic, strong)UIScrollView *scrollView;
@end

@implementation JuTitleScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        self.userInteractionEnabled = YES;
        self.scrollView = [[UIScrollView alloc]initWithFrame:frame];
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.userInteractionEnabled = YES;

        self.scrollView.backgroundColor = [UIColor greenColor];
        self.scrollView.delegate = self;
        [self addSubview:self.scrollView];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray{
    if (self = [super initWithFrame:frame]){
        self.userInteractionEnabled = YES;

        _titleArray = titleArray;
        
        self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        self.scrollView.showsHorizontalScrollIndicator = NO;

        self.scrollView.userInteractionEnabled = YES;
        self.scrollView.backgroundColor = [UIColor greenColor];
        self.scrollView.delegate = self;
        self.scrollView.contentSize = CGSizeMake(self.titleArray.count*buttonWidth, 0);
        [self addSubview:self.scrollView];
        
        [self setupLabel];

    }
    return self;
}

-(void)setTitleArray:(NSArray *)titleArray{
    _titleArray = titleArray;
    for (UIView *view in self.scrollView.subviews){
        [view removeFromSuperview];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.titleArray.count*buttonWidth, 0);

    [self setupLabel];
}

- (void)setupLabel{
    for (int i=0;i<self.titleArray.count;i++){
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(i*buttonWidth, 0, buttonWidth, CGRectGetHeight(self.frame))];
        [button setTitle:self.titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 10+i;
        button.backgroundColor = [UIColor yellowColor];
        [self.scrollView addSubview:button];
    }
}

#pragma mark -- UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

}                                           // any offset changes
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

}     // called when scroll view grinds to a halt

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{

} // called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating

- (void)clickButton:(UIButton *)sender{

    [self.delegate juTitleScrollViewSelected:sender.tag];
    
    CGFloat offsetX = sender.center.x - ScreenWidth/2;
    if (offsetX < 0){
        offsetX = 0;
    }
    
    CGFloat maxOffset = self.scrollView.contentSize.width - CGRectGetWidth(self.scrollView.frame);
    if (offsetX > maxOffset){
        offsetX = maxOffset;
    }
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
    for (int i=0;i<self.titleArray.count;i++){
        UIButton *button = (UIButton *)[self.scrollView viewWithTag:10+i];
        if (button.tag != sender.tag){
            button.selected = NO;
            [UIView animateWithDuration:0.1 animations:^{
                button.transform = CGAffineTransformMakeScale(1, 1);

            }];

        }else{
            button.selected = YES;
            [UIView animateWithDuration:0.1 animations:^{
                button.transform = CGAffineTransformMakeScale(1.2, 1.2);
                
            }];

        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
