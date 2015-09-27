//
//  ImageLoader.m
//  ImgSearch
//
//  Created by Johnson Liu on 9/26/15.
//  Copyright (c) 2015 HomeOffice. All rights reserved.
//

#import "ImageLoader.h"
#import <AFNetworking/AFNetworking.h>
#import "AFHTTPRequestOperation.h"

@implementation ImageLoader

- (void)imagesFromLink:(NSString *)urlLink {
    
    if (urlLink == nil || urlLink.length == 0)
        return;
    
    NSURL *url = [NSURL URLWithString:urlLink];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *data = (NSDictionary *)responseObject;
        [self printData:data];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [self printError:[error localizedDescription]];
    }];
    
    [operation start];
}

- (void)printData:(NSDictionary *)data {
    
    NSLog(@"data : %@", data);
}

- (void)printError:(NSString *)errorMsg {
    
    NSLog(@"error : %@", errorMsg);
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                        message:errorMsg
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
}


@end

