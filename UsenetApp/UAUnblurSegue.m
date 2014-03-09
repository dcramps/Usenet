//
//  UAUnblurSegue.m
//  UsenetApp
//
//  Created by DEVFLOATER38-XL on 2014-03-08.
//  Copyright (c) 2014 dc. All rights reserved.
//

#import "UAUnblurSegue.h"
#import "UABaseViewController.h"
#import "UAQueueItemViewController.h"
#import "UIView+Snapshot.h"

@implementation UAUnblurSegue

- (void)perform
{
    UABaseViewController *destination =  (UABaseViewController *)self.destinationViewController;
    
    [destination dismissViewControllerAnimated:NO completion:nil];
    
    [UIView animateWithDuration:0.5f animations:^{
        destination.blurredSnapshotView.transform   = CGAffineTransformScale(CGAffineTransformIdentity, 1.0f, 1.0f);
        destination.snapshotContainerView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0f, 1.0f);
        destination.blurredSnapshotView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [destination.blurredSnapshotView removeFromSuperview];
        [destination.snapshotContainerView removeFromSuperview];
    }];
}

@end
