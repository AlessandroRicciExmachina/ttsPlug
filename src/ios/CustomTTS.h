//
//  ttsPlug.h
//  tts
//
//  Created by Alex on 27/11/14.
//
//

#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>
@interface  CustomTTS : CDVPlugin
@property (nonatomic, strong) AVSpeechSynthesizer* talker;
-(void)start:(CDVInvokedUrlCommand*)command;

@end
