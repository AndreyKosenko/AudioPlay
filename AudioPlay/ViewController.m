//
//  ViewController.m
//  AudioPlay
//
//  Created by dev on 1/1/16.
//  Copyright © 2016 dev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
-(void)loadSite:(NSString*) url;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [_spinner setCenter:CGPointMake(400/2.0, 600/2.0)]; // I do this because I'm in landscape mode
    [self.view addSubview:_spinner]; // spinner is not visible until started
    [_spinner startAnimating];
    
    // Do any additional setup after loading the view, typically from a nib.
    NSString *url = @"https://www.facebook.com/";
    [self loadSite: url];
    
    //NSString *url = @"https://www.twitter.com/";
    
    self.webview.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [_spinner stopAnimating];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    
}

-(void)loadSite:(NSString *)url{
    NSURL *myURL = [NSURL URLWithString: [url stringByAddingPercentEscapesUsingEncoding:
                                          NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    [self.webview loadRequest:request];
}
@end
