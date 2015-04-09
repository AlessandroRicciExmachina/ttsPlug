//
//  ttsPlug.h
//  tts
//
//  Created by Alex on 27/11/14.
//
//

#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>
#import <AVFoundation/AVFoundation.h>
@interface  CustomTTS : CDVPlugin
{

AVSpeechSynthesizer* talker;

}
-(void)start:(CDVInvokedUrlCommand*)command;

@end
