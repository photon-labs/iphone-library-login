//
//  Login.m
//  Login
//
//  Created by SHIVAKUMAR_CH on 11/2/12.
//  Copyright (c) 2012 SHIVAKUMAR. All rights reserved.
//

#import "Login.h"
#import "LoginConstants.h"

@implementation Login
@synthesize emailAddress;
@synthesize password;
@synthesize delegate;

-(void) setLoginBackgroundImage:(UIImage*) bgImage
{
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    if(bgImage != nil)
    {
        [bgImageView setImage:bgImage];
    }
    else
    {
        UIImage *bgImage = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"home_screen_bg-72" ofType:@"png"]];
        [bgImageView setImage:bgImage];
    }
    [self addSubview:bgImageView];
}

-(void) setNavigationBar:(BOOL)backNeeded NAVBARIMAGE:(UIImage*)navBarImage BACKIMAGE:(UIImage*)backImage
{
    UIImageView *navBarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, NAVBARHEIGHT)];
    if(navBarImage != nil)
    {
        [navBarView setImage:navBarImage];
    }
    else
    {
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"header_logo-72" ofType:@"png"]];
        [navBarView setImage:image];
    }
    [self addSubview:navBarView];
    if(backNeeded)
    {
        UIButton *backButton = [[UIButton alloc] init];
        if(backImage != nil)
        {
            backButton.frame = CGRectMake(5, 5, backImage.size.width, backImage.size.height);
            [backButton setImage:backImage forState:UIControlStateNormal];
        }
        else
        {
            UIImage *image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"back_btn" ofType:@"png"]];
            backButton.frame = CGRectMake(5, 5, image.size.width, image.size.height);
            [backButton setImage:image forState:UIControlStateNormal];
        }
        [backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backButton];
    }
}

-(void) backButtonAction
{
    [self removeFromSuperview];
}

-(void) setBackgroundImage:(UIImage*)bgImage
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.tag = loginBgViewTag;
    if(nil != bgImage)
    {
        imageView.frame = CGRectMake(0, 2*NAVBARHEIGHT, SCREENWIDTH, bgImage.size.height);
    }
    else
    {
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"login_bg" ofType:@"png"]];
        imageView.frame = CGRectMake(0, 2*NAVBARHEIGHT, SCREENWIDTH, image.size.height);
        [imageView setImage:image];
    }
    [self addSubview:imageView];
    
    [self createTextFields];
}

-(void) createTextFields
{
    UIView *imageView = (UIView*)[self viewWithTag:loginBgViewTag];
    emailAddress = [[UITextField alloc] initWithFrame:CGRectMake(20, imageView.frame.origin.y + 60,270, 30)];
    emailAddress.delegate = self;
    emailAddress.tag = kemailAddress;
    emailAddress.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:emailAddress];
    
    password = [[UITextField alloc] initWithFrame:CGRectMake(emailAddress.frame.origin.x , emailAddress.frame.origin.y + 80, 270, 30)];
    password.delegate = self;
    password.tag = kpasswod;
    password.borderStyle = UITextBorderStyleRoundedRect;
    [password setSecureTextEntry:YES];
    [self addSubview:password];
    
    int x = emailAddress.frame.origin.x;
    int y = emailAddress.frame.origin.y - 30;
    int width = 90;
    int height = 30;
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"Email Address", @"Password", nil];
    for(int i=0;i<[array count];i++)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont fontWithName:@"Helvetica" size:12.0];
        [label setText:[array objectAtIndex:i]];
        
        [self addSubview:label];
        y = y + label.frame.size.height + 40;
    }
    
}

-(void) createLoginButton:(UIImage*) loginImage
{
    UIButton *button = [[UIButton alloc] init];
    button.tag = kloginButtonTag;
    if(nil != loginImage)
    {
        button.frame = CGRectMake(140, password.frame.origin.y + 40, loginImage.size.width, loginImage.size.height);
        [button setImage:loginImage forState:UIControlStateNormal];
    }
    else
    {
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"login_btn" ofType:@"png"]];
        button.frame = CGRectMake(140, password.frame.origin.y + 40, image.size.width, image.size.height);
        [button setImage:image forState:UIControlStateNormal];
    }
    [self addSubview:button];
}

-(void) createCancelButton:(UIImage*) cancelImage
{
    UIView *view = [self viewWithTag:kloginButtonTag];
    UIButton *button = [[UIButton alloc] init];
    if(nil != cancelImage)
    {
        button.frame = CGRectMake(view.frame.origin.x + view.frame.size.width + 10, password.frame.origin.y + 40, cancelImage.size.width, cancelImage.size.height);
        [button setImage:cancelImage forState:UIControlStateNormal];
    }
    else
    {
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cancel_btn" ofType:@"png"]];
        button.frame = CGRectMake(view.frame.origin.x + view.frame.size.width + 10, password.frame.origin.y + 40, image.size.width, image.size.height);
        [button setImage:image forState:UIControlStateNormal];
    }
    [self addSubview:button];
}

-(void) createRegisterButton:(UIImage*) registerImage
{
    UIButton *button = [[UIButton alloc] init];
    if(nil != registerImage)
    {
        button.frame = CGRectMake((SCREENWIDTH - registerImage.size.width)/2, (SCREENHEIGHT - registerImage.size.height - 10), registerImage.size.width, registerImage.size.height);
        [button setImage:registerImage forState:UIControlStateNormal];
    }
    else
    {
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"register_btn" ofType:@"png"]];
        button.frame = CGRectMake((SCREENWIDTH - image.size.width)/2, (SCREENHEIGHT - image.size.height - 10), image.size.width, image.size.height);
        [button setImage:image forState:UIControlStateNormal];
    }
    [self addSubview:button];

}

@end
