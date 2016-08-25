//
//  AddCollectionViewController.m
//  Forget-Me-Not
//
//  Created by Ленар on 20.08.16.
//  Copyright © 2016 LeNComp. All rights reserved.
//

#import "AddCollectionViewController.h"
#import "ChangeTableViewController.h"


@interface AddCollectionViewController () {
    
    NSArray *newForgets;
}

@end

@implementation AddCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    newForgets = @[@"Свет",@"Вода",@"Газ",@"Кондиционер",@"Телевизор",@"Компьютер",@"Кошелек",@"Ключи",@"Телефон",@"Документы",@"Окно",@"Дверь",@"Утюг",@"Корм",@"Вещи",@"Другое"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return newForgets.count;
}

#pragma mark <UICollectionViewDataSource>

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    UIImageView *addImage = (UIImageView *)[cell viewWithTag:100];
    UILabel *addLabel = (UILabel *)[cell viewWithTag:101];
    addImage.image = [UIImage imageNamed:[newForgets objectAtIndex:indexPath.item]];
    addLabel.text = [newForgets objectAtIndex:indexPath.item];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] lastObject];
    ChangeTableViewController *vc = [segue destinationViewController];
    vc.imageName = newForgets[indexPath.row];
    vc.thingName = newForgets[indexPath.row];
}

@end
