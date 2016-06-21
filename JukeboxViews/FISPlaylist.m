//
//  FISPlaylist.m
//  JukeboxViews
//
//  Created by Henry Dinhofer on 6/21/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISPlaylist.h"

@implementation FISPlaylist

-(instancetype)init {
    self = [super init];
    
    if (self) {
        _songs = [self generateSongObjects];
        _text = [self formatSongTitlesForSongs:self.songs];
    }
    return self;
}


-(void)sortSongsByTitle {
    NSSortDescriptor *titleAsc = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES ];
    NSSortDescriptor *artistAsc = [[NSSortDescriptor alloc] initWithKey:@"artist" ascending:YES];
    [self.songs sortUsingDescriptors:@[titleAsc, artistAsc]];
    self.text = [self formatSongTitlesForSongs:self.songs];
}

-(void)sortSongsByArtist {
    NSSortDescriptor *sortArtistsAsc = [[NSSortDescriptor alloc] initWithKey:@"artist" ascending:YES];
    NSSortDescriptor *sortByAlbumAsc = [[NSSortDescriptor alloc] initWithKey:@"album" ascending:YES];
    [self.songs sortUsingDescriptors:@[sortArtistsAsc, sortByAlbumAsc ]];
    self.text = [self formatSongTitlesForSongs:self.songs];
}

-(void)sortSongsByAlbum {
    NSSortDescriptor *sortByAlbumAsc = [[NSSortDescriptor alloc] initWithKey:@"album" ascending:YES];
    NSSortDescriptor *titleAsc = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES ];
    [self.songs sortUsingDescriptors:@[sortByAlbumAsc, titleAsc]];
    self.text = [self formatSongTitlesForSongs:self.songs];
}

-(FISSong *)songForTrackNumber: (NSUInteger)track {
    FISSong *song = [[FISSong alloc] init];
    if (track > self.songs.count || track == 0) {
        song = nil;
    }else {
        song = self.songs[track-1];
        
    }
    return song;
}

- (NSMutableArray *)generateSongObjects
{
    NSMutableArray *songs = [[NSMutableArray alloc] init];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Hold on Be Strong"
                                             artist:@"Matoma vs Big Poppa"
                                              album:@"The Internet 1"
                                           fileName:@"hold_on_be_strong"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Higher Love"
                                             artist:@"Matoma ft. James Vincent McMorrow"
                                              album:@"The Internet 2"
                                           fileName:@"higher_love"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Mo Money Mo Problems"
                                             artist:@"Matoma ft. The Notorious B.I.G."
                                              album:@"The Internet 3"
                                           fileName:@"mo_money_mo_problems"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Old Thing Back"
                                             artist:@"The Notorious B.I.G."
                                              album:@"The Internet 4"
                                           fileName:@"old_thing_back"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Gangsta Bleeding Love"
                                             artist:@"Matoma"
                                              album:@"The Internet 5"
                                           fileName:@"gangsta_bleeding_love"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Bailando"
                                             artist:@"Enrique Iglesias ft. Sean Paul"
                                              album:@"The Internet 6"
                                           fileName:@"bailando"] ];
    
    return songs;
}

-(NSString *)formatSongTitlesForSongs:(NSMutableArray *)songs {
    NSString *text = [NSString new];
    for (NSUInteger i = 0; i < songs.count; i++) {
        FISSong *song = songs[i];
        NSUInteger songNumber = i + 1;
        text = [text stringByAppendingString:[[NSString alloc] initWithFormat:@"%lu. (Title) %@ (Artist) %@ (Album) %@\n", (unsigned long)songNumber, song.title, song.artist, song.album]];

    }
   // NSLog(@"Text is: %@", text);
    return text;
}


@end
