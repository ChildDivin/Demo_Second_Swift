//
//  DetailsViewController.h
//  Demo_Second_Swift
//
//  Created by Tops on 16/02/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController
{
    IBOutlet UILabel *lblTitle;
    IBOutlet UITextView *lblDescription;
    
}
@property (strong,nonatomic) NSString *strTitle;
@property (strong,nonatomic) NSString *strDescription;

-(IBAction)btnBackClick:(id)sender;
@end
