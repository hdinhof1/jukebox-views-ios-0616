//
//  FISSong.h
//  JukeboxViews
//
//  Created by Henry Dinhofer on 6/21/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISSong : NSObject

@property (strong, nonatomic) NSString *title;

@property (strong, nonatomic) NSString *artist;

@property (strong, nonatomic) NSString *album;

@property (strong, nonatomic) NSString *fileName;


-(instancetype)initWithTitle:(NSString *)title
                      artist:(NSString *)artist
                       album:(NSString *)album
                    fileName:(NSString *)fileName;

-(instancetype)init;

@end
