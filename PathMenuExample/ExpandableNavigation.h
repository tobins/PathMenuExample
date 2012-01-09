//
//  ExpandableNavigation.h
//  PathMenuExample
//
//  Created by Tobin Schwaiger-Hastanan on 1/8/12.
//  Copyright (c) 2012 Tobin Schwaiger-Hastanan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExpandableNavigation : NSObject {
    UIButton* _mainButton;
    NSArray* _menuItems;
    CGFloat _radius;
    CGFloat speed;
    CGFloat bounce;
    CGFloat bounceSpeed;    
    BOOL expanded;
    BOOL transition;
}

@property (retain) UIButton* mainButton;
@property (retain) NSArray* menuItems;
@property CGFloat radius;
@property CGFloat speed;
@property CGFloat bounce;
@property CGFloat bounceSpeed;
@property (readonly) BOOL expanded;
@property (readonly) BOOL transition;

- (id)initWithMenuItems:(NSArray*) menuItems
             mainButton:(UIButton*) mainButton
                 radius:(CGFloat) radius;
- (id)init;

- (void) expand;
- (void) collapse;

@end
