//
//  UAQueueItemViewController.m
//  UsenetApp
//
//  Created by DEVFLOATER38-XL on 2014-03-08.
//  Copyright (c) 2014 dc. All rights reserved.
//

#import "UAQueueItemViewController.h"
#import "UAQueueViewController.h"
#import "UAUnblurSegue.h"

@interface UAQueueItemViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@end

@implementation UAQueueItemViewController

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
    self.textLabel.alpha = 0.0f;
}

- (void)viewDidAppear:(BOOL)animated
{
    [UIView animateWithDuration:0.25f animations:^{
        self.textLabel.alpha = 1.0f;
    }];
}
- (IBAction)returnToQueue:(id)sender
{
    [UIView animateWithDuration:0.25f animations:^{
        self.textLabel.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self performSegueWithIdentifier:@"UnwindFromQueueItemSegue" sender:self];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
