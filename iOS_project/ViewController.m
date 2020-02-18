//
//  ViewController.m
//  iOS_project
//
//  Created by Josh_Lv on 2020/2/4.
//  Copyright © 2020 Josh_Lv. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>

@interface ViewController ()<FlutterStreamHandler>
//单项管道，有可能使用多次
@property (nonatomic, copy) FlutterEventSink eventSink;
@property (nonatomic, strong) FlutterEngine *flutterEngin;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)gotoFlutter:(id)sender {
    FlutterViewController *flvc = [[FlutterViewController alloc] init];
    //单项通信管道，Flutter向原生发送消息
    FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:@"com.flutterToNative" binaryMessenger:flvc];
    __weak typeof(self) weakSelf = self;
    [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([@"backToNative" isEqualToString:call.method]) {
            [weakSelf dismissViewControllerAnimated:true completion:nil];
        }
    }];
    
    //单项通信管道，原生向Flutter发送消息
    FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:@"com.nativeToFlutter" binaryMessenger:flvc];
    [eventChannel setStreamHandler:self];
    
    [self presentViewController:flvc animated:true completion:nil];
}

/**
 使用FlutterEngine跳转Flutter
 */
- (IBAction)use_flutter_engin_btn_click:(id)sender {
    FlutterViewController *flvc = [[FlutterViewController alloc] initWithEngine:self.flutterEngin nibName:nil bundle:nil];
    //单项通信管道，Flutter向原生发送消息
    FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:@"com.flutterToNative" binaryMessenger:flvc];
    __weak typeof(self) weakSelf = self;
    [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([@"backToNative" isEqualToString:call.method]) {
            [weakSelf dismissViewControllerAnimated:true completion:nil];
        }
    }];
    
    //单项通信管道，原生向Flutter发送消息
    FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:@"com.nativeToFlutter" binaryMessenger:flvc];
    [eventChannel setStreamHandler:self];
    
    [self presentViewController:flvc animated:true completion:nil];
}


#pragma mark -- FlutterStreamHandler代理
- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments
                                       eventSink:(FlutterEventSink)events {
    if (events) {
        self.eventSink  = events;
        self.eventSink(@"从原生传递过来的消息。。。。。。。");
    }
    return nil;
}
// 不再需要向Flutter传递消息
- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    return nil;
}

#pragma mark -- Lazy method
- (FlutterEngine *)flutterEngin {
    if (nil == _flutterEngin) {
        FlutterEngine *flutterEngin = [[FlutterEngine alloc] initWithName:@"flutter_native" project:nil];
        [flutterEngin runWithEntrypoint:nil];
        [GeneratedPluginRegistrant registerWithRegistry:flutterEngin];
        _flutterEngin = flutterEngin;
    }
    return _flutterEngin;
}
@end
