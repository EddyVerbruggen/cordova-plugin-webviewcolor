#import <Cordova/CDV.h>

@interface WebViewColor : CDVPlugin

- (void)change:(CDVInvokedUrlCommand*)command;
- (void)transparent:(CDVInvokedUrlCommand*)command;

@end