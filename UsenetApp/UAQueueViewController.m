//
//  UAQueueViewController.m
//  UsenetApp
//
//  Created by DEVFLOATER38-XL on 2014-03-08.
//  Copyright (c) 2014 dc. All rights reserved.
//

#import "UAQueueViewController.h"
#import "UAQueueCollectionViewCell.h"
#import <LXReorderableCollectionViewFlowLayout/LXReorderableCollectionViewFlowLayout.h>
#import "UAUnblurSegue.h"

@interface UAQueueViewController () <UICollectionViewDataSource, UICollectionViewDelegate, LXReorderableCollectionViewDataSource, LXReorderableCollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation UAQueueViewController

static NSString *cellIdentifier = @"QueueCellIdentifier";

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
    self.data = [@[[NSObject new], [NSObject new], [NSObject new], [NSObject new], [NSObject new]] mutableCopy];
    LXReorderableCollectionViewFlowLayout *layout = (LXReorderableCollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.minimumLineSpacing = 20.0f;
    layout.itemSize = CGSizeMake(280.0f, 95.0f);
    layout.sectionInset = UIEdgeInsetsMake(20.0f, 0.0f, 20.0f, 0.0f);
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.collectionView.collectionViewLayout invalidateLayout];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
#pragma mark - UICollectionView
    
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UAQueueCollectionViewCell *cell = (UAQueueCollectionViewCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    return cell;
}
    
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark - Draggable UICollectionView
- (void)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)fromIndexPath willMoveToIndexPath:(NSIndexPath *)toIndexPath {
    id object = [self.data objectAtIndex:fromIndexPath.item];
    [self.data removeObjectAtIndex:fromIndexPath.item];
    [self.data insertObject:object atIndex:toIndexPath.item];
}


#pragma mark - Segue
- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier
{
    UAUnblurSegue *segue = [[UAUnblurSegue alloc] initWithIdentifier:identifier source:fromViewController destination:toViewController];
    return segue;
}

- (IBAction)returnToQueue:(UIStoryboardSegue *)segue {}

@end
