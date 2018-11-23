//
//  ShareViewController.m
//  shareTest
//
//  Created by Lokesh Patel on 27/10/15.
//
//

#import "ShareViewController.h"

#import <MobileCoreServices/UTCoreTypes.h>
#import <Cordova/CDVViewController.h>
@interface ShareViewController ()

@end

static ShareViewController* shareVaribleHandle =nil;
@implementation ShareViewController
NSUInteger m_inputItemCount = 0; // Keeps track of the number of attachments we have opened asynchronously.
NSString * m_invokeArgs = NULL;
NSString *fileURL = @"";
- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Uncomment to override the CDVCommandDelegateImpl used
        // _commandDelegate = [[MainCommandDelegate alloc] initWithViewController:self];
        // Uncomment to override the CDVCommandQueue used
        // _commandQueue = [[MainCommandQueue alloc] initWithViewController:self];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Uncomment to override the CDVCommandDelegateImpl used
        // _commandDelegate = [[MainCommandDelegate alloc] initWithViewController:self];
        // Uncomment to override the CDVCommandQueue used
        // _commandQueue = [[MainCommandQueue alloc] initWithViewController:self];
    }
    return self;
}

//Setter method
+ (void) setShareVaribleHandle:(ShareViewController *)responder{
    shareVaribleHandle = responder;
}

//Getter method
+ (ShareViewController*) getShareVaribleHandle {
    return shareVaribleHandle;
}

+ (void) cancelShareView:(ShareViewController *)responder
{
   [responder.extensionContext completeRequestReturningItems:nil completionHandler:nil];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    // View defaults to full size.  If you want to customize the view's size, or its subviews (e.g. webView),
    // you can do so here.
    
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
     [super viewDidLoad];
     [self.webView setFrame:CGRectMake(self.webView.bounds.origin.x,self.webView.bounds.origin.y + 20,self.webView.bounds.size.width,self.webView.bounds.size.height - 20)];
     [self getImageURL];
     [ShareViewController setShareVaribleHandle:self];
    
}//#4285F4

-(void)getImageURL{
   for (NSExtensionItem *item in self.extensionContext.inputItems) {
       fileURL = @"";
        for (NSItemProvider *provider in item.attachments) {
            NSString *imageType = (NSString *)kUTTypeImage;
            if ([provider hasItemConformingToTypeIdentifier:imageType]) {
                [provider loadItemForTypeIdentifier:imageType
                                            options:nil
                                  completionHandler:^(NSURL *imageURL, NSError *error) {
                                      if (error) {
                                          NSLog(@"ERROR: %@", error);
                                      } else {
                                        NSString* text =[imageURL absoluteString];
                                       fileURL = [fileURL stringByAppendingString:[NSString stringWithFormat:@"%@,",text]];
                                       return;
                                      }
                                  }];
            }
            
            [self performSelector:@selector(retrunToJavaScriptFunctio) withObject:nil afterDelay:3.0];
        }
    }
}


-(void) retrunToJavaScriptFunctio
{
    NSString *scriptCall = [NSString stringWithFormat:@"showShareImages('%@')",fileURL];
   [(UIWebView*)self.webView stringByEvaluatingJavaScriptFromString:scriptCall];
}


- (IBAction) btnClickCancel:(id)sender {

    [self.extensionContext completeRequestReturningItems:nil completionHandler:nil];
    //do as you please with buttonClicked.argOne
}

- (IBAction) btnClickSend:(id)sender {
    
    //do as you please with buttonClicked.argOne
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return [super shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

/* Comment out the block below to over-ride */

/*
 - (UIWebView*) newCordovaViewWithFrame:(CGRect)bounds
 {
 return[super newCordovaViewWithFrame:bounds];
 }
 */

#pragma mark UIWebDelegate implementation

- (void)webViewDidFinishLoad:(UIWebView*)theWebView
{
    // Black base color for background matches the native apps
    theWebView.backgroundColor = [UIColor blackColor];
}

/* Comment out the block below to over-ride */


 
 - (void) webViewDidStartLoad:(UIWebView*)theWebView
 {
   
 
 }
 
/* - (void) webView:(UIWebView*)theWebView didFailLoadWithError:(NSError*)error
 {
 return [super webView:theWebView didFailLoadWithError:error];
 }
 
 - (BOOL) webView:(UIWebView*)theWebView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
 {
 return [super webView:theWebView shouldStartLoadWithRequest:request navigationType:navigationType];
 }
 */

@end

@implementation ShareViewCommandDelegate

/* To override the methods, uncomment the line in the init function(s)
 in MainViewController.m
 */

#pragma mark CDVCommandDelegate implementation

- (id)getCommandInstance:(NSString*)className
{
    return [super getCommandInstance:className];
}

- (NSString*)pathForResource:(NSString*)resourcepath
{
    return [super pathForResource:resourcepath];
}

@end

@implementation ShareViewCommandQueue

/* To override, uncomment the line in the init function(s)
 in MainViewController.m
 */
- (BOOL)execute:(CDVInvokedUrlCommand*)command
{
    return [super execute:command];
}

@end

