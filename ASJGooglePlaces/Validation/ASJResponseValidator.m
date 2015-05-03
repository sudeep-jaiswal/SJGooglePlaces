//
//  ASJResponseValidator.m
//  GooglePlacesDemo
//
//  Created by sudeep on 26/04/15.
//  Copyright (c) 2015 Sudeep Jaiswal. All rights reserved.
//

#import "ASJResponseValidator.h"
#import "ASJStatusCodeValueTransformer.h"

@implementation ASJResponseValidator

+ (void)validateResponseData:(NSData *)data
					   error:(NSError *)error
				  completion:(void (^)(ASJResponseStatusCode, NSDictionary *))completion {
	
	if (!data) {
		return;
	}
	if (error) {
		NSLog(@"%@", error.localizedDescription);
		return;
	}
	
	NSDictionary *response = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
	
	ASJStatusCodeValueTransformer *transformer = [[ASJStatusCodeValueTransformer alloc] init];
	NSNumber *statusCodeBoxed = [transformer transformedValue:response[@"status"]];
	ASJResponseStatusCode statusCode = statusCodeBoxed.unsignedIntegerValue;
	
	if (completion) {
		completion(statusCode, response);
	}
}

@end