//
//  ChangeTableViewController.m
//  Forget-Me-Not
//
//  Created by Ленар on 22.08.16.
//  Copyright © 2016 LeNComp. All rights reserved.
//

#import "ChangeTableViewController.h"
#import "ViewControllerWithTable.h"
#import "UITextView+Placeholder.h"
#import "ViewControllerWithTable.h"
#import "TableViewSingleTon.h"
#import "AppDelegate.h"

@interface ChangeTableViewController () <UITextFieldDelegate, UITextViewDelegate>

@end

@implementation ChangeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _noteTextView.placeholder = @"Заметка";
    
    _nameTextField.text = _thingName;
    
    _nameTextField.delegate = self;
    _noteTextView.delegate = self;
    
    [_nameTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidChange:(UITextField*)textField{
    if (_nameTextField.text.length > 0){
        _saveButton.tintColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
    }
    else{
        _saveButton.tintColor = [UIColor grayColor];
    }
}

- (IBAction)saveButton:(id)sender {
    if (_nameTextField.text.length != 0){
        [self.navigationController popToRootViewControllerAnimated:YES];
        
//        AppDelegate *delegate = [UIApplication sharedApplication].delegate;
//        
//        [delegate.window setRootViewController:vc];
        
    }
    else{
        
    }
}

@end
