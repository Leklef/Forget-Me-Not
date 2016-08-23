//
//  SettingTableViewController.m
//  Forget-Me-Not
//
//  Created by Ленар on 23.08.16.
//  Copyright © 2016 LeNComp. All rights reserved.
//

#import "SettingTableViewController.h"

@interface SettingTableViewController ()

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *switchOn = [NSUserDefaults standardUserDefaults];
    if ([switchOn boolForKey:@"notificationSwitch"]==true){
        [_notificationSwitch setOn:YES];
    }
    else {
        [_notificationSwitch setOn:NO];
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (IBAction)notificationSwitch:(id)sender {
    if (_notificationSwitch.isOn){
        _saveButton.tintColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
        NSUserDefaults *switchOn = [NSUserDefaults standardUserDefaults];
        BOOL iSwitch = _notificationSwitch.isOn;
        [switchOn setBool:iSwitch forKey:@"notificationSwitch"];
        [switchOn synchronize];
    }
    else {
        _saveButton.tintColor = [UIColor grayColor];
        NSUserDefaults *switchOn = [NSUserDefaults standardUserDefaults];
        BOOL iSwitch = _notificationSwitch.isOn;
        [switchOn setBool:iSwitch forKey:@"notificationSwitch"];
        [switchOn synchronize];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (IBAction)saveButton:(id)sender {
    if(_notificationSwitch.isOn){
        [self.navigationController popToRootViewControllerAnimated:true];
    }
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
