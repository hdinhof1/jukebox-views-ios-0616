//
//  FISJukeboxViewController.m
//  JukeboxViews
//
//  Created by Henry Dinhofer on 6/21/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISJukeboxViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface FISJukeboxViewController()

@property (weak, nonatomic) IBOutlet UITextField *textFieldSongNumber;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;


@end

@implementation FISJukeboxViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.playlist = [[FISPlaylist alloc] init];
    self.textView.text = self.playlist.text;
}

- (IBAction)playButtonIsTapped:(id)sender {
    
    NSString *songNumber = self.textFieldSongNumber.text;
    NSUInteger index = [songNumber integerValue];
    NSLog(@"Now playing: %@", self.playlist.songs[index] );
    FISSong *song = [self.playlist songForTrackNumber:index ];
    [self setUpAVAudioPlayerWithFileName:song.fileName];
    [self.audioPlayer play];
    
   // self.textView.text = self.playlist.songs[index];

    
}
- (IBAction)stopButtonIsTapped:(id)sender {
    [self.audioPlayer stop];
}
- (IBAction)titleButtonIsTapped:(id)sender {
    [self.playlist sortSongsByTitle];
    self.textView.text = self.playlist.text;
    
    
}
- (IBAction)artistButtonIsTapped:(id)sender {
    [self.playlist sortSongsByArtist];
    self.textView.text = self.playlist.text;
    
}
- (IBAction)albumButtonTapped:(id)sender {
    [self.playlist sortSongsByAlbum];
    self.textView.text = self.playlist.text;

}
- (void)setUpAVAudioPlayerWithFileName:(NSString *)fileName
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:@"mp3"];
    NSError *error = nil;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (!self.audioPlayer)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        [self.audioPlayer prepareToPlay];
    }
}



@end
