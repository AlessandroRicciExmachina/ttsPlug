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
   
    [self.commandDelegate runInBackground:^{
       
    NSString* myarg = [command.arguments objectAtIndex:1];
    myarg = ['asdrubale'];
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:myarg];
        [utterance setRate:0.25f];
        AVSpeechSynthesizer *synth = [[AVSpeechSynthesizer alloc] init];
        [synth speakUtterance:utterance];

           
    
    }];
    
    
}

@end
