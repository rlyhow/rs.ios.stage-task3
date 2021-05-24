#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    
    NSInteger result = 0;
    int border = 0;
    
    if (ratingArray.count < 3) {
        return 0;
    } else {
        
        for (int i = 0; i < ratingArray.count - 2; i++) {
            
            border = i + 1;
            
            while (border < ratingArray.count - 1) {
                
                if ([ratingArray[i] intValue] < [ratingArray[border] intValue]) {
                    
                    for (int k = border; k < ratingArray.count - 1; k++) {
                        
                        if ([ratingArray[border] intValue] < [ratingArray[k+1] intValue]) {
                            result++;
                        }
                    }
                    
                    border++;
                    
                } else {
                    for (int k = border; k < ratingArray.count - 1; k++) {
                        
                        if ([ratingArray[border] intValue] > [ratingArray[k+1] intValue]) {
                            result++;
                        }
                    }
                    
                    border++;
                }
                
            }
            
        }
        
    }
    
    return result;
}

@end
