//
//  UexEMMWidgetStartReport.h
//  EUExEMM
//
//  Created by xrg on 15/9/6.
//  Copyright (c) 2015年 liguofu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UexEMMRequestMgr.h"

@interface UexEMMWidgetStartReport : NSObject<UexEMMRequestMgrDelegate>

+ (UexEMMWidgetStartReport *)sharedManager;

- (void)widgetStartReport;

@end
