
//
//  UABaseViewController.m
//  UsenetApp
//
//  Created by DEVFLOATER38-XL on 2014-03-08.
//  Copyright (c) 2014 dc. All rights reserved.
//

#import "UABaseViewController.h"
#import "UIView+Snapshot.h"

@interface UABaseViewController ()

@end

@implementation UABaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getSnapshots {
    self.keyWindow = [UIApplication sharedApplication].keyWindow;
    self.scale = 0.9f;
    
    CGRect frame = CGRectMake(0, 0, CGRectGetWidth(self.keyWindow.frame) * (1.0f / self.scale), CGRectGetHeight(self.keyWindow.frame) * (1.0f / self.scale));
	self.snapshotContainerView = [[UIView alloc] initWithFrame:CGRectIntegral(frame)];
	self.snapshotContainerView.backgroundColor = [UIColor blackColor];
    
    UIImage *unblurredImage = [self.keyWindow snapshotWithBlur:NO];
	UIImageView *unblurredImageView = [[UIImageView alloc] initWithImage:unblurredImage];
	unblurredImageView.center = self.snapshotContainerView.center;
	[self.snapshotContainerView addSubview:unblurredImageView];
	self.snapshotContainerView.center = self.keyWindow.center;
    
    UIImage *blurredSnapshot = [self.snapshotContainerView snapshotWithBlur:YES];
    self.blurredSnapshotView = [[UIImageView alloc] initWithImage:blurredSnapshot];
    self.blurredSnapshotView.center = self.snapshotContainerView.center;
    self.blurredSnapshotView.alpha = 0.0f;
    self.blurredSnapshotView.userInteractionEnabled = NO;
}

@end
