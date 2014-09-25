//
//  AppParameters.m
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "AppParameters.h"

static NSString *selectedEnvironement = @"production";

@implementation AppParameters

+ (AppParameters*)defaultParameters {
    static AppParameters *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] init];
    });
    
    return _sharedClient;
}

- (id)init {
    self = [super init];
    if (self)
    {
		@try {
			
			NSString* path = [[NSBundle mainBundle] pathForResource:@"parameters"
															 ofType:@"json"];
			NSString* content = [NSString stringWithContentsOfFile:path
														  encoding:NSUTF8StringEncoding
															 error:NULL];
			NSError* error = nil;
			NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[content dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
			
			error = nil;
			self.parameters = [[ParametersModel alloc] initWithDictionary:json error:&error];
			
			DLog(@"error: %@", error);
			DLog(@"parameters: %@", self.parameters);		
		}
		@catch (NSException *exception) {
			DLog(@"exception: %@", exception);
		}
		@finally {

		}
	}
	return self;
}

- (EnvironementModel *)environememnt {
	
	if (_environememnt == nil) {
		_environememnt = [[EnvironementModel alloc] init];
		_environememnt.api = self.parameters.environements[selectedEnvironement][@"api"];
		_environememnt.host = self.parameters.environements[selectedEnvironement][@"host"];
		_environememnt.port = self.parameters.environements[selectedEnvironement][@"port"];
	}
	return _environememnt;
}

@end
