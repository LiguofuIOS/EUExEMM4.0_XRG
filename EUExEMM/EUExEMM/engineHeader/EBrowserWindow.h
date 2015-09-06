//
//  EBrowserWindow.h
//  WebKitCorePlam
//
//  Created by yang fan on 11-8-23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EBrowser;
@class EBrowserController;
@class EBrowserView;
@class WWidget;
@class EBrowserHistory;
@class EBrowserHistoryEntry;

#define F_POPOVER_BRW_VIEW_DICT_SIZE	1
#define F_EBRW_WND_FLAG_IN_CLOSING		0x1
#define F_EBRW_WND_FLAG_IN_OPENING		0x2
#define F_EBRW_WND_FLAG_HAS_PREOPEN		0x4
#define F_EBRW_WND_FLAG_FINISH_PREOPEN	0x8

@interface EBrowserWindow : UIView {
	EBrowserController *meBrwCtrler;
	EBrowserView *meTopSlibingBrwView;
	EBrowserView *meBrwView;
	EBrowserView *meBottomSlibingBrwView;
	NSMutableArray *mPreOpenArray;
	NSMutableDictionary *mPopoverBrwViewDict;
	EBrowserWindow *meFrontWnd;
	EBrowserWindow *meBackWnd;
	EBrowserHistory *meBrwHistory;
	NSString *mOAuthWndName;
	WWidget *mwWgt;
	int mOpenAnimiId;
	float mOpenAnimiDuration;
	int mFlag;
}
@property (nonatomic,assign) EBrowserController *meBrwCtrler;
@property (nonatomic,assign) EBrowserView *meTopSlibingBrwView;
@property (nonatomic,assign) EBrowserView *meBrwView;
@property (nonatomic,assign) EBrowserView *meBottomSlibingBrwView;
@property (nonatomic,assign) NSMutableArray *mPreOpenArray;
@property (nonatomic,assign) NSMutableDictionary *mPopoverBrwViewDict;
@property (nonatomic,assign) EBrowserWindow *meFrontWnd;
@property (nonatomic,assign) EBrowserWindow *meBackWnd;
@property (nonatomic,assign) EBrowserHistory *meBrwHistory;
@property (nonatomic,retain) NSString *mOAuthWndName;
@property (nonatomic,assign) WWidget *mwWgt;
@property int mOpenAnimiId;
@property float mOpenAnimiDuration;
@property int mFlag;

- (id)initWithFrame:(CGRect)frame BrwCtrler:(EBrowserController*)eInBrwCtrler Wgt:(WWidget*)inWgt UExObjName:(NSString*)inUExObjName;
- (void)notifyLoadPageStartOfBrwView: (EBrowserView*)eInBrwView;
- (void)notifyLoadPageFinishOfBrwView: (EBrowserView*)eInBrwView;
- (void)notifyLoadPageErrorOfBrwView: (EBrowserView*)eInBrwView;
- (BOOL)canGoBack;
- (BOOL)canGoForward;
- (void)goBack;
- (void)goForward;
- (void)addHisEntry:(EBrowserHistoryEntry*)eInHisEntry;
- (EBrowserHistoryEntry*)curHisEntry;
- (EBrowserView*)popBrwViewForKey:(id)inKey;
- (void)removeFromPopBrwViewDict:(id)inKey;
- (void)cleanAllBrwViews;
- (void)clean;
-(EBrowserView *)theFrontView;
@end
