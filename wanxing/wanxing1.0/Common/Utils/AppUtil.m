//
//  AppUtil.m
//  sego2.0
//
//  Created by yulei on 16/11/9.
//  Copyright © 2016年 yulei. All rights reserved.
//

#import "AppUtil.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation AppUtil

//赛果2.0测试接口
static NSString * getServer3 =@"http://180.97.80.227:8082/";


+ (NSString *)getServerSego3
{
    return getServer3;
    
}
+ (BOOL) isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    //NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSString *phoneRegex = @"^1[34578]\\d{9}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}



+ (UIViewController *)appTopViewController{
    UIViewController *appRootVC = ApplicationDelegate.window.rootViewController;
    
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

+ (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return true;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return true;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return true;
    }
    return false;
}


+ (NSString*)getCurrentTime {
    
    NSDateFormatter*formatter = [[NSDateFormatter alloc]init];[formatter setDateFormat:@"HH:mm:ss"];
    NSString*dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;
    
}

+ (NSString *)heads:(NSString *)heads
{
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"method"] = heads;
    params[@"equip_type"] = @"ios";
    params[@"version"] = @"";
    params[@"id"] = @"chendan";
    params[@"pwd"] = @"123456";
    NSDictionary * dic =@{@"heads":params};
    
    // json
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    // base64
    NSData *encodeData = [mutStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [encodeData base64EncodedStringWithOptions:0];
   
    // DES 加密
    
    /*
    NSString *ciphertext = nil;
    NSData *textData = [base64String dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [textData length];
    unsigned char buffer[1024 * 5];
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String], kCCKeySizeDES,
                                          [iv UTF8String],
                                          [textData bytes], dataLength,
                                          buffer, 1024,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        ciphertext = [data base64EncodedStringWithOptions:0];
    }
    return ciphertext;
    */
    
    
    return heads;
    
}






@end
