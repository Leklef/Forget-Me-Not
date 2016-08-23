//
//  ChangeTableViewController.h
//  Forget-Me-Not
//
//  Created by Ленар on 22.08.16.
//  Copyright © 2016 LeNComp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangeTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *thingName;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UITextView *noteTextView;

@end
