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

-(void)ttsStart:(CDVInvokedUrlCommand*)command {
   
    [self.commandDelegate runInBackground:^{
       
    
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"nel mezzo del cammin di nostra vita"];
        [utterance setRate:0.25f];
        AVSpeechSynthesizer *synth = [[AVSpeechSynthesizer alloc] init];
        [synth speakUtterance:utterance];

           
    
    }];
    
    
}

@end