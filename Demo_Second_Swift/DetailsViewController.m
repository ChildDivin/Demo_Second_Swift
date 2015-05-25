//
//  DetailsViewController.m
//  Demo_Second_Swift
//
//  Created by Tops on 16/02/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
{
    
}

@end

@implementation DetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    lblTitle.text=self.strTitle;
    lblDescription.text=self.strDescription;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}
-(IBAction)btnBackClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
