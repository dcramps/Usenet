//
//  UIView+BlurredView.m
//  UsenetApp
//
//  Created by DEVFLOATER38-XL on 2014-03-08.
//  Copyright (c) 2014 dc. All rights reserved.
//

#import "UIView+Snapshot.h"
#import "UIImage+ImageEffects.h"

@implementation UIView (Snapshot)

- (UIImage *)snapshotWithBlur:(BOOL)blur
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();

    if (blur) {
        UIColor *tintColor = [UIColor colorWithWhite:0.11 alpha:0.73];
        snapshotImage = [snapshotImage applyBlurWithRadius:10.0f tintColor:tintColor saturationDeltaFactor:1.8 maskImage:nil];
    }
    
    UIGraphicsEndImageContext();
    
    return snapshotImage;
}



@end
