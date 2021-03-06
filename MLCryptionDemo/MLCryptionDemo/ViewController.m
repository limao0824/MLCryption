//
//  ViewController.m
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/2.
//  Copyright © 2018年 作者MannersLee. All rights reserved.
//

#import "ViewController.h"
#import "MLCryption.h"

@interface ViewController ()


/** MLMode加密的模型如，CBC，ECB等 */
@property (nonatomic, assign) MLMode mode;

/** MLAlgorithm采用什么加密，如AES,DES等 */
@property (nonatomic, assign) MLAlgorithm alg;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"一--------------------------------------------------------------");
    NSLog(@"一------------------下使用单个加密器使用-----------------------，加密");
    [self testDES];
    [self test3DES];
    [self testAES128];
    [self testCAST];
    [self testRC2];
    [self testBlowfish];
    
    NSLog(@"一--------------------------------------------------------------");
    NSLog(@"一------------------CBC—PK7模式下使用加密器-----------------------，加密");
    [self cryptor_des];
    [self cryptor_3des];
    [self cryptor_aes128];
    [self cryptor_cast];
    [self cryptor_rc2];
    [self cryptor_blowfish];
    
    NSLog(@"一--------------------------------------------------------------");
    NSLog(@"一------------------多参数下使用加密器-----------------------，加密");
    [self cryptor_des_moreParms];
    [self cryptor_3des_moreParms];
    [self cryptor_aes128_moreParms];
    [self cryptor_cast_moreParms];
    [self cryptor_rc2_moreParms];
    [self cryptor_blowfish_moreParms];

    
}

# pragma mark - 1.DES加密和解密 CBC->pkcs7padding->Base64->utf8编码
-(void)testDES
{
    NSString *str = @"代码测试";
    NSString *key = @"123456709";
        const void *iv = @"12345670";
//    const Byte iv[] = {1,2,3,4,5,6,7,8};

    MLCryption_DES *cryption = [MLCryption_DES cryptionDES_key:key iv:iv ivMode:ivString];
    NSString *crypStr = [cryption ml_encryptUseDes_StrToStr:str];
    NSString *deCrypStr = [cryption ml_decryptUseDes_StrToStr:crypStr];
    NSLog(@"DES-->>原文：%@，key：%@，iv：%@，加密后：%@,解密后：%@",str,key,iv,crypStr,deCrypStr);
}

# pragma mark - 1.3DES加密和解密
-(void)test3DES
{
    NSString *str = @"代码测试";
    NSString *key = @"123456789012345678909999";
    const void *iv = @"12345670999";
//    const void *iv = nil;
    //    const Byte iv[] = {1,2,3,4,5,6,7,8};
    
    MLCryption_3DES *cryption = [MLCryption_3DES cryption3DES_key:key iv:iv ivMode:ivString];
    NSString *crypStr = [cryption ml_encryptUse3DES_StrToStr:str];
    NSString *deCrypStr = [cryption ml_decryptUse3DES_StrToStr:crypStr];
    NSLog(@"3DES-->>原文：%@，key：%@，iv：%@，加密后：%@,解密后：%@",str,key,iv,crypStr,deCrypStr);
}

# pragma mark - 1.AES128加密和解密
-(void)testAES128
{
    NSString *str = @"代码测试";
    NSString *key = @"123456789012345699";
    const void *iv = @"1234567890123456";
    //    const void *iv = nil;
    //    const Byte iv[] = {1,2,3,4,5,6,7,8};
    
    MLCryption_AES128 *cryption = [MLCryption_AES128 cryptionAES128_key:key iv:iv ivMode:ivString];
    NSString *crypStr = [cryption ml_encryptUseAES128_StrToStr:str];
    NSString *deCrypStr = [cryption ml_decryptUseAES128_StrToStr:crypStr];
    NSLog(@"AES128-->>原文：%@，key：%@，iv：%@，加密后：%@,解密后：%@",str,key,iv,crypStr,deCrypStr);
}

# pragma mark - 1.CAST加密和解密
-(void)testCAST
{
    NSString *str = @"代码测试";
    NSString *key = @"1234567890123456";
    const void *iv = @"12345678";
    //    const void *iv = nil;
    //    const Byte iv[] = {1,2,3,4,5,6,7,8};
    
    //    MLCryptor *cryption = [[MLCryptor alloc] initWith_CAST_Mode:kMLModeCBC MLPadding:MLPKCS7Padding key:key iv:iv ivMode:ivString];
    MLCryption_CAST *cryptor = [MLCryption_CAST cryptionCAST_key:key iv:iv ivMode:ivString];
    NSString *crypStr = [cryptor ml_encryptUseCAST_StrToStr:str];
    NSString *deCrypStr = [cryptor ml_decryptUseCAST_StrToStr:crypStr];
    NSLog(@"CAST-->>原文：%@，key：%@，iv：%@，加密后：%@,解密后：%@",str,key,iv,crypStr,deCrypStr);
}

# pragma mark - 1.RC2加密和解密
-(void)testRC2
{
    NSString *str = @"代码测试";
    //128为key
    NSString *key = @"12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345670";
    const void *iv = @"12345678";
    //    const void *iv = nil;
    //    const Byte iv[] = {1,2,3,4,5,6,7,8};
    
    MLCryption_RC2 *cryption = [MLCryption_RC2 cryptionRC2_key:key iv:iv ivMode:ivString];
    NSString *crypStr = [cryption ml_encryptUseRC2_StrToStr:str];
    NSString *deCrypStr = [cryption ml_decryptUseRC2_StrToStr:crypStr];
    NSLog(@"RC2-->>原文：%@，key：%@，iv：%@，加密后：%@,解密后：%@",str,key,iv,crypStr,deCrypStr);
}

# pragma mark - 1.Blowfish加密和解密
-(void)testBlowfish
{
    NSString *str = @"代码测试";
    //56位key
    NSString *key = @"12345678901234567890123456789012345678901234567890123456";
    const void *iv = @"12345678";
    //    const void *iv = nil;
    //    const Byte iv[] = {1,2,3,4,5,6,7,8};
    
    MLCryption_Blowfish *cryption = [MLCryption_Blowfish cryptionBlowfish_key:key iv:iv ivMode:ivString];
    NSString *crypStr = [cryption ml_encryptUseBlowfish_StrToStr:str];
    NSString *deCrypStr = [cryption ml_decryptUseBlowfish_StrToStr:crypStr];
    NSLog(@"Blowfish-->>原文：%@，key：%@，iv：%@，加密后：%@,解密后：%@",str,key,iv,crypStr,deCrypStr);
}

# pragma mark - 1.cryptor加密器的使用CBC-pk7
- (void)cryptor_des
{
    NSString *str = @"代码测试";
    NSString *key = @"123456709";
    const void *iv = @"12345670";
    //    const Byte iv[] = {1,2,3,4,5,6,7,8};
    
    MLCryptor *cryptorCBC_PK7 = [MLCryptor cryptorCommonMethodCBC_PK7WithAlgorithm:kMLAlgorithmDES key:key keySize:kMLKeySizeDES iv:iv ivMode:ivString ivSize:kMLBlockSizeDES];
    NSString *crypStr = [cryptorCBC_PK7 ml_encryptCommonMethod_StrToStr:str];
    NSString *deCrypStr = [cryptorCBC_PK7 ml_decryptCommonMethod_StrToStr:crypStr];
    NSLog(@"cryptor_des-->>原文：%@，key：%@，iv：%@，加密后：%@,解密后：%@",str,key,iv,crypStr,deCrypStr);
}

- (void)cryptor_3des
{
    NSString *str = @"代码测试";
    NSString *key = @"123456789012345678909999";
    const void *iv = @"12345670999";
    
    MLCryptor *cryptorCBC_PK7 = [MLCryptor cryptorCommonMethodCBC_PK7WithAlgorithm:kMLAlgorithm3DES key:key keySize:kMLKeySize3DES iv:iv ivMode:ivString ivSize:kMLBlockSize3DES];
    NSString *crypStr = [cryptorCBC_PK7 ml_encryptCommonMethod_StrToStr:str];
    NSString *deCrypStr = [cryptorCBC_PK7 ml_decryptCommonMethod_StrToStr:crypStr];
    NSLog(@"cryptor_3des-->>原文：%@，key：%@，iv：%@，加密后：%@,解密后：%@",str,key,iv,crypStr,deCrypStr);
}

- (void)cryptor_aes128
{
    NSString *str = @"代码测试";
    NSString *key = @"123456789012345699";
    const void *iv = @"1234567890123456";
    
    MLCryptor *cryptorCBC_PK7 = [MLCryptor cryptorCommonMethodCBC_PK7WithAlgorithm:kMLAlgorithmAES128 key:key keySize:kMLKeySizeAES128 iv:iv ivMode:ivString ivSize:kMLBlockSizeAES128];
    NSString *crypStr = [cryptorCBC_PK7 ml_encryptCommonMethod_StrToStr:str];
    NSString *deCrypStr = [cryptorCBC_PK7 ml_decryptCommonMethod_StrToStr:crypStr];
    NSLog(@"cryptor_aes128-->>原文：%@，key：%@，iv：%@，加密后：%@,解密后：%@",str,key,iv,crypStr,deCrypStr);
}
- (void)cryptor_cast
{
    NSString *str = @"代码测试";
    NSString *key = @"123456789012345699";
    const void *iv = @"1234567890123456";
    
    MLCryptor *cryptorCBC_PK7 = [MLCryptor cryptorCommonMethodCBC_PK7WithAlgorithm:kMLAlgorithmCAST key:key keySize:kMLKeySizeMaxCAST iv:iv ivMode:ivString ivSize:kMLBlockSizeCAST];
    NSString *crypStr = [cryptorCBC_PK7 ml_encryptCommonMethod_StrToStr:str];
    NSString *deCrypStr = [cryptorCBC_PK7 ml_decryptCommonMethod_StrToStr:crypStr];
    NSLog(@"cryptor_cast-->>原文：%@，key：%@，iv：%@，加密后：%@,解密后：%@",str,key,iv,crypStr,deCrypStr);
}
- (void)cryptor_rc2
{
    NSString *str = @"代码测试";
    //128为key
    NSString *key = @"12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345670";
    const void *iv = @"12345678";
    
    MLCryptor *cryptorCBC_PK7 = [MLCryptor cryptorCommonMethodCBC_PK7WithAlgorithm:kMLAlgorithmRC2 key:key keySize:kMLKeySizeMaxRC2 iv:iv ivMode:ivString ivSize:kMLBlockSizeRC2];
    NSString *crypStr = [cryptorCBC_PK7 ml_encryptCommonMethod_StrToStr:str];
    NSString *deCrypStr = [cryptorCBC_PK7 ml_decryptCommonMethod_StrToStr:crypStr];
    NSLog(@"cryptor_rc2-->>原文：%@，key：%@，iv：%@，加密后：%@,解密后：%@",str,key,iv,crypStr,deCrypStr);
}
- (void)cryptor_blowfish
{
    NSString *str = @"代码测试";
    //56位key
    NSString *key = @"12345678901234567890123456789012345678901234567890123456";
    const void *iv = @"12345678";
    
    MLCryptor *cryptorCBC_PK7 = [MLCryptor cryptorCommonMethodCBC_PK7WithAlgorithm:kMLAlgorithmBlowfish key:key keySize:kMLKeySizeMaxBlowfish iv:iv ivMode:ivString ivSize:kMLBlockSizeBlowfish];
    NSString *crypStr = [cryptorCBC_PK7 ml_encryptCommonMethod_StrToStr:str];
    NSString *deCrypStr = [cryptorCBC_PK7 ml_decryptCommonMethod_StrToStr:crypStr];
    NSLog(@"cryptor_blowfish-->>原文：%@，key：%@，iv：%@，加密后：%@,解密后：%@",str,key,iv,crypStr,deCrypStr);
}

#pragma mark - 多参数加密器的使用

- (void)cryptor_des_moreParms
{
    NSString *str = @"代码测试";
    NSString *key = @"123456709";
    const void *iv = @"12345670";
    //    const Byte iv[] = {1,2,3,4,5,6,7,8};
    
    #pragma mark - ECB模式下：不用向量iv= nil，
//    MLCryptor *cryptor_moreParms = [MLCryptor cryptorCommonMethodWithMode:kMLModeECB Algorithm:kMLAlgorithmDES Padding:MLPKCS7Padding iv:nil  ivSize:(MLIvSize)kMLBlockSizeDES ivMode:ivString key:key keySize:kMLKeySizeDES tweak:NULL tweakSize:0 numRounds:0 ModeOptions:0];
    
    #pragma mark - CBC模式下：
    MLCryptor *cryptor_moreParms = [MLCryptor cryptorCommonMethodWithMode:kMLModeCBC Algorithm:kMLAlgorithmDES Padding:MLPKCS7Padding iv:iv  ivSize:(MLIvSize)kMLBlockSizeDES ivMode:ivString key:key keySize:kMLKeySizeDES tweak:NULL tweakSize:0 numRounds:0 ModeOptions:0];
    
    #pragma mark - CFB模式下：MLNoPadding「不用补位」,注意其它平台是用CFB,还是CFB8模式「与http://tool.chacuo.net/cryptdes，测试出来结果少几个字符串。待解决」
//    MLCryptor *cryptor_moreParms = [MLCryptor cryptorCommonMethodWithMode:kMLModeCFB8 Algorithm:kMLAlgorithmDES Padding:MLNoPadding iv:iv  ivSize:(MLIvSize)kMLBlockSizeDES  ivMode:ivString key:key keySize:kMLKeySizeDES tweak:NULL tweakSize:0 numRounds:0 ModeOptions:0];
    
    #pragma mark - OFB模式下：MLNoPadding「不用补位」「与http://tool.chacuo.net/cryptdes，测试出来结果不一样。待解决」
//        MLCryptor *cryptor_moreParms = [MLCryptor cryptorCommonMethodWithMode:kMLModeOFB Algorithm:kMLAlgorithmDES Padding:MLNoPadding iv:iv  ivSize:(MLIvSize)kMLBlockSizeDES ivMode:ivString key:key keySize:kMLKeySizeDES tweak:NULL tweakSize:0 numRounds:0 ModeOptions:0];
    
    #pragma mark - CTR模式下：MLNoPadding「不用补位」，ModeOptions为「kMLModeOptionCTR_BE」「与http://tool.chacuo.net/cryptdes，测试出来结果少几个字符串。待解决」
//    MLCryptor *cryptor_moreParms = [MLCryptor cryptorCommonMethodWithMode:kMLModeCTR Algorithm:kMLAlgorithmDES Padding:MLNoPadding iv:iv  ivSize:(MLIvSize)kMLBlockSizeDES ivMode:ivString key:key keySize:kMLKeySizeDES tweak:NULL tweakSize:0 numRounds:0 ModeOptions:kMLModeOptionCTR_BE];
    
    
    NSString *crypStr = [cryptor_moreParms ml_encryptCommonMethod_StrToStr:str];
    NSString *deCrypStr = [cryptor_moreParms ml_decryptCommonMethod_StrToStr:crypStr];
    NSLog(@"cryptor_des_moreParms-->>原文：%@，key：%@，iv：%@，加密后：%@,解密后：%@",str,key,iv,crypStr,deCrypStr);
}

- (void)cryptor_3des_moreParms
{
    NSString *str = @"代码测试";
    NSString *key = @"123456789012345678909999";
    const void *iv = @"12345670999";
    
    MLCryptor *cryptor_moreParms = [MLCryptor cryptorCommonMethodWithMode:kMLModeCBC Algorithm:kMLAlgorithm3DES Padding:MLPKCS7Padding iv:iv  ivSize:(MLIvSize)kMLBlockSize3DES  ivMode:ivString key:key keySize:kMLKeySize3DES tweak:NULL tweakSize:0 numRounds:0 ModeOptions:0];
    NSString *crypStr = [cryptor_moreParms ml_encryptCommonMethod_StrToStr:str];
    NSString *deCrypStr = [cryptor_moreParms ml_decryptCommonMethod_StrToStr:crypStr];
    NSLog(@"cryptor_3des_moreParms-->>原文：%@，key：%@，iv：%@，加密后：%@,解密后：%@",str,key,iv,crypStr,deCrypStr);
}

- (void)cryptor_aes128_moreParms
{
    NSString *str = @"代码测试";
    NSString *key = @"123456789012345699";
    const void *iv = @"1234567890123456";
    
    MLCryptor *cryptor_moreParms = [MLCryptor cryptorCommonMethodWithMode:kMLModeCBC Algorithm:kMLAlgorithmAES128 Padding:MLPKCS7Padding iv:iv ivSize:(MLIvSize)kMLBlockSizeAES128 ivMode:ivString key:key keySize:kMLKeySizeAES128 tweak:NULL tweakSize:0 numRounds:0 ModeOptions:0];
    NSString *crypStr = [cryptor_moreParms ml_encryptCommonMethod_StrToStr:str];
    NSString *deCrypStr = [cryptor_moreParms ml_decryptCommonMethod_StrToStr:crypStr];
    NSLog(@"cryptor_aes128_moreParms-->>原文：%@，key：%@，iv：%@，加密后：%@,解密后：%@",str,key,iv,crypStr,deCrypStr);
}

- (void)cryptor_cast_moreParms
{
    NSString *str = @"代码测试";
    NSString *key = @"123456789012345699";
    const void *iv = @"1234567890123456";
    
    MLCryptor *cryptor_moreParms = [MLCryptor cryptorCommonMethodWithMode:kMLModeCBC Algorithm:kMLAlgorithmCAST Padding:MLPKCS7Padding iv:iv ivSize:(MLIvSize)kMLBlockSizeCAST ivMode:ivString key:key keySize:kMLKeySizeMaxCAST tweak:NULL tweakSize:0 numRounds:0 ModeOptions:0];
    NSString *crypStr = [cryptor_moreParms ml_encryptCommonMethod_StrToStr:str];
    NSString *deCrypStr = [cryptor_moreParms ml_decryptCommonMethod_StrToStr:crypStr];
    NSLog(@"cryptor_cast_moreParms-->>原文：%@，key：%@，iv：%@，加密后：%@,解密后：%@",str,key,iv,crypStr,deCrypStr);
}
- (void)cryptor_rc2_moreParms
{
    NSString *str = @"代码测试";
    //128为key
    NSString *key = @"12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345670";
    const void *iv = @"12345678";
    
    MLCryptor *cryptor_moreParms = [MLCryptor cryptorCommonMethodWithMode:kMLModeCBC Algorithm:kMLAlgorithmRC2 Padding:MLPKCS7Padding iv:iv ivSize:(MLIvSize)kMLBlockSizeRC2 ivMode:ivString key:key keySize:kMLKeySizeMaxRC2 tweak:NULL tweakSize:0 numRounds:0 ModeOptions:0];
    NSString *crypStr = [cryptor_moreParms ml_encryptCommonMethod_StrToStr:str];
    NSString *deCrypStr = [cryptor_moreParms ml_decryptCommonMethod_StrToStr:crypStr];
    NSLog(@"cryptor_rc2_moreParms-->>原文：%@，key：%@，iv：%@，加密后：%@,解密后：%@",str,key,iv,crypStr,deCrypStr);
}
- (void)cryptor_blowfish_moreParms
{
    NSString *str = @"代码测试";
    //56位key
    NSString *key = @"12345678901234567890123456789012345678901234567890123456";
    const void *iv = @"12345678";
    
    MLCryptor *cryptor_moreParms = [MLCryptor cryptorCommonMethodWithMode:kMLModeCBC Algorithm:kMLAlgorithmBlowfish Padding:MLPKCS7Padding iv:iv ivSize:(MLIvSize)kMLBlockSizeBlowfish ivMode:ivString key:key keySize:kMLKeySizeMaxBlowfish tweak:NULL tweakSize:0 numRounds:0 ModeOptions:0];
    NSString *crypStr = [cryptor_moreParms ml_encryptCommonMethod_StrToStr:str];
    NSString *deCrypStr = [cryptor_moreParms ml_decryptCommonMethod_StrToStr:crypStr];
    NSLog(@"cryptor_blowfish_moreParms-->>原文：%@，key：%@，iv：%@，加密后：%@,解密后：%@",str,key,iv,crypStr,deCrypStr);
}


/** 将字符串编码测试 */
-(void)testBase64_String
{
//        NSString *str = @"MannersLee";
//    NSString *str = @"中华人民共和国万岁！";
    //类方法
//        NSString *crypStr = [NSString ml_encodeStringUseBase64:str];
//        NSString *deCrypStr = [NSString ml_decodeStringUseBase64:crypStr];
    //对象方法
//    NSString *crypStr = [str ml_encodeStringUseBase64];
//    NSString *deCrypStr = [crypStr ml_decodeStringUseBase64];
    
//        NSLog(@"Base64-->>原文：%@，加密后：%@,解密后：%@",str,crypStr,deCrypStr);
    //类方法
//        NSData *crypStrData = [NSString ml_encodeDataUseBase64:str];//编码
//        NSString *deCrypStrString = [NSData ml_decodeStringUseBase64:crypStrData];//解码
    //对象方法
//        NSData *crypStrData = [str ml_encodeDataUseBase64];
//        NSString *deCrypStrString = [crypStrData ml_decodeStringUseBase64];
//        NSLog(@"Base64-->>原文：%@，加密后：%@,解密后：%@",str,crypStrData,deCrypStrString);
    
//     NSString *crypStr = [NSString ml_encodeStringUseBase64:str];//加密后的String
    
//     NSData *data = [NSString ml_decodeDataUseBase64:crypStr];
//     NSData *data = [crypStr ml_decodeDataUseBase64];
//     NSString *deCrypStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
//     NSLog(@"Base64-->>原文：%@，加密后：%@,解密后：%@,解密后的String：%@",str,crypStr,data,deCrypStr);
}

/** 将NSData编码测试 */
- (void)testBase64_Data
{
    // 获取需要加密文件的二进制数据
//    NSData *data = [NSData dataWithContentsOfFile:@"/Users/mtapple/Desktop/icon_long_task.png"];
//    
//    // 或 base64EncodedStringWithOptions
////    NSData *base64Data = [data base64EncodedDataWithOptions:0];
////    NSData *cryData = [data ml_encodeDataUseBase64];
//    NSData *cryData = [NSData ml_encodeDataUseBase64:data];
//    
//    // 将加密后的文件存储到桌面
//    [cryData writeToFile:@"/Users/mtapple/Desktop/220.jpg" atomically:YES];
//    
//    // 获得加密后的二进制数据
//    NSData *cryData2 = [NSData dataWithContentsOfFile:@"/Users/mtapple/Desktop/220.jpg"];
//    // 解密 base64 数据
////    NSData *baseDataDE = [NSData ml_decodeDataUseBase64:cryData];
//     NSData *baseDataDE = [cryData2 ml_decodeDataUseBase64];
//    //
//    //    // 写入桌面
//    [baseDataDE writeToFile:@"/Users/mtapple/Desktop/解密图片33.jpg" atomically:YES];
    
    
//    NSString *str = @"中华人民共和国万岁！";
//    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    //    NSString *cryStr = [NSData ml_encodeStringUseBase64:data];
//        NSString *cryStr = [data ml_encodeStringUseBase64];
    
//    NSString *decStr = [cryStr ml_decodeStringUseBase64];
//    NSLog(@"Base64-->>原文：%@，加密后：%@,解密后：%@,data：%@",str,cryStr,decStr,data);
}

@end
