//
//  ttsPlug.m
//  tts
//
//  Created by Alex on 27/11/14.
//
//

 #import <Cordova/CDV.h>
 #import "CustomTTS.h"
 #import <AVFoundation/AVFoundation.h>


@implementation CustomTTS
@property (nonatomic, strong) AVSpeechSynthesizer* talker;

-(void)start:(CDVInvokedUrlCommand*)command {
   
       NSString* myarg = [command.arguments objectAtIndex:0];
   
   
    [self.commandDelegate runInBackground:^{
       

  
      AVSpeechUtterance* utter = [[AVSpeechUtterance alloc] initWithString:myarg];
    utter.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
    [utter setRate:0.2f];
    if (!self.talker) {
        self.talker = [AVSpeechSynthesizer new];
    }
    self.talker.delegate = self;
    [self.talker speakUtterance:utter];
        
       
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        
    
    }];
    
    
}

@end
