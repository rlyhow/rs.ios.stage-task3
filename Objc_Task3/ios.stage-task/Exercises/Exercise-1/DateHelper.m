#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    NSString *result = nil;
    
    switch (monthNumber) {
        case 1:
            result = @"January";
            break;
        case 2:
            result = @"February";
            break;
        case 3:
            result = @"March";
            break;
        case 4:
            result = @"April";
            break;
        case 5:
            result = @"May";
            break;
        case 6:
            result = @"June";
            break;
        case 7:
            result = @"July";
            break;
        case 8:
            result = @"August";
            break;
        case 9:
            result = @"September";
            break;
        case 10:
            result = @"October";
            break;
        case 11:
            result = @"November";
            break;
        case 12:
            result = @"December";
            break;
            
        default:
            break;
    }
    
    return result;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSString *dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;
    NSDate *dateFromString = [dateFormatter dateFromString:date];
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitDay fromDate:dateFromString];
    
    NSInteger day = [component day];
    
    return day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitWeekday fromDate:date];
    
    NSInteger weekDay = [component weekday];
    NSString *result = nil;
    
    switch (weekDay) {
        case 2:
            result = @"Пн";
            break;
        case 3:
            result = @"Вт";
            break;
        case 4:
            result = @"Ср";
            break;
        case 5:
            result = @"Чт";
            break;
        case 6:
            result = @"Пт";
            break;
        case 7:
            result = @"Сб";
            break;
        case 1:
            result = @"Вс";
            break;
            
        default:
            break;
    }
    
    return result;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    calendar.firstWeekday = 2;
    NSDateComponents *component = [calendar components:NSCalendarUnitWeekOfYear fromDate:date];
    NSInteger weekOfYear = [component weekOfYear];
    
    NSDate *currentDateNow = [NSDate now];
    NSCalendar *calendarNow = [NSCalendar autoupdatingCurrentCalendar];
    calendarNow.firstWeekday = 2;
    NSDateComponents *componentNow = [calendarNow components:NSCalendarUnitWeekOfYear fromDate:currentDateNow];
    NSInteger weekOfYearNow = [componentNow weekOfYear];
    
    if (weekOfYear == weekOfYearNow) {
        return YES;
    }
    
    return NO;
}

@end
