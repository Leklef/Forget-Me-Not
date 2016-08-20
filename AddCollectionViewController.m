//
//  AddCollectionViewController.m
//  Forget-Me-Not
//
//  Created by Ленар on 20.08.16.
//  Copyright © 2016 LeNComp. All rights reserved.
//

#import "AddCollectionViewController.h"
#import "ChangeViewController.h"


@interface AddCollectionViewController () {
    
    NSArray *newForgets;
}

@end

@implementation AddCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    newForgets = @[@"свет",@"вода",@"settings"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return newForgets.count;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    UIImageView *addImage = (UIImageView *)[cell viewWithTag:100];
    UILabel *addLabel = (UILabel *)[cell viewWithTag:101];
    addImage.image = [UIImage imageNamed:[newForgets objectAtIndex:indexPath.row]];
    addLabel.text = [newForgets objectAtIndex:indexPath.row];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"Зашел");
    NSIndexPath *indexPath = [self.collectionView indexPathForSelectedRow];
    ChangeViewController *vc = [segue destinationViewController];
    vc.imageName = [newForgets objectAtIndex:indexPath.row];
    vc.thingName = [newForgets objectAtIndex:indexPath.row];
}

@end
