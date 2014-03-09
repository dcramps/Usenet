//
//  UABaseViewController.h
//  UsenetApp
//
//  Created by DEVFLOATER38-XL on 2014-03-08.
//  Copyright (c) 2014 dc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UABaseViewController : UIViewController

@property (nonatomic, strong) UIView *snapshotContainerView;
@property (nonatomic, strong) UIImageView *blurredSnapshotView;
@property (nonatomic, assign) CGFloat scale;
@property (nonatomic, strong) UIWindow *keyWindow;

- (void)getSnapshots;

@end
