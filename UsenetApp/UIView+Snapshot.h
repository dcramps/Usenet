//
//  UIView+BlurredView.h
//  UsenetApp
//
//  Created by DEVFLOATER38-XL on 2014-03-08.
//  Copyright (c) 2014 dc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Snapshot)
- (UIImage *)snapshotWithBlur:(BOOL)blur;
@end
