//
//  SinaBlog.h
//  RSSDemo
//
//  Created by forrest on 11-5-15.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SinaBlog : NSObject {
    NSString    *title;
    NSString    *link;
}

@property(nonatomic,copy) NSString    *title;
@property(nonatomic,copy) NSString    *link;
@end
