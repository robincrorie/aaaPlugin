#import "MyCordovaPlugin.h"

#import <Cordova/CDVAvailability.h>
#import "TestViewController.h"

@interface MyCordovaPlugin() <TestViewControllerDelegate>
    @property (strong, nonatomic) CDVInvokedUrlCommand * lastCommand;
@end

@implementation MyCordovaPlugin

- (void)pluginInitialize {
}

- (void)echo:(CDVInvokedUrlCommand *)command {
    NSString* phrase = [command.arguments objectAtIndex:0];
    NSLog(@"%@", phrase);
}

- (void)getDate:(CDVInvokedUrlCommand *)command {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *enUSPOSIXLocale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    [dateFormatter setLocale:enUSPOSIXLocale];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];

    NSDate *now = [NSDate date];
    NSString *iso8601String = [dateFormatter stringFromDate:now];

    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:iso8601String];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)displayView:(CDVInvokedUrlCommand *)command {
    self.lastCommand = command;
    TestViewController * tvc = [[TestViewController alloc] initWithNibName:@"TestViewController" bundle:nil];
    tvc.delegate = self;
    [self.viewController presentViewController:tvc animated:YES completion:nil];
}

- (void)sendPluginResult {
    BOOL hasErrors = NO;
    CDVPluginResult* pluginResult;
    if (hasErrors) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_IO_EXCEPTION messageAsString:@"One or more files failed to be deleted."];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Plugin Succefully Worked"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.lastCommand.callbackId];
}

@end
