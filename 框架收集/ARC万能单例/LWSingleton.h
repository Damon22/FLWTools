// 头文件使用的宏
// ## 表示拼接前后两个字符串
#define LWSingleton_H(name)  + (instancetype)shared##name;

#if __has_feature(objc_arc) // 是arc环境
#define LWSingleton_M(name)                                                           \
    static id instance = nil;                                                         \
    + (instancetype)shared##name {                                                    \
        return [[self alloc] init];                                                   \
    }                                                                                 \
                                                                                      \
    + (instancetype)allocWithZone:(struct _NSZone *)zone {                            \
        static dispatch_once_t onceToken;                                             \
        dispatch_once(&onceToken, ^{                                                  \
            instance = [super allocWithZone:zone];                                    \
        });                                                                           \
        return instance;                                                              \
    }                                                                                 \
                                                                                      \
    - (id)copyWithZone:(nullable NSZone *)zone {                                      \
        return self;                                                                  \
    }
#else // MRC环境
#define LWSingleton_M(name)                                                           \
    static id instance = nil;                                                         \
    + (instancetype)shared##name {                                                    \
        return [[self alloc] init];                                                   \
    }                                                                                 \
                                                                                      \
    + (instancetype)allocWithZone:(struct _NSZone *)zone {                            \
        static dispatch_once_t onceToken;                                             \
        dispatch_once(&onceToken, ^{                                                  \
            instance = [super allocWithZone:zone];                                    \
        });                                                                           \
        return instance;                                                              \
    }                                                                                 \
                                                                                      \
    - (id)copyWithZone:(nullable NSZone *)zone {                                      \
        return self;                                                                  \
    }                                                                                 \
                                                                                      \
    - (instancetype)autorelease {                                                     \
        return self;                                                                  \
    }                                                                                 \
                                                                                      \
    - (instancetype)retain {                                                          \
        return self;                                                                  \
    }                                                                                 \
                                                                                      \
    - (oneway void)release {                                                          \
                                                                                      \
    }                                                                                 \
                                                                                      \
    - (NSUInteger)retainCount {                                                       \
        return 1;                                                                     \
    }                                                                                 
#endif