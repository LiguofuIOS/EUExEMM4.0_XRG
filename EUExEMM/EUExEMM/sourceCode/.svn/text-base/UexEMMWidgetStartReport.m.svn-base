//
//  UexEMMWidgetStartReport.m
//  EUExEMM
//
//  Created by xrg on 15/9/6.
//  Copyright (c) 2015年 liguofu. All rights reserved.
//

#import "UexEMMWidgetStartReport.h"
#import "UexEMMUtility.h"
#import "UexEMMConfig.h"
#import "WidgetOneDelegate.h"
#import "EUtility.h"
#import "BUtility.h"
#import "WidgetSQL.h"
#import "WWidget.h"

@implementation UexEMMWidgetStartReport

+ (UexEMMWidgetStartReport *)sharedManager {
    static dispatch_once_t predicate;
    static UexEMMWidgetStartReport * sharedManager;
    dispatch_once(&predicate, ^{
        sharedManager=[[UexEMMWidgetStartReport alloc] init];
    });
    return sharedManager;
}

- (void)widgetStartReport {
    
    NSString * postURL = [NSString stringWithFormat:@"%@/v4/widgetStartup/postData",theApp.useStartReportURL];
    
    NSString * postJsonStr = [self getReportData];
    
    UexEMMRequestMgr * requestMgr = [[UexEMMRequestMgr alloc]init];
    
    requestMgr.delegate = self;
    requestMgr.identifier = RequestIdentifier_WidgetStartReport;
    
    [requestMgr post:postURL RequestBodyParams:postJsonStr RequestHeaders:nil];
    
    
}

- (NSString *)getReportData {
    
    NSString * appKey = [BUtility appKey];//主widget的appKey
    
    WidgetSQL * widgetSql = [[WidgetSQL alloc] init];
    [widgetSql Open_database:SQL_WGTONE_DATABASE];
    NSMutableArray * tempArr = [widgetSql selectWgt:[NSString stringWithFormat:@"select * from %@ where wgtType=%d",SQL_WGTS_TABLE,1]];
    WWidget * wgtobj = (WWidget *)[tempArr objectAtIndex:0];
    if (!wgtobj) {
        BOOL isCopyFinish = [[[NSUserDefaults standardUserDefaults]objectForKey:F_UD_WgtCopyFinish] boolValue];
        
        NSString *configPath = nil;
        if (theApp.useUpdateWgtHtmlControl && isCopyFinish) {
            
            if ([BUtility getSDKVersion] < 5.0) {
                
                configPath = [BUtility getCachePath:[NSString stringWithFormat:@"%@/%@",F_MAINWIDGET_NAME,F_NAME_CONFIG]];
                
            } else {
                
                configPath = [BUtility getDocumentsPath:[NSString stringWithFormat:@"%@/%@",F_MAINWIDGET_NAME,F_NAME_CONFIG]];
                
            }
            
        } else {
            
            configPath=[BUtility getResPath:[NSString stringWithFormat:@"%@/%@",F_MAINWIDGET_NAME,F_NAME_CONFIG]];
            
        }
        NSMutableDictionary * tmpWgtDict = [UexEMMUtility wgtParameters:configPath];
        wgtobj = [UexEMMUtility dictToWgt:tmpWgtDict];
    }
    
    NSString * appId = wgtobj.appId;
    NSString * appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    NSString * version = wgtobj.ver;
    NSString * channel = wgtobj.channelCode?wgtobj.channelCode:@"";
    NSString * model = [UexEMMUtility getModel];
    NSString * osVersion = [UexEMMUtility getOSVersion];
    NSString * imei = @"";
    NSString * screenSize = [UexEMMUtility getScreenSize];
    NSString * mobilCarrier = [UexEMMUtility getCarrier];
    NSString * mobilNetwork = [UexEMMUtility getConnectStatus];
    NSString * widgetStartipAt = [UexEMMUtility nowTime];
    NSString * md5Code = [UexEMMUtility md5Code:appId AppKey:appKey];
    NSString * duration = [NSString stringWithFormat:@"%.0f",[[NSUserDefaults standardUserDefaults] floatForKey:@"APPCANONLINETIME"]];
    NSString * mac = @"";
    NSString * sid = @"";
    NSString * deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"deviceToken"];
    NSString * brandName = @"Apple";
    NSString * mobilLocation = @"";
    NSString * softToken = @"";
    
    
    return @"";
    
}

#pragma mark - UexEMMRequestMgrDelegate

- (void)RequestMgr:(UexEMMRequestMgr *)requestMgr didReceiveResponse:(NSURLResponse *)response {
    
}
//- (void)RequestMgr:(UexEMMRequestMgr *)requestMgr didReceiveData:(NSData *)data;
- (void)RequestMgr:(UexEMMRequestMgr *)requestMgr didFailWithError:(NSError *)error {
    
}
- (void)RequestMgr:(UexEMMRequestMgr *)requestMgr didFinishWithData:(NSData *)data {
    
}

@end
