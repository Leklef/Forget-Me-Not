//
//  SettingTableViewController.m
//  Forget-Me-Not
//
//  Created by Ленар on 23.08.16.
//  Copyright © 2016 LeNComp. All rights reserved.
//

#import "SettingTableViewController.h"

@interface SettingTableViewController () {
    NSUserDefaults *defaults;
}

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    defaults = [NSUserDefaults standardUserDefaults];
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    
    if ([defaults boolForKey:@"notificationSwitch"]==true){
        [_notificationSwitch setOn:YES];
        _saveButton.tintColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
    }
    else {
        [_notificationSwitch setOn:NO];
        _saveButton.tintColor = [UIColor grayColor];
    }
}

- (IBAction)notificationSwitch:(id)sender {
    if (_notificationSwitch.isOn){
        _saveButton.tintColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
        BOOL iSwitch = _notificationSwitch.isOn;
        [defaults setBool:iSwitch forKey:@"notificationSwitch"];
        [defaults synchronize];
        
    }
    else {
        _saveButton.tintColor = [UIColor grayColor];
        NSUserDefaults *switchOn = [NSUserDefaults standardUserDefaults];
        BOOL iSwitch = _notificationSwitch.isOn;
        [switchOn setBool:iSwitch forKey:@"notificationSwitch"];
        [switchOn synchronize];
        [defaults setBool:NO forKey:@"notificationIsActive"];
        [defaults synchronize];
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (IBAction)saveButton:(id)sender {
    if(_notificationSwitch.isOn){
        UILocalNotification* localNotification = [[UILocalNotification alloc] init];
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        [defaults setBool:YES forKey:@"notificationIsActive"];
        [defaults synchronize];
        NSDate *pickerDate = [_notificationTimePicker date];
        localNotification.fireDate = pickerDate;
        localNotification.alertBody = @"Подготовься к уходу";
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:self];
        [self dismissViewControllerAnimated:YES completion:nil];
        [self.navigationController popToRootViewControllerAnimated:true];
    }
    else {
        [defaults setBool:NO forKey:@"notificationIsActive"];
        [defaults synchronize];
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
    }
}

@end
