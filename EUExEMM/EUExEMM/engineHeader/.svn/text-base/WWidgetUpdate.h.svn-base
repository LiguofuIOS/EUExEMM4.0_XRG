//
//  WWidgetUpdate.h
//  WBPlam
//
//  Created by Leilei Xu on 12-12-6.
//  Copyright (c) 2012年 zywx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWidgetUpdate : NSObject<UIAlertViewDelegate>{
    NSString *saveWgtPath;
    NSString *uniqueId;
    long long fileTotalLength;
    long long appendFileSize;
    UIProgressView *_downProgress;
    
    
}
@property(nonatomic,copy)NSString *downLoadURL;
//提示更新
-(void)promptUpdate;
-(void)forceUpdateWgt;
-(BOOL)unZipUpdateWgt:(NSString*)inWgtName;
-(void)removeAllUD:(NSString*)idStr;
@end
