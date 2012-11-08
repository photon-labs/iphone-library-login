//
//  Phresco.h
//  Phresco
//
//  Created by Sathiyasuresh on 08/11/12.
//  Copyright (c) 2012 Sathiyasuresh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol Phresco <NSObject>

@end

@interface Phresco : UIView<UITextFieldDelegate>
{
    UITextField *emailAddress;
    UITextField *password;
    __weak id delegate;
}

@property (nonatomic, strong) UITextField *emailAddress;
@property (nonatomic, strong) UITextField *password;
@property (weak) id delegate;

-(void) setLoginBackgroundImage:(UIImage*) bgImage;
-(void) setNavigationBar:(BOOL)backNeeded NAVBARIMAGE:(UIImage*)navBarImage BACKIMAGE:(UIImage*)backImage;
-(void) setBackgroundImage:(UIImage*)bgImage;
-(void) createLoginButton:(UIImage*) loginImage;
-(void) createCancelButton:(UIImage*) cancelImage;
-(void) createRegisterButton:(UIImage*) registerImage;
@end
