//
//  ViewController.m
//  PathMenuExample
//
//  Created by Tobin Schwaiger-Hastanan on 1/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "MenuBurst.h"

@implementation ViewController

@synthesize button1;
@synthesize button2;
@synthesize button3;
@synthesize button4;
@synthesize button5;
@synthesize main;
@synthesize menuBurst;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // initialize MenuBurst object with an array of buttons.
    NSArray* buttons = [NSArray arrayWithObjects:button1, button2, button3, button4, button5, nil];
    
    self.menuBurst = [[[MenuBurst alloc] initWithMenuItems:buttons mainButton:self.main radius:120.0] autorelease];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.button1 = nil;
    self.button2 = nil;
    self.button3 = nil;
    self.button4 = nil;
    self.button5 = nil;
    self.main = nil;    
    self.menuBurst = nil;
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Only support portriat orientation for now
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction) touchMenuItem:(id)sender {
    
    // if the menu is expanded, then collapse it when an menu item is touched.
    UIAlertView *message = [[[UIAlertView alloc] initWithTitle:@"Menu Item Touched"
                                                      message:[(UIButton *)sender currentTitle]
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil] autorelease];
    [message show];
    
    if( self.menuBurst.expanded ) {
        [self.menuBurst collapse];
    }
}
@end
