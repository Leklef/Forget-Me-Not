//
//  ViewControllerWithTable.m
//  Forget-Me-Not
//
//  Created by Ленар on 22.08.16.
//  Copyright © 2016 LeNComp. All rights reserved.
//

#import "ViewControllerWithTable.h"
#import "MCSwipeTableViewCell.h"

@interface ViewControllerWithTable () <UITableViewDelegate, UITableViewDataSource, MCSwipeTableViewCellDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) MCSwipeTableViewCell *cellToDelete;

@end

@implementation ViewControllerWithTable

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated{
    _def = [NSUserDefaults standardUserDefaults];
    _imageArray = [NSMutableArray arrayWithArray:[_def objectForKey:@"image"]];
    _nameArray = [NSMutableArray arrayWithArray:[_def objectForKey:@"name"]];
    _checkArray = [NSMutableArray arrayWithArray:[_def objectForKey:@"check"]];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 66;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { //количество ячеек
    return _nameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    MCSwipeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[MCSwipeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            cell.separatorInset = UIEdgeInsetsZero;
        }
    
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
    
}

- (void)configureCell:(MCSwipeTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIView *checkView = [self viewWithImageName:@"check"];
    UIColor *greenColor = [UIColor colorWithRed:85.0 / 255.0 green:213.0 / 255.0 blue:80.0 / 255.0 alpha:1.0];

    UIView *crossView = [self viewWithImageName:@"cross"];
    UIColor *redColor = [UIColor colorWithRed:232.0 / 255.0 green:61.0 / 255.0 blue:14.0 / 255.0 alpha:1.0];
    
    [cell setDefaultColor:self.tableView.backgroundView.backgroundColor];
    
    [cell setDelegate:self];
    
    [cell.textLabel setText:_nameArray[indexPath.row]];
    [cell.imageView setImage:[UIImage imageNamed:_imageArray[indexPath.row]]];
    if([_checkArray[indexPath.row] isEqualToString:@"YES"]){
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:cell.textLabel.text];
        [attributeString addAttribute:NSStrikethroughStyleAttributeName
                                value:@2
                                range:NSMakeRange(0, [attributeString length])];
        cell.textLabel.attributedText = attributeString;
        cell.textLabel.textColor = [UIColor grayColor];
    }
    if ([_checkArray[indexPath.row] isEqualToString:@"NO"]){
        NSString *str = cell.textLabel.text;
        cell.textLabel.attributedText = nil;
        cell.textLabel.text = str;
        cell.textLabel.textColor = [UIColor blackColor];
    }
    cell.shouldAnimateIcons = YES;
    
    [cell setSwipeGestureWithView:checkView color:greenColor mode:MCSwipeTableViewCellModeSwitch state:MCSwipeTableViewCellState1 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
        if([_checkArray[indexPath.row] isEqualToString:@"NO"]){
            [_checkArray replaceObjectAtIndex:indexPath.row withObject:@"YES"];
            NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:cell.textLabel.text];
            [attributeString addAttribute:NSStrikethroughStyleAttributeName
                                    value:@2
                                    range:NSMakeRange(0, [attributeString length])];
            cell.textLabel.attributedText = attributeString;
            cell.textLabel.textColor = [UIColor grayColor];
            _def = [NSUserDefaults standardUserDefaults];
            [_def setObject:_checkArray forKey:@"check"];
            [_def synchronize];
        }
        else {
            if ([_checkArray[indexPath.row] isEqualToString:@"YES"]){
                [_checkArray replaceObjectAtIndex:indexPath.row withObject:@"NO"];
                cell.textLabel.textColor = [UIColor blackColor];
                _def = [NSUserDefaults standardUserDefaults];
                NSString *str = [NSString stringWithString:cell.textLabel.text];
                NSLog(@"%@",str);
                cell.textLabel.attributedText = nil;
                cell.textLabel.text = str;
                [_def setObject:_checkArray forKey:@"check"];
                [_def synchronize];
            }
        }
    }];

    [cell setSwipeGestureWithView:crossView color:redColor mode:MCSwipeTableViewCellModeExit state:MCSwipeTableViewCellState2 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
        [_nameArray removeObjectAtIndex:indexPath.row];
        [_imageArray removeObjectAtIndex:indexPath.row];
        [_checkArray removeObjectAtIndex:indexPath.row];
        _def = [NSUserDefaults standardUserDefaults];
        [_tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
        [_def setObject:_imageArray forKey:@"image"];
        [_def setObject:_nameArray forKey:@"name"];
        [_def setObject:_checkArray forKey:@"check"];
        [_def synchronize];
    }];
}

- (UIView *)viewWithImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeCenter;
    return imageView;
}

- (IBAction)reload:(id)sender {
    _def = [NSUserDefaults standardUserDefaults];
    NSMutableArray *arr =[NSMutableArray arrayWithArray:[_def objectForKey:@"check"]];
    for (int i = 0; i < arr.count; i++){
        [arr replaceObjectAtIndex:i withObject:@"NO"];
    }
    _checkArray = [NSMutableArray arrayWithArray:arr];
    [_def setObject:arr forKey:@"check"];
    [_def synchronize];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
}

@end
