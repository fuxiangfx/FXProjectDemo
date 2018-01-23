//
//  AppMacro.h
//  AErShopingMall
//
//  Created by masha on 16/6/7.
//  Copyright © 2016年 xxb. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h


//
//#define Max(x,y)          (((x)>(y)?(x):(y)))
//
//#define mNavBarHeight         44
//#define mTabBarHeight         49
#define mScreenWidth          ([UIScreen mainScreen].bounds.size.width)
#define mScreenHeight         ([UIScreen mainScreen].bounds.size.height)

#define mSystemVersion   ([[UIDevice currentDevice] systemVersion])
#define mCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
#define mAPPVersion      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#define mFirstLaunch     mAPPVersion     //以系统版本来判断是否是第一次启动，包括升级后启动。
#define mFirstRun        @"firstRun"     //判断是否为第一次运行，升级后启动不算是第一次运行

#define  MMLastLongitude @"MMLastLongitude"
#define  MMLastLatitude  @"MMLastLatitude"
#define  MMLastCity      @"MMLastCity"
#define  MMLastProvince  @"MMLastProvince"
#define  MMLastArea      @"MMLastArea"
#define  MMLastDetail    @"MMLastDetail"

//----------方法简写-------
#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define mAppDelegate        (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define mWindow             [[[UIApplication sharedApplication] windows] lastObject]
#define mKeyWindow          [[UIApplication sharedApplication] keyWindow]
#define kDocuments  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define mNavitationTitle(Title)  self.navigationItem.title = Title
#define setDickeyobj(dic,obj,key)     [dic setObject:obj forKey:key];
#define dicforkey(dic,key)      [dic objectForKey:key];
#define UserDefaultsSynchronize(uname,key)  \
{ \
[[NSUserDefaults standardUserDefaults] setObject:uname forKey:key]; \
[[NSUserDefaults standardUserDefaults] synchronize];\
}
#define UserDefaultsGetSynchronize(key)  [[NSUserDefaults standardUserDefaults] objectForKey:key]
#define VIEW_TX(view) (view.frame.origin.x)
#define VIEW_TY(view) (view.frame.origin.y)
#define VIEW_W(view)  (view.frame.size.width)
#define VIEW_H(view)  (view.frame.size.height)
#define VIEW_BX(view) (view.frame.origin.x + view.frame.size.width)
#define VIEW_BY(view) (view.frame.origin.y + view.frame.size.height )

//简单的以AlertView显示提示信息
#define mAlertView(title, msg) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil \
cancelButtonTitle:@"确定" \
otherButtonTitles:nil]; \
[alert show];
/*---------------------------------程序界面配置信息-------------------------------------*/

//设置app界面字体及颜色
#define mTitleFont1              [UIFont boldSystemFontOfSize:20]//一级标题字号
#define mTitleFont2              [UIFont boldSystemFontOfSize:17]//二级标题字号
#define mContentFont             [UIFont systemFontOfSize:14.5]  //内容部分字号
#define mTitleFont(font)           [UIFont systemFontOfSize:font]
//自定义字体
#define UIFONT_SC_MEDIUM(fontSize)    [UIFont fontWithName:@"bn_list_card_icon_font" size:fontSize]

//内容部分正常显示颜色和突出显示颜色
#define mContentNormalColor      [UIColor colorWithRed:57/255.0 green:32/255.0 blue:0/255.0 alpha:1]
#define mContentHighlightColor   [UIColor colorWithRed:57/255.0 green:32/255.0 blue:0/255.0 alpha:1]
//按钮上字体颜色
#define mBtnTitleNormalColor     [UIColor colorWithRed:57/255.0 green:32/255.0 blue:0/255.0 alpha:1]
#define mBtnTitleHighlightColor  [UIColor colorWithRed:255/255.0 green:96/255.0 blue:0/255.0 alpha:1]
#define RGB(a,b,c) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:1]

//设置应用的页面背景色
#define mAppBgColor  [UIColor colorWithRed:93/255.0 green:152/255.0 blue:235/255.0 alpha:1]
//应用主色
#define mAppMainColor toPCcolor(@"4C98F2")

//方便使用函数
//加载图片
#define mImageByName(name)        [UIImage imageNamed:name]


#define mImageByPath(name, ext)   [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:name ofType:ext]]
#define mImageByCap(imgname,a,b,c,d)   [[UIImage imageNamed:imgname] resizableImageWithCapInsets:UIEdgeInsetsMake(a, b, c, d)]
//以tag读取View
#define mViewByTag(parentView, tag, Class)  (Class *)[(UIView *)parentView viewWithTag:tag]
//读取Xib文件的类
#define mViewByNib(Class,string, owner) (Class *)[[[NSBundle mainBundle] loadNibNamed:string owner:owner options:nil] lastObject]


#define DistanceFloat(PointA,PointB) sqrtf((PointA.x - PointB.x) * (PointA.x - PointB.x) + (PointA.y - PointB.y) * (PointA.y - PointB.y))


//-------------------打印日志-------------------------
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

//DEBUG  模式下打印日志,当前行 并弹出一个警告
#ifdef DEBUG
#   define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define ULog(...)
#endif

#endif /* AppMacro_h */
