//
//  EUExCall.m
//  AppCan
//
//  Created by AppCan on 11-8-25.
//  Copyright 2011 AppCan. All rights reserved.
//

#import "EUExCall.h"
#import "EUtility.h"
#import "EUExBaseDefine.h"

@implementation EUExCall
@synthesize phoneNumber;


-(void)dealloc {
	callWebView = nil;
	phoneNumber = nil;
	
}


-(void)call:(NSMutableArray *)inArguments {
	NSString * phoneNum = [inArguments objectAtIndex:0];
	//直接拨打电话	
	if (phoneNum == nil) {
		//[super jsFailedWithOpId:0 errorCode:1020101 errorDes:UEX_ERROR_DESCRIBE_ARGS];
		return;
	}
	self.phoneNumber = [NSString stringWithString:phoneNum];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNumber]]];

}

-(void)dial:(NSMutableArray *)inArguments {
	NSString * phoneNum = [inArguments objectAtIndex:0];
	//跳转到打电话界面
	if (phoneNum == nil) {
		//[super jsFailedWithOpId:0 errorCode:1020201 errorDes:UEX_ERROR_DESCRIBE_ARGS];
	}
	callWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
	[callWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNum]]]];
}

-(void)facetime:(NSMutableArray *)inArguments{
	NSString * faceTimeNum = [inArguments objectAtIndex:0];
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"facetime://%@",faceTimeNum]];
	if ([[UIApplication sharedApplication] canOpenURL:url]) {
		[[UIApplication sharedApplication] openURL:url];
	}
}
@end
