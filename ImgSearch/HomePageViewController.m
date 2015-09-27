//
//  HomePageViewController.m
//  ImgSearch
//
//  Created by Johnson Liu on 9/26/15.
//  Copyright (c) 2015 HomeOffice. All rights reserved.
//

#import "HomePageViewController.h"
#import "ImageLoader.h"


@interface HomePageViewController ()

@end


@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSString *urlLink = @"http://api.giphy.com/v1/gifs/trending?api_key=dc6zaTOxFJmzC";
    
    ImageLoader *loader = [ImageLoader new];
    [loader imagesFromLink:urlLink];
    
    
    //-- search link
    NSString *searchLink = @"http://api.giphy.com/v1/gifs/search?api_key=dc6zaTOxFJmzC&q=xxx";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
