#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSRange range;
    NSString *character;
    NSMutableArray *mutableArrayOne = [[NSMutableArray alloc] init];
    NSMutableArray *mutableArrayTwo = [[NSMutableArray alloc] init];
    NSMutableArray *mutableArrayThree = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < string1.length; i++) {
        range = NSMakeRange(i, 1);
        character = [string1 substringWithRange:range];
        [mutableArrayOne addObject:character];
    }
    
    for (int i = 0; i < string2.length; i++) {
        range = NSMakeRange(i, 1);
        character = [string2 substringWithRange:range];
        [mutableArrayTwo addObject:character];
    }
    NSLog(@"%@", mutableArrayOne);
    NSLog(@"%@", mutableArrayTwo);
    
    while (true) {
        if (mutableArrayOne.count > 0 && mutableArrayTwo.count > 0) {
            if ([mutableArrayOne[0] compare:mutableArrayTwo[0]] != NSOrderedDescending) {
                [mutableArrayThree addObject:mutableArrayOne[0]];
                [mutableArrayOne removeObjectAtIndex:0];
            } else {
                [mutableArrayThree addObject:mutableArrayTwo[0]];
                [mutableArrayTwo removeObjectAtIndex:0];
            }
        }
        
        if (mutableArrayOne.count == 0) {
            for (int i = 0; i < mutableArrayTwo.count; i++) {
                [mutableArrayThree addObject:mutableArrayTwo[0]];
                [mutableArrayTwo removeObjectAtIndex:0];
            }
        }
        
        if (mutableArrayTwo.count == 0) {
            for (int i = 0; i < mutableArrayOne.count; i++) {
                [mutableArrayThree addObject:mutableArrayOne[0]];
                [mutableArrayOne removeObjectAtIndex:0];
            }
        }
        
        if (mutableArrayOne.count == 0 && mutableArrayTwo.count == 0) {
            NSString *string = [mutableArrayThree componentsJoinedByString:@""];
            return string;
        }
        
    }
    
    
    
    return nil;
}

@end
