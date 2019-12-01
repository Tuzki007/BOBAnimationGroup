//
//  ViewController.m
//  BOBAnimationGroup
//
//  Created by 张兴程 on 2019/9/26.
//  Copyright © 2019 张兴程. All rights reserved.
//

#import "ViewController.h"
#import "BOBBallChangeTrangle.h"
#import "BOBLoadingNieDiamondView.h"
#import "BOBLoadingThreeBallView.h"
#import "BOBLoadingFiveBallMove.h"
#import "BOBLoadingEightArcView.h"
#import "BOBLoadingSixOneView.h"
#import "BOBThreeBallLoading1.h"
#import "BOBSevenBallLoading2.h"
#import "BOBLoadingGroupSub3.h"
#import "BOBLoadingGroupStarSub4.h"
//#import "BOBLoadingGroupWaterSub5.h"
#import "BOBLightBlueLoading1.h"
#import "BOBLightBlueLoading2.h"
#import "BOBLightBlueLoading3.h"
#import "BOBLightBlueLoading4.h"
#import "BOBLightBlueLoading5.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI
{
    //废弃
//    BOBBallChangeTrangle *bob = [[BOBBallChangeTrangle alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    [self.view addSubview:bob];
    
//    BOBLoadingNieDiamondView *loadingNieDiamondView = [[BOBLoadingNieDiamondView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    [self.view addSubview:loadingNieDiamondView];
    
//    BOBLoadingThreeBallView *loadingThreeBallView = [[BOBLoadingThreeBallView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    [self.view addSubview:loadingThreeBallView];
    
//    BOBLoadingFiveBallMove *fiveBallMove = [[BOBLoadingFiveBallMove alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    [self.view addSubview:fiveBallMove];
    
//    BOBLoadingEightArcView *eightArcView = [[BOBLoadingEightArcView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    [self.view addSubview:eightArcView];
    
//    BOBLoadingSixOneView *sixOneView = [[BOBLoadingSixOneView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    [self.view addSubview:sixOneView];
    
//    BOBThreeBallLoading1 *threeBallLoading1 = [[BOBThreeBallLoading1 alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//    [self.view addSubview:threeBallLoading1];
    
//    BOBSevenBallLoading2 *sevenBallLoading2 = [[BOBSevenBallLoading2 alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//    [self.view addSubview:sevenBallLoading2];
    
//    BOBLoadingGroupSub3 *loadingGroupSub3 = [[BOBLoadingGroupSub3 alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//    [self.view addSubview:loadingGroupSub3];

//    BOBLoadingGroupStarSub4 *loadingGroupStarSub4 = [[BOBLoadingGroupStarSub4 alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//    [self.view addSubview:loadingGroupStarSub4];
    
    //待更改
//    BOBLoadingGroupWaterSub5 *loadingGroupWaterSub5 = [[BOBLoadingGroupWaterSub5 alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//    [self.view addSubview:loadingGroupWaterSub5];
    
//    BOBLightBlueLoading1 *lightBlueLoading1 = [[BOBLightBlueLoading1 alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//    [self.view addSubview:lightBlueLoading1];
    
//    BOBLightBlueLoading2 *lightBlueLoading2 = [[BOBLightBlueLoading2 alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//    [self.view addSubview:lightBlueLoading2];
    
//    BOBLightBlueLoading3 *lightBlueLoading3 = [[BOBLightBlueLoading3 alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//    [self.view addSubview:lightBlueLoading3];
    
//    BOBLightBlueLoading4 *lightBlueLoading4 = [[BOBLightBlueLoading4 alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//    [self.view addSubview:lightBlueLoading4];
    
    BOBLightBlueLoading5 *lightBlueLoading5 = [[BOBLightBlueLoading5 alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview:lightBlueLoading5];

}


@end
