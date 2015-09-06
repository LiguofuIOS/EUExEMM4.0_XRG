//
//  EBrowserWindowContainer.h
//  WBPalm
//
//  Created by 邹 达 on 11-10-20.
//  Copyright 2011 zywx. All rights reserved.
//

#import <UIKit/UIKit.h>

#define F_BRW_WND_CONTAINER_LOAD_WGT_DONE					0x1

#define F_BRW_WND_CONTAINER_BRW_WND_DICT_SIZE				30
#define F_BRW_WND_ROOT_NAME									@"root"

@class EBrowserController;
@class EBrowserWindow;
@class EBrowserView;
@class AliPayInfo;

@interface EBrowserWindowContainer : UIView {
	EBrowserController *meBrwCtrler;
	EBrowserWindow *meRootBrwWnd;
	NSMutableDictionary *mBrwWndDict;
	WWidget *mwWgt;
	EBrowserWindowContainer	*meOpenerContainer;
	NSString *mOpenerForRet;
	NSString *mOpenerInfo;
	NSString *mPushNotifyBrwViewName;
	NSString *mPushNotifyCallback;
	AliPayInfo *mAliPayInfo;
	int mStartAnimiId;
	float mStartAnimiDuration;
	int mFlag;
}
@property (nonatomic, assign) EBrowserController *meBrwCtrler;
@property (nonatomic, assign) EBrowserWindow *meRootBrwWnd;
@property (nonatomic, assign) NSMutableDictionary *mBrwWndDict;
@property (nonatomic, retain) WWidget *mwWgt;
@property (nonatomic, assign) EBrowserWindowContainer *meOpenerContainer;
@property (nonatomic, retain) NSString *mOpenerForRet;
@property (nonatomic, retain) NSString *mOpenerInfo;
@property (nonatomic, retain) AliPayInfo *mAliPayInfo;
@property (nonatomic, copy) NSString *mPushNotifyBrwViewName;
@property (nonatomic, copy) NSString *mPushNotifyCallback;
@property int mStartAnimiId;
@property float mStartAnimiDuration;
@property int mFlag;

- (id)initWithFrame:(CGRect)frame BrwCtrler:(EBrowserController*)eInBrwCtrler Wgt:(WWidget*)inWgt;
- (void)notifyLoadPageStartOfBrwView: (EBrowserView*)eInBrwView;
- (void)notifyLoadPageFinishOfBrwView: (EBrowserView*)eInBrwView;
- (void)notifyLoadPageErrorOfBrwView: (EBrowserView*)eInBrwView;
- (EBrowserWindow*)aboveWindow;
- (EBrowserWindow*)brwWndForKey: (id)inKey;
- (void)removeAllUnActiveBrwWnd;
- (void)removeFromWndDict:(id)inKey;
- (void)pushNotify;
- (void)clean;
@end
