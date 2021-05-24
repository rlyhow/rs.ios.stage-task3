#import "LevelOrderTraversal.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    NSMutableArray *arrayWithIndexes = [[NSMutableArray alloc] init];
    
    int count = 0;
    NSNumber *numberValue;
    
    if (tree.count == 0 || [tree[0] isKindOfClass:[NSNull class]]) {
        return @[];
    }
    
    for (int i = 0; i < tree.count; i++) {
        
        if (![tree[i] isKindOfClass:[NSNull class]]) {
            
            numberValue = [NSNumber numberWithInt:count];
            
            if (![arrayWithIndexes containsObject:numberValue]) {
                [arrayWithIndexes addObject:numberValue];
                [result addObject: [NSMutableArray new]];
            }
            
            [result[count] addObject:tree[i]];
            count++;
        }
        
        if ([tree[i] isKindOfClass:[NSNull class]] && [tree[i+1] isKindOfClass:[NSNull class]]) {
            count--;
            i++;
        }
        
    }
    
    for (int i = 0; i < result.count; i++) {
        if ([result[i] count] == 0) {
            [result removeObject:result[i]];
        }
    }
    
    return result;
}
