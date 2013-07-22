//
//  SVModalWebViewController.m
//
//  Created by Oliver Letterer on 13.08.11.
//  Copyright 2011 Home. All rights reserved.
//
//  https://github.com/samvermette/SVWebViewController

#import "SVModalWebViewController.h"
#import "SVWebViewController.h"

@interface SVModalWebViewController ()

@property (nonatomic, strong) SVWebViewController *webViewController;

@end


@implementation SVModalWebViewController

@synthesize barsTintColor, availableActions, webViewController;

#pragma mark - Initialization


- (id)initWithAddress:(NSString*)urlString {
    return [self initWithURL:[NSURL URLWithString:urlString]];
}

- (id)initWithURL:(NSURL *)URL {
    SVWebViewController *webViewCtlr = [[SVWebViewController alloc] initWithURL:URL];
    self.webViewController = webViewCtlr;
    [webViewCtlr release];
    if (self = [super initWithRootViewController:self.webViewController]) {
        UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:webViewController action:@selector(doneButtonClicked:)];
        self.webViewController.navigationItem.leftBarButtonItem = leftBtnItem;
        [leftBtnItem release];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    
    self.webViewController.title = self.title;
    self.navigationBar.tintColor = self.barsTintColor;
}

- (void)setAvailableActions:(SVWebViewControllerAvailableActions)newAvailableActions {
    self.webViewController.availableActions = newAvailableActions;
}

@end
