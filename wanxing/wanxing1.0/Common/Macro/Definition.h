//
//  Definition.h
//  sego2.0
//
//  Created by yulei on 16/11/8.
//  Copyright © 2016年 yulei. All rights reserved.
//

// 存放各种宏定义 存放宏的时候标注每个宏的作用



#ifndef Definition_h
#define Definition_h








//-------------------封装NSLog打印日志-------------------------
#define DEBUG_MODE 1
#if DEBUG_MODE
#define FuckLog( s, ... ) NSLog( @"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DLog( s, ... )
#endif


//-------------------前台后台-------------------------
#define BACK_GCD(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)


#define MAIN_GCD(block) dispatch_async(dispatch_get_main_queue(),block)



//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define MainScreen [UIScreen mainScreen].bounds.size

//获取当前语言
#define CurrentLanguage (［NSLocale preferredLanguages] objectAtIndex:0])


#define NUMBERS @"0123456789n"

// 项目颜色
#define Blue_color   [UIColor colorWithRed:9/255.0 green:177/255.0 blue:239/255.0 alpha:1.0]
#define Orange_color   [UIColor colorWithRed:252/255.0 green:151/255.0 blue:33/255.0 alpha:1.0]
#define Green_color   [UIColor colorWithRed:38/255.0 green:190/255.0 blue:199/255.0 alpha:1.0]
#define Gray_color   [UIColor colorWithRed:126/255.0 green:126/255.0 blue:126/255.0 alpha:1.0]
#define Gray_color_uibrother   [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1.0]



#define Gray_color_128 [UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1.0]
#define Gray_color_47 [UIColor colorWithRed:47/255.0 green:47/255.0 blue:47/255.0 alpha:1.0]
#define Gray_color_240 [UIColor colorWithRed:240 /255.0 green:240 /255.0 blue:240 /255.0 alpha:1.0]
#define Gray_color_55   [UIColor colorWithRed:55/255.0 green:55/255.0 blue:55/255.0 alpha:1.0]
#define Gray_color_255   [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]
// 项目字体
#define Gray_color_tt   [UIColor colorWithRed:140/255.0 green:140/255.0 blue:140/255.0 alpha:1.0]
#define Gray_color_b   [UIColor colorWithRed:55/255.0 green:55/255.0 blue:55/255.0 alpha:1.0]

#define Ping_M(r) [UIFont fontWithName:@"PingFangSC-Medium" size:r]
#define Ping_B(r) [UIFont fontWithName:@"PingFangSC-Semibold" size:r]
#define Ping_R(r) [UIFont fontWithName:@"PingFangSC-Regular" size:r]



//带有RGBA的颜色设置
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
// 16进制
#define UIColorFromHex(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0]


#define ssRGBHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue  0xFF0000) >> 16))/255.0 green:((float)((rgbValue  0xFF00) >> 8))/255.0 blue:((float)(rgbValue  0xFF))/255.0 alpha:1.0]

//格式0xdae8a6
#define JDCOLOR_FROM_RGB_OxFF_ALPHA(rgbValue,al)                    \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:al]

// 屏幕

// 状态栏 CGRect
#define  rectStatus  [[UIApplication sharedApplication] statusBarFrame];
// 导航栏
#define rectNav self.navigationController.navigationBar.frame;
// 标签栏
#define rectTab self.tabBarController.tabBar.frame;


#define  langeC [[NSLocale preferredLanguages] objectAtIndex:0];


#define IMAGE_NAMED(name) [UIImage imageNamed:name]

#undef	NAV_BUTTON_MIN_WIDTH
#define	NAV_BUTTON_MIN_WIDTH	(40.0f)

#undef	NAV_BUTTON_MIN_HEIGHT
#define	NAV_BUTTON_MIN_HEIGHT	(40.0f)

#undef	NAV_BAR_HEIGHT
#define	NAV_BAR_HEIGHT	(44.0f)
#define	STATUS_BAR_HEIGHT	(20.0f)
#define	TAB_BAR_HEIGHT	(49.0f)



#define OrangerCol RGB(257, 130, 77);

#define Best_string  [NSString    stringWithFormat:@"eyJpZCI6ImNoZW5kYW4iLCJwd2QiOiIxMjM0NTYiLCJlcXVpcF90eXBlIjoiYW5kcm9pZCIsInZlcnNpb24iOiIxLjAuMC4wIiwibWV0aG9kIjoiSk9VUk5fR2V0TGlzdCJ9"]
#define Best_null [NSString  stringWithFormat:@""]

//判断是否 Retina屏、设备是否%fhone 5、是否是iPad
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size)) : NO)
#define iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)

//单例化一个类
// @interface
#define singleton_interface(className) \
+ (className *)shared##className;

// @implementation
#define singleton_implementation(className) \
static className *_instance; \
+ (id)allocWithZone:(NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
+ (className *)shared##className \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
}


#define ApplicationDelegate                 ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define Defaluts  ([NSUserDefaults standardUserDefaults])
#define Mid_S     ([AccountManager sharedAccountManager].loginModel.mid)
#define LAGE_LOC  ([NSLocale preferredLanguages].firstObject)

//单例
#define JDSHAREINSTANCE_FOR_CLASS(__CLASSNAME__)            \
\
static __CLASSNAME__ *instance = nil;                       \
\
+ (__CLASSNAME__ *)sharedInstance{                      \
static dispatch_once_t onceToken;                   \
dispatch_once(&onceToken, ^{                        \
if (nil == instance){                           \
instance = [[__CLASSNAME__ alloc] init];    \
}                                               \
});                                                 \
\
return instance;                                        \
}                                                           \



#endif /* Definition_h */
