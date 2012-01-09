//
//  MenuBurst.m
//  PathMenuExample
//
//  Created by Tobin Schwaiger-Hastanan on 1/8/12.
//  Copyright (c) 2012 Tobin Schwaiger-Hastanan. All rights reserved.
//

#import "MenuBurst.h"

@implementation MenuBurst

@synthesize mainButton = _mainButton;
@synthesize menuItems = _menuItems;
@synthesize radius = _radius;
@synthesize speed;
@synthesize bounce;
@synthesize bounceSpeed;
@synthesize expanded;
@synthesize transition;


- (id)initWithMenuItems:(NSArray*) menuItems mainButton:(UIButton*) mainButton radius:(CGFloat) radius {

    if( self = [super init] ) {
        self.menuItems = menuItems;
        self.mainButton = mainButton;
        self.radius = radius;
        self.speed = 0.15;
        self.bounce = 0.225;
        self.bounceSpeed = 0.1;
        expanded = NO;
        transition = NO;
        
        if( self.mainButton != nil ) {
            for (UIView* view in self.menuItems) {

                view.center = self.mainButton.center;
            }
            
            [self.mainButton addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    return self;
}

- (id)init {
    return [self initWithMenuItems:nil mainButton:nil radius:32.0]; 
}

- (void) expand {
    transition = YES;
    
    [UIView animateWithDuration:self.speed animations:^{
        self.mainButton.transform = CGAffineTransformMakeRotation( 45.0 * 0.0174532925 );
    }];
    
    for (UIView* view in self.menuItems) {
        int index = [self.menuItems indexOfObject:view];
        CGFloat indexOverCount = ((CGFloat)index/(self.menuItems.count-1));
        CGFloat rad =(1.0 - indexOverCount) * 90.0 * 0.0174532925;
        CGAffineTransform rotation = CGAffineTransformMakeRotation( rad );
        CGFloat x = (self.radius + (self.bounce * self.radius)) * rotation.a;
        CGFloat y = (self.radius + (self.bounce * self.radius)) * rotation.c;
        CGPoint center = CGPointMake( view.center.x + x , view.center.y + y);
        [UIView animateWithDuration: self.speed
                              delay: (self.speed * indexOverCount)
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             view.center = center;
                         } 
                         completion:^(BOOL finished){
                             [UIView animateWithDuration:self.bounceSpeed
                                              animations:^{
                                                  CGFloat x = (self.bounce * self.radius) * rotation.a;
                                                  CGFloat y = (self.bounce * self.radius) * rotation.c;
                                                  CGPoint center = CGPointMake( view.center.x - x , view.center.y - y);
                                                  view.center = center;
                                              }];
                             if( view == self.menuItems.lastObject ) {
                                 expanded = YES;
                                 transition = NO;
                             }
                         }];                                                                        
    }
}

- (void) collapse {
    transition = YES;
    
    [UIView animateWithDuration:self.speed animations:^{
        self.mainButton.transform = CGAffineTransformMakeRotation( 0 );
    }];
    
    for (UIView* view in self.menuItems) {
        int index = [self.menuItems indexOfObject:view];
        CGFloat indexOverCount = ((CGFloat)index/(self.menuItems.count-1));
        [UIView animateWithDuration:self.speed
                              delay:(1.0 - indexOverCount) * self.speed
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             view.center = self.mainButton.center;
                         } 
                         completion:^(BOOL finished){                            
                             if( view == self.menuItems.lastObject ) {
                                 expanded = NO;
                                 transition = NO;
                             }
                         }];                                                                         
    }
}

- (IBAction)press:(id)sender {
    if( !self.transition ) {
        if( !self.expanded ) {
            [self expand];
        } else {
            [self collapse];
        }
    }
}

- (void)dealloc {
    self.mainButton = nil;
    self.menuItems = nil;
    [super dealloc];
}

@end
