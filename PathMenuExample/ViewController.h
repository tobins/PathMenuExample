//
//  ViewController.h
//  PathMenuExample
//
//  Created by Tobin Schwaiger-Hastanan on 1/9/12.
//  Copyright (c) 2012 Tobin Schwaiger-Hastanan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ExpandableNavigation;

@interface ViewController : UIViewController {
    UIButton* button1;
    UIButton* button2;
    UIButton* button3;
    UIButton* button4;
    UIButton* button5;
    UIButton* main;
    ExpandableNavigation* navigation;
}

@property (nonatomic, retain) IBOutlet UIButton *button1;
@property (nonatomic, retain) IBOutlet UIButton *button2;
@property (nonatomic, retain) IBOutlet UIButton *button3;
@property (nonatomic, retain) IBOutlet UIButton *button4;
@property (nonatomic, retain) IBOutlet UIButton *button5;
@property (nonatomic, retain) IBOutlet UIButton *main;

@property (retain) ExpandableNavigation* navigation;

- (IBAction) touchMenuItem:(id)sender;

@end
