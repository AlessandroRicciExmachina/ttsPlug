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



-(void)start:(CDVInvokedUrlCommand*)command {
   
       NSString* myarg = [command.arguments objectAtIndex:0];
   
   
    [self.commandDelegate runInBackground:^{
       

  
      AVSpeechUtterance* utter = [[AVSpeechUtterance alloc] initWithString:myarg];
    utter.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"it-IT"];
    [utter setRate:0.1f];
    if (!talker) {
        talker = [AVSpeechSynthesizer new];
       
    [talker speakUtterance:utter];
        
        while([talker isSpeaking]){
        
        
        
        }
        
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        talker=nil;
        
    }
  
    }];
    
    
}

-(void)stop:(CDVInvokedUrlCommand*)command {

 AVSpeechSynthesizer *talked = talker;
    if([talked isSpeaking]) {
        [talked stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@""];
        [talked speakUtterance:utterance];
        [talked stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
         talker=nil;
    }

}


@end
