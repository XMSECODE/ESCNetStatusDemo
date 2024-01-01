//
//  ViewController.m
//  ESCNetStatusDemo
//
//  Created by xiatian on 2024/1/1.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import <Foundation/Foundation.h>

@interface ViewController ()

@property(nonatomic,strong)WKWebView* webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    NSDictionary *headers = @{
        @"Cookie": @"BAIDUID=3521D068144C9EB1DFE673EFBE2BB059:FG=1; BIDUPSID=3521D068144C9EB148FD9E6CF0CC4FAE; H_PS_PSSID=39938_39999_40038; PSTM=1704079614; BD_NOT_HTTPS=1"
    };
    
    [request setAllHTTPHeaderFields:headers];
    
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
//            NSLog(@"%@", error);
            dispatch_semaphore_signal(sema);
        } else {
//            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
//            NSError *parseError = nil;
//            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
//            NSLog(@"%@",responseDictionary);
            dispatch_semaphore_signal(sema);
        }
    }];
    [dataTask resume];
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    
    
    
    
}


@end
