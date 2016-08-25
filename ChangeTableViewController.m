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
    NSLog(@"%@", _imageName);
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
        _thingName = _nameTextField.text;
        _def = [NSUserDefaults standardUserDefaults];
        NSMutableArray *arrName = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"name"]];
        NSMutableArray *arrImage = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"image"]];
        NSMutableArray *arrCheck = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults]objectForKey:@"check"]];
        [arrName addObject:_thingName];
        [arrImage addObject:_imageName];
        [arrCheck addObject:@"NO"];
        [_def setObject:arrImage forKey:@"image"];
        [_def setObject:arrName forKey:@"name"];
        [_def setObject:arrCheck forKey:@"check"];
        [self.navigationController popToRootViewControllerAnimated:YES];
//        if([_def objectForKey:@"image"]==nil){
//            _imageArr = [[NSMutableArray alloc]init];
//            _nameArr = [[NSMutableArray alloc]init];
//            [_imageArr addObject:_imageName];
//            [_nameArr addObject:_thingName];
//            [_def setObject:_nameArr forKey:@"name"];
//            [_def setObject:_imageArr forKey:@"image"];
//            [_def synchronize];
//            _nameArr = [_def objectForKey:@"name"];
//            NSLog(@"%@", _nameArr[0]);
//            NSLog(@"%@", _imageArr[0]);
//            [self.navigationController popToRootViewControllerAnimated:YES];
//            
//        }
//        else {
//            NSMutableArray *iamge = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"image"]];
//            //_imageArr = [NSMutableArray arrayWithArray:[_def objectForKey:@"image"]];
//            //_nameArr = [NSMutableArray arrayWithArray:[_def objectForKey:@"name"]];
//            //[_imageArr addObject:_imageName];
//            //[_nameArr addObject:_thingName];
//            //[_def setObject:_nameArr forKey:@"name"];
//            //[_def setObject:_imageArr forKey:@"image"];
//            //[_def synchronize];
//            NSLog(@"%@", iamge[0]);
//            //[self.navigationController popToRootViewControllerAnimated:YES];
//        }
        
//        AppDelegate *delegate = [UIApplication sharedApplication].delegate;
//        
//        [delegate.window setRootViewController:vc];
        
    }
    else{
        
    }
}

@end
