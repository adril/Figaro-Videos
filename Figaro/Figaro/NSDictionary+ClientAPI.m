//
//  NSDictionary.m
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "NSDictionary+ClientAPI.h"

#import "BaseAPIManager.h"
#import "AppSession.h"
#import "ErrorModel.h"

#import <Underscore.h>

@implementation NSDictionary (ClientAPI)

#pragma mark - GET

- (void)getWithRoute:(NSString *)route completion:(BaseCompletionHandler)completion {
	
	[self getWithRoute:route parameters:nil completion:completion];
}

- (void)getWithRoute:(NSString *)route parameters:(NSDictionary *)parameters completion:(BaseCompletionHandler)completion {
	BaseAPIManager *apiManager = [BaseAPIManager defaultAPI];
	
	UserModel *currentUser = [AppSession defaultSession].currentUser;
	NSDictionary *newParameters = nil;
	
	if (currentUser.id == nil || currentUser.authToken == nil) {
		DLog(@"ERROR: id or auth_token are empty");
		DLog(@"Doing basic HTTP request");
	} else {
		newParameters = @{ @"userId": currentUser.id, @"authToken": currentUser.authToken };
		if (parameters != nil) {
			for (NSDictionary *parameter in parameters) {
				parameters = Underscore.extend(newParameters, parameter);
			}
		}
	}
	DLog(@"parameters: %@", parameters);
	
	[apiManager GET:route parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
		DLog(@"operation: %@", operation);
		DLog(@"JSON: %@", responseObject);
		
		NSError *error = nil;
		
		if (error) {
			DLog(@"%@", error.localizedDescription);
		}
		
		completion(responseObject);
		
		responseObject = nil;
		
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		ErrorModel *errorData = [self errorFromOperation:operation error:error];
		completion(errorData);
	}];
}

#pragma mark - POST

- (void)postWithRoute:(NSString *)route parameters:(NSDictionary *)parameters completion:(BaseCompletionHandler)completion {
	
	BaseAPIManager *apiManager = [BaseAPIManager defaultAPI];
	
	UserModel *currentUser = [AppSession defaultSession].currentUser;
	
	if (currentUser != nil) {
		[apiManager.requestSerializer setValue:@"X-userId" forHTTPHeaderField:currentUser.id];
		[apiManager.requestSerializer setValue:@"X-authToken" forHTTPHeaderField:currentUser.authToken];

	} else {

	}
	
	[apiManager POST:route parameters:self success:^(AFHTTPRequestOperation *operation, id responseObject) {
		DLog(@"operation: %@", operation);
		DLog(@"JSON: %@", responseObject);
		
		DLog(@"responseObject: %@", responseObject);
		
		completion(responseObject);
		
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		ErrorModel *errorData = [self errorFromOperation:operation error:error];
		completion(errorData);
	}];
}

- (void)postWithRoute:(NSString *)route completion:(BaseCompletionHandler)completion {
	[self postWithRoute:route parameters:nil completion:completion];
}

#pragma mark - PUT

- (void)putWithRessourceName:(NSString *)ressourceName route:(NSString *)route completion:(BaseCompletionHandler)completion {
	
	BaseAPIManager *apiManager = [BaseAPIManager defaultAPI];
	
	UserModel *currentUser = [AppSession defaultSession].currentUser;
	
	NSDictionary *parameters = @{ @"userId": currentUser.id, @"authToken": currentUser.authToken, ressourceName: self };
	
	DLog(@"parameters: %@", parameters);
	
	
	[apiManager PUT:route parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
		DLog(@"operation: %@", operation);
		DLog(@"JSON: %@", responseObject);
		
		NSError *error = nil;
		
		DLog(@"responseObject: %@", responseObject);
		
		if (error) {
			DLog(@"%@", error.localizedDescription);
		}
		
		completion(responseObject);
		
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		ErrorModel *errorData = [self errorFromOperation:operation error:error];
		completion(errorData);
	}];
}

#pragma mark - DELETE

- (void)deleteWithRessourceName:(NSString *)ressourceName route:(NSString *)route completion:(BaseCompletionHandler)completion {
	
	BaseAPIManager *apiManager = [BaseAPIManager defaultAPI];
	
	UserModel *currentUser = [AppSession defaultSession].currentUser;
	
	NSDictionary *parameters = @{ @"userId": currentUser.id, @"authToken": currentUser.authToken, ressourceName: self };
	
	
	DLog(@"parameters: %@", parameters);
	
	[apiManager DELETE:route parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
		DLog(@"operation: %@", operation);
		DLog(@"JSON: %@", responseObject);
		
		NSError *error = nil;
		
		DLog(@"responseObject: %@", responseObject);
		
		if (error) {
			DLog(@"%@", error.localizedDescription);
		}
		
		completion(responseObject);
		
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		ErrorModel *errorData = [self errorFromOperation:operation error:error];

		completion(errorData);
	}];
}

#pragma mark - ERROR

- (ErrorModel *)errorFromOperation:(AFHTTPRequestOperation *)operation error:(NSError *)error {
	DLog(@"error: %@", error.localizedDescription);
	DLog(@"operation: %@", operation);
	DLog(@"operation.responseObject: %@", operation.responseObject);
	
	ErrorModel *errorData = [[ErrorModel alloc] init];
	if (operation.responseObject && [[operation.responseObject allKeys] containsObject:@"error"]) {
		if ([[operation.responseObject[@"error"] allKeys] containsObject:@"message"]) {
			errorData.message = operation.responseObject[@"error"][@"message"];
		}
	} else
		errorData.message = @"";
	errorData.type = @"";
	errorData.code = @(operation.response.statusCode);

	return errorData;
}

@end
