//
//  ViewController.m
//  Orgasmometer
//
//  Created by Pavel on 26.03.15.
//  Copyright (c) 2015 Zitech Mobile LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *originalImage = [UIImage imageNamed:@"background.png"];
    CGSize destinationSize = CGSizeMake(375, 667);
    UIGraphicsBeginImageContext(destinationSize);
    [originalImage drawInRect:CGRectMake(0,0,destinationSize.width,destinationSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *New = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    New.image = newImage;
    [self.mainView addSubview:New];
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
