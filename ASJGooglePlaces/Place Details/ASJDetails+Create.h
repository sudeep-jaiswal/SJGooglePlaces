//
//  ASJDetails+Create.h
//  GooglePlacesDemo
//
//  Created by sudeep on 28/04/15.
//  Copyright (c) 2015 Sudeep Jaiswal. All rights reserved.
//

#import "ASJDetails.h"

@interface ASJDetails (Create)

+ (ASJDetails *)placeDetailsFromResponse:(NSDictionary *)response;

@end