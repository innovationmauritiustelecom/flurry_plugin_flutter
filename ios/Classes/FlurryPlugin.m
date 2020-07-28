#import "FlurryPlugin.h"
#import "Flurry.h"

@implementation FlurryPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flurry"
            binaryMessenger:[registrar messenger]];
  FlurryPlugin* instance = [[FlurryPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"initialize" isEqualToString:call.method]) {
        NSDictionary *arguments = (NSDictionary*)call.arguments;
        NSString *apiKey = (NSString*)arguments[@"api_key_ios"];
        BOOL isLogEnabled = (BOOL)arguments[@"is_log_enabled"];

        if (isLogEnabled){

            FlurrySessionBuilder* builder = [[[FlurrySessionBuilder new]
                                                withLogLevel:FlurryLogLevelAll]
                                               withCrashReporting:YES];

            [Flurry startSession:apiKey withSessionBuilder:builder];

        } else {

            FlurrySessionBuilder* builder = [[[FlurrySessionBuilder new]
                                              withLogLevel:FlurryLogLevelNone]
                                             withCrashReporting:YES];

            [Flurry startSession:apiKey withSessionBuilder:builder];
        }

        result(nil);
    } else if ([@"logEvent" isEqualToString:call.method]) {
        NSDictionary *arguments = (NSDictionary*)call.arguments;
        NSString *message = (NSString*)arguments[@"message"];
        NSDictionary *params = (NSDictionary*)arguments[@"params"];
        [Flurry logEvent:message withParameters:params];
        result(nil);

    } else if ([@"userId" isEqualToString:call.method]) {
        NSDictionary *arguments = (NSDictionary*)call.arguments;
        NSString *userId = (NSString*)arguments[@"userId"];
        [Flurry setUserID:userId];
        result(nil);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
