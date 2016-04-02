//
//  LWVideoTool.m
//  XML练习
//
//  Created by 枫林晚 on 16/3/5.
//  Copyright © 2016年 方林威. All rights reserved.
//

#import "LWVideoTool.h"
#import "LWVideo.h"


@interface LWVideoTool ()<NSXMLParserDelegate>

/** 装所有模型 */
@property (nonatomic, strong) NSMutableArray *videos;

/** 用来拼接节点内容的字符串 */
@property (nonatomic, strong) NSMutableString *elementString;

/** 记录正在解析的videl模型 */
@property (nonatomic, strong) LWVideo *currentVideo;

@property (nonatomic, copy) void (^finished)(NSArray *);

@end

@implementation LWVideoTool

+ (void )videoWithUrlString:(NSString *)urlString finished:(void (^)(NSArray *))finished
{
    
    NSAssert(finished != nil, @"传入控制器刷新数据方法");
    
    LWVideoTool *tool = [[self alloc] init];
    
    tool.finished = finished;
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        //创建xml解析器
        NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
        
        //设置代理
        parser.delegate = tool;
        
        [parser parse];
    }];
    NSLog(@"2222222222%@",tool.videos);
}



#pragma mark - /********* NSXMLParserDelegate *********/
/**
 *  开始解析调用
 */
- (void)parserDidStartDocument:(NSXMLParser *)parser
{

}

/** 发现节点内容使用 该方法可能会调用多次 */
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{

    if ([elementName isEqualToString:@"video"])
    {
        //创建一个video模型
        self.currentVideo = [[LWVideo alloc] init];
        //设置id
        self.currentVideo.videoId = @(attributeDict[@"videoId"].intValue);
        //添加到数组
        [self.videos addObject:self.currentVideo];
        
    }
    [self.elementString setString:@""];
}


/** 发现节点内容 */
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [self.elementString appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"4.发现结束节点 elementName = %@",elementName);
    if ([elementName isEqualToString:@"video"] || [elementName isEqualToString:@"videos"]) return;
    
    //根据节点名称  设置模型值
    [self.currentVideo setValue:self.elementString.copy forKeyPath:elementName];
    
}

/** 解档结束 */
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        self.finished(self.videos);
    }];
    
}


#pragma mark - /********* 懒加载 *********/
- (NSMutableArray *)videos
{
    
    if (!_videos) {
        
        _videos = [NSMutableArray array];
    }
    return _videos;
}

- (NSMutableString *)elementString
{
    
    if (!_elementString) {
        
        _elementString = [[NSMutableString alloc] init];
    }
    return _elementString;
}
@end
