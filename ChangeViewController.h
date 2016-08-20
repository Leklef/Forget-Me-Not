//
//  ChangeViewController.h
//  Forget-Me-Not
//
//  Created by Ленар on 20.08.16.
//  Copyright © 2016 LeNComp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UISwitch *everydaySwitch;
@property (weak, nonatomic) IBOutlet UITextField *noteTextField;
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *thingName;

@end
