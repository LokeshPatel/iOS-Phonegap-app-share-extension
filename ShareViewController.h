//
//  ShareViewController.h
//  shareTest
//
//  Created by Lokesh Patel on 27/10/15.
//
//
//@property NSURL *imageExtensionUrl;
#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Cordova/CDVViewController.h>
#import <Cordova/CDVCommandDelegateImpl.h>
#import <Cordova/CDVCommandQueue.h>
@interface ShareViewController : CDVViewController
@property NSURL *imageExtensionUrl;

+ (void) setShareVaribleHandle:(ShareViewController *)responder;
//Getter method
+ (ShareViewController*) getShareVaribleHandle;

+ (void) cancelShareView:(ShareViewController *)responder;
@end
@interface ShareViewCommandDelegate : CDVCommandDelegateImpl
@end

@interface ShareViewCommandQueue : CDVCommandQueue
@end