//
//  SettingTableViewController.h
//  Forget-Me-Not
//
//  Created by Ленар on 23.08.16.
//  Copyright © 2016 LeNComp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UISwitch *notificationSwitch;
@property (weak, nonatomic) IBOutlet UIDatePicker *notificationTimePicker;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end
