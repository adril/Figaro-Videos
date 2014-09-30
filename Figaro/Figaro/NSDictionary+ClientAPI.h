//
//  NSDictionary.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import <Foundation/Foundation.h>
#import "Base.h"

@interface NSDictionary (ClientAPI)

- (void)getWithRoute:(NSString *)route completion:(BaseCompletionHandler)completion;
- (void)getWithRoute:(NSString *)route parameters:(NSDictionary *)parameters completion:(BaseCompletionHandler)completion;

- (void)postWithRoute:(NSString *)route parameters:(NSDictionary *)parameters completion:(BaseCompletionHandler)completion;
- (void)postWithRoute:(NSString *)route completion:(BaseCompletionHandler)completion;

- (void)putWithRessourceName:(NSString *)ressourceName route:(NSString *)route completion:(BaseCompletionHandler)completion;

- (void)deleteWithRessourceName:(NSString *)ressourceName route:(NSString *)route completion:(BaseCompletionHandler)completion;

@end
