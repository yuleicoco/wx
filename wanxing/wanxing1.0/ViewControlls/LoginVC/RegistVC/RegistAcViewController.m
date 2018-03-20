//
//  RegistAcViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/16.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "RegistAcViewController.h"
#import "AggreMentViewController.h"

@interface RegistAcViewController ()<UITextViewDelegate>

@property(nonatomic,weak)UITextView *linkTV;
@property(nonatomic,assign)BOOL select;


@end

@implementation RegistAcViewController

- (void)viewDidLoad {
    self.select = NO;
    self.view.backgroundColor =[UIColor whiteColor];
    [super viewDidLoad];
    [self SetupView];
   
}




- (void)SetupView
{
    // bg 公司
    UIImageView * Bgimage =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Login_bg"]];
    [self.view addSubview:Bgimage];
    [Bgimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(375, 266));
    }];
    
    NSArray * ar =[[NSArray alloc]initWithObjects:NSLocalizedString(@"Regist_use", nil),
                   NSLocalizedString(@"Regist_ps", nil),NSLocalizedString(@"Regist_agps", nil), nil];
    
    // 3个 用户名 密码  确认密码
    NSMutableArray *array = [NSMutableArray new];
    for (NSInteger i =0; i<3; i++) {
        UILabel * ThrLb =[[UILabel alloc]init];
        ThrLb.tag = 1000+i;
        ThrLb.text =ar[i];
        ThrLb.font =[UIFont fontWithName:@"PingFangSC-Regular" size:14];
        ThrLb.textColor = RGB(55, 55, 55);
        ThrLb.adjustsFontSizeToFitWidth =YES;
        [self.view addSubview:ThrLb];
        [array addObject:ThrLb];
        
    }
    
    
    [array mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:55 leadSpacing:306 tailSpacing:203];
    [array mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.view).offset(28);
        make.width.equalTo(@54);
        
    }];
     
    
     NSMutableArray *arrayIn = [NSMutableArray new];
    
     NSArray * arrIn =[[NSArray alloc]initWithObjects:NSLocalizedString(@"Regist_sf_us", nil),
                   NSLocalizedString(@"Regist_sf_ps", nil),NSLocalizedString(@"Regist_sf_a_ps", nil), nil];
    
    // 3个 输入框
    for (NSInteger i = 0; i<3; i++) {
        
        UITextField * InputTF =[[UITextField alloc]init];
        InputTF.tag = 1500+i;
        InputTF.placeholder =arrIn[i];
        InputTF.borderStyle = UITextBorderStyleRoundedRect;
        InputTF.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        InputTF.layer.borderColor =[UIColor grayColor].CGColor;
        [self.view addSubview:InputTF];
        [arrayIn addObject:InputTF];
        
    
    }
    
    [arrayIn mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:25 leadSpacing:301 tailSpacing:187];
    [arrayIn mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.width.equalTo(@257);
        make.left.mas_equalTo(self.view).offset(90);
    }];
    
    
    
    // 注册
    UIButton * Re_btn =[[UIButton alloc]init];
    
    [Re_btn addTarget:self action:@selector(Re_btn_Touch) forControlEvents:UIControlEventTouchUpInside];
    [Re_btn setTitle:NSLocalizedString(@"Regist_reg", nil) forState:UIControlStateNormal];
    Re_btn.backgroundColor = OrangerCol;
    Re_btn.layer.masksToBounds = YES;
    Re_btn.layer.cornerRadius =5;
    [self.view addSubview:Re_btn];
    
    [Re_btn mas_makeConstraints:^(MASConstraintMaker *make) {
          make.bottom.equalTo(self.view).offset(-76);
          make.left.equalTo(self.view).offset(27);
          make.size.mas_equalTo(CGSizeMake(325,47 ));
        
    }];
    
    
    // 超链接
    
    UIFont *linkFont = [UIFont fontWithName:@"PingFangSC-Medium" size:12];
    UITextView * linkTV =[[UITextView alloc]init];
    self.linkTV = linkTV;
    linkTV.userInteractionEnabled = YES;
    linkTV.font = linkFont;
    linkTV.editable = NO;//必须禁止输入，否则点击将弹出输入键盘
    linkTV.scrollEnabled = NO;
    linkTV.delegate = self;
    linkTV.textContainerInset = UIEdgeInsetsMake(0,0, 0, 0);//文本距离边界值
    [self.view addSubview:linkTV];
    
    [linkTV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view).offset(27);
        make.top.equalTo(Re_btn.mas_bottom).offset(15);
        
    }];
    
    [self setLinkText];
    
    //返回
    UIButton * BackBtn =[[UIButton alloc]init];
    BackBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    BackBtn.contentEdgeInsets = UIEdgeInsetsMake(0,0, -2,0);
    BackBtn.titleLabel.font =[UIFont fontWithName:@"PingFangSC-Medium" size:12];
    [BackBtn addTarget:self action:@selector(BackBtn) forControlEvents:UIControlEventTouchUpInside];
    [BackBtn setTitle:NSLocalizedString(@"Regist_back", nil) forState:UIControlStateNormal];
    [BackBtn setTitleColor:RGB(73, 73, 73) forState:UIControlStateNormal];
    
    [self.view addSubview:BackBtn];
    
    [BackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.equalTo(Re_btn.mas_bottom).offset(15);
        make.right.equalTo(self.view).offset(-30);
        
    }];
    
    
    
}


- (void)BackBtn
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

//设置文本
- (void)setLinkText{
    NSString *linkStr = @"我已阅读并接受《注册协议》";
    UIFont *linkFont = [UIFont systemFontOfSize:14.0];
    CGFloat linkW = SCREEN_WIDTH - 10*2;
    CGSize linkSize = [self getAttributionHeightWithString:linkStr lineSpace:1.5 kern:1 font:linkFont width:linkW];
    self.linkTV.frame = CGRectMake(10, 100, linkW, linkSize.height);
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:linkStr];
 //   [attributedString addAttribute:NSLinkAttributeName value:@"login://" range:[[attributedString string] rangeOfString:@"《登录协议》"]];
    [attributedString addAttribute:NSLinkAttributeName value:@"register://" range:[[attributedString string] rangeOfString:@"《注册协议》"]];
    
    CGSize size = CGSizeMake(12, 12);
    UIImage *image = [UIImage imageNamed:self.select == YES ? @"Regist_choose" : @"Regist_un_choose"];
    UIGraphicsBeginImageContextWithOptions(size, false, 0);
    [image drawInRect:CGRectMake(0, 0.25, 12, 12)];
    UIImage *resizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = resizeImage;
    NSMutableAttributedString *imageString = (NSMutableAttributedString *)[NSMutableAttributedString attributedStringWithAttachment:textAttachment];
    [imageString addAttribute:NSLinkAttributeName value:@"checkbox://" range:NSMakeRange(0, imageString.length)];
    [attributedString insertAttributedString:imageString atIndex:0];
    //    [attributedString addAttribute:NSFontAttributeName value:linkFont range:NSMakeRange(0, attributedString.length)];
    
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    //调整行间距
    paragraphStyle.lineSpacing = 1.5;
    NSDictionary *attriDict = @{NSParagraphStyleAttributeName:paragraphStyle,NSKernAttributeName:@(1),
                                NSFontAttributeName:linkFont};
    [attributedString addAttributes:attriDict range:NSMakeRange(0, attributedString.length)];
    
    self.linkTV.attributedText = attributedString;
    self.linkTV.linkTextAttributes = @{NSForegroundColorAttributeName: RGB(9, 177, 239), NSUnderlineColorAttributeName: [UIColor lightGrayColor], NSUnderlineStyleAttributeName: @(NSUnderlinePatternSolid)};
}


/*
 *  设置行间距和字间距
 *
 *  @param string    字符串
 *  @param lineSpace 行间距
 *  @param kern      字间距
 *  @param font      字体大小
 *
 *  @return 富文本
 */
- (NSAttributedString *)getAttributedWithString:(NSString *)string WithLineSpace:(CGFloat)lineSpace kern:(CGFloat)kern font:(UIFont *)font{
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    //调整行间距
    paragraphStyle.lineSpacing = lineSpace;
    NSDictionary *attriDict = @{NSParagraphStyleAttributeName:paragraphStyle,NSKernAttributeName:@(kern),
                                NSFontAttributeName:font};
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:string attributes:attriDict];
    
    return attributedString;
}

/* 获取富文本的高度
 *
 * @param string    文字
 * @param lineSpace 行间距
 * @param kern      字间距
 * @param font      字体大小
 * @param width     文本宽度
 *
 * @return size
 */
- (CGSize)getAttributionHeightWithString:(NSString *)string lineSpace:(CGFloat)lineSpace kern:(CGFloat)kern font:(UIFont *)font width:(CGFloat)width {
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = lineSpace;
    NSDictionary *attriDict = @{
                                NSParagraphStyleAttributeName:paragraphStyle,
                                NSKernAttributeName:@(kern),
                                NSFontAttributeName:font};
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attriDict context:nil].size;
    return size;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    if ([[URL scheme] isEqualToString:@"checkbox"]) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.select = !self.select;
        [self setLinkText];//设置文本
        return NO;
    }else if([[URL scheme] isEqualToString:@"register"]){
        // 进入注册协议里去
        AggreMentViewController * AgVC =[[AggreMentViewController alloc]init];
        [self presentViewController:AgVC animated:YES completion:nil];
        
        
        
        return NO;
    }
    return YES;
}




// 注册点击
- (void)Re_btn_Touch
{
    
  
    [self Show_Succ];
    
    
    
}

// 提示

 - (void)Show_Succ
{
    // 注册成功
    UIView * Ev =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    Ev.backgroundColor =[[UIColor grayColor]colorWithAlphaComponent:0.9];
    [self.view addSubview:Ev];
    
    UIView * boxView =[[UIView alloc]init];
    boxView.layer.masksToBounds = YES;
    boxView.layer.cornerRadius =5;
    boxView.backgroundColor =[UIColor whiteColor];
    
    [Ev addSubview:boxView];
    [boxView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(Ev).offset(31);
        make.top.equalTo(Ev).offset(186);
        make.size.mas_equalTo(CGSizeMake(311, 199));
    }];
    
    NSString * ShowTx = NSLocalizedString(@"Regist_Suss", nil);
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:ShowTx attributes:nil];
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] initWithData:nil ofType:nil];
    textAttachment.image = [UIImage imageNamed:@"Regist_hud"];
    textAttachment.bounds =CGRectMake(0,-3, 20,20);
    NSAttributedString * textAttachmentString = [NSAttributedString attributedStringWithAttachment:textAttachment];
    string = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",ShowTx]attributes:nil];
    [string insertAttributedString:textAttachmentString atIndex:0];
    
    UILabel * TipLb =[[UILabel alloc]init];
    TipLb.attributedText = string;
    TipLb.textColor  = RGB(68, 68, 68);
    TipLb.font =[UIFont fontWithName:@"PingFangSC-Semibold" size:16];
    TipLb.lineBreakMode =NSLineBreakByCharWrapping;

    [self.view addSubview:TipLb];
    [TipLb mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(boxView).offset(68);
        make.top.equalTo(boxView).offset(46);
        
        
    }];
    
    UILabel * AccLb =[[UILabel alloc]init];
    AccLb.textColor = RGB(128, 128, 129);
    AccLb.font =[UIFont fontWithName:@"PingFangSC-Regular" size:14];
    AccLb.text =@"你的登录账号为：xxxxxxxxxx";
    [Ev addSubview:AccLb];
    
    [AccLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(TipLb.mas_bottom).offset(14);
        make.left.equalTo(boxView).offset(47);
        
    }];
    
    // 前往登录
    UIButton * Gobtn =[[UIButton alloc]init];
    Gobtn.layer.masksToBounds = YES;
    Gobtn.layer.cornerRadius = 5;
    Gobtn.backgroundColor = OrangerCol;
    [Gobtn addTarget:self action:@selector(GoRe) forControlEvents:UIControlEventTouchUpInside];
    [Gobtn setTitle:NSLocalizedString(@"Regist_Login", nil) forState:UIControlStateNormal];
    [self.view addSubview:Gobtn];
    
    [Gobtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(AccLb.mas_bottom).offset(39);
        make.left.equalTo(boxView).offset(79);
        make.width.equalTo(@140);
    }];
    
   
    
}

- (void)GoRe
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated
     ];
  
    
    
}


-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
  //  self.navigationController.navigationBarHidden = NO;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
