//
//  UABlurSegue.m
//  UsenetApp
//
//  Created by DEVFLOATER38-XL on 2014-03-08.
//  Copyright (c) 2014 dc. All rights reserved.
//

#import "UABlurSegue.h"
#import "UIView+Snapshot.h"
#import "UAQueueItemViewController.h"
#import "UABaseViewController.h"

@implementation UABlurSegue

- (void)perform
{
    UABaseViewController *source = (UABaseViewController *)self.sourceViewController;
    UIViewController *destination = self.destinationViewController;
    
    [source getSnapshots];
    
    if (source.navigationController) {
        [source.navigationController.view addSubview:source.snapshotContainerView];
        [source.navigationController.view addSubview:source.blurredSnapshotView];
    } else {
        [source.view addSubview:source.snapshotContainerView];
        [source.view addSubview:source.blurredSnapshotView];
    }
    
    [UIView animateWithDuration:0.5f animations:^{
        source.blurredSnapshotView.transform   = CGAffineTransformScale(CGAffineTransformIdentity, source.scale, source.scale);
        source.snapshotContainerView.transform = CGAffineTransformScale(CGAffineTransformIdentity, source.scale, source.scale);
        source.blurredSnapshotView.alpha = 1.0f;
    } completion:^(BOOL finished) {
        UIImage *unscaledBlurredSnapshot = [source.keyWindow snapshotWithBlur:NO];
        UIColor *background = [[UIColor alloc] initWithPatternImage:unscaledBlurredSnapshot];
        destination.view.backgroundColor = background;
        [source presentViewController:destination animated:NO completion:nil];
    }];
}

@end
