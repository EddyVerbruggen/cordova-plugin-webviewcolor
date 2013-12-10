#import "WebViewColor.h"
#import <Cordova/CDV.h>

@implementation WebViewColor

- (void)change:(CDVInvokedUrlCommand*)command {
    NSString *callbackId = command.callbackId;
    NSString *hexColor = [command.arguments objectAtIndex:0];

    UIColor *theColor = [self colorFromHexString:hexColor];
    self.webView.backgroundColor = theColor;

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self writeJavascript:[pluginResult toSuccessCallbackString:callbackId]];
}

// Assumes input like "#00FF00" (#RRGGBB)
- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end