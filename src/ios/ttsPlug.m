//
//  ttsPlug.m
//  tts
//
//  Created by Alex on 27/11/14.
//
//

 #import <Cordova/CDV.h>
 #import "ttsPlug.h"
 #import <AVFoundation/AVFoundation.h>


@implementation ttsPlug

-(void)start:(CDVInvokedUrlCommand*)command {
   
    [self.commandDelegate runInBackground:^{
       
    NSString* myarg = [command.arguments objectAtIndex:1];
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"nel mezzo del cammin"];
        [utterance setRate:0.25f];
        AVSpeechSynthesizer *synth = [[AVSpeechSynthesizer alloc] init];
        [synth speakUtterance:utterance];

           
    
    }];
    
    
}

@end
