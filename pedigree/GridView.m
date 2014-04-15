//
//  GridView.m
//  pedigree
//
//  Created by Murali Tammineni on 3/11/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "GridView.h"
#import "RelationshipUtil.h"
#import "Relative.h"
#import "ContractedDisease.h"

#define kGraphHeight 1100
#define kDefaultGraphWidth 7520

//#define kOffsetX 10
#define kOffsetX 0
#define kStepX 80

#define kStepY 50
#define kOffsetY 10

#define kGraphBottom 20
#define kGraphTop 0

#define kCircleRadius 5

#define degreesToRadian(x) (M_PI * (x) / 180.0)

@implementation GridView

@synthesize relatives;

float data[] = {1.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0, 1.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 1.0, 0.0};
float lungData[] = {0.0, 0.0, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

NSArray *mainDiseasesArr;
NSArray *relationsArr;
int howMany;
NSArray *arrRelativeConditions;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*/// Redraws the view's contents immediately.
/// Serves the same purpose as the display method in GLKView.
/// Not to be confused with CALayer's display method.
- (void)display
{
    CALayer *layer = self.layer;
    [layer setNeedsDisplay];
    [layer displayIfNeeded];
}

/// Called by our CALayer when it wants us to draw (in compliance with the CALayerDelegate protocol).
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)context
{
    UIGraphicsPushContext(context);
    [self internalDrawWithRect:self.bounds];
    UIGraphicsPopContext();
}

/// Internal drawing method; naming's up to you.
- (void)drawRect:(CGRect)rect
{
    // @fillin: draw draw draw
}
 */

- (void)drawLineGraphWithContext:(CGContextRef)ctx
{
     CGContextSetFillColorWithColor(ctx, [[UIColor blackColor] CGColor]);
     
     mainDiseasesArr = @[@"No Known Conditions", @"Cancer", @"Clotting Disorder", @"Dementia/Alzheimers", @"Diabetes/Prediabetes/metabolic Syndrome", @"Gastrointestinal Disorder", @"Heart Disease", @"High Cholesterol", @"Hypertension", @"kidney Disease", @"Lung Disease", @"Osteoporosis", @"Psychological Disorder", @"Septecemia", @"Stroke/ Brain Attack", @"Sudden Infant Death Syndrome", @"Unknown Disease", @"Other-Add New"];
    
     //  int maxGraphHeight = kGraphHeight - kOffsetY;
     UIImage *image = [UIImage imageNamed:@"19-gear"];
  
    for (int i = 0; i< relatives.count; i++)
    {
        Relative* relative = [relatives objectAtIndex:i];
        arrRelativeConditions = [[relative.contractedDisease allObjects] mutableCopy];
        
        for (int c = 0; c < arrRelativeConditions.count; c++)
        {
            ContractedDisease* condition = [arrRelativeConditions objectAtIndex:c];
            int xCount = 0;
            for (int k = 0; k< mainDiseasesArr.count; k++)
            {
                //finding the list of sub_diseases
                NSString* path = [[NSBundle mainBundle] pathForResource:@"Diseases_Catalog_2" ofType:@"plist"];
                NSArray* arr = [NSArray arrayWithContentsOfFile:path];
                
                NSMutableArray* _subDiseasesArr = [[NSMutableArray alloc] init];
                for (NSDictionary *dict in arr) {
                    if ([[dict objectForKey:@"Disease_Number"] intValue]== k) {
                        _subDiseasesArr = (NSMutableArray *)[dict objectForKey:@"Disease_Sub_Category"];
                    }
                }
                
                if ([_subDiseasesArr count] > 0)
                {
                    for (int j = 0; j< [_subDiseasesArr count]; j++) {
                        
                        if ([[_subDiseasesArr objectAtIndex:j] isEqualToString:condition.name])
                        {
                            NSLog(@"The sub-disease at the index is: %@",  [_subDiseasesArr objectAtIndex:j]);
                            NSLog(@"The sub-condition name is: %@",  condition.name);
                            
                            NSLog(@"Drawing the marker");
                            float x = kOffsetX + (xCount * kStepX) + kStepX + kStepX/2;
                            float y = kOffsetY + (i * kStepY) + 50 ;
                            CGRect rect = CGRectMake(x - kCircleRadius, y - kCircleRadius, 2 * kCircleRadius, 2 * kCircleRadius);
                           // [image drawInRect:rect];
                            CGContextAddEllipseInRect(ctx, rect);
                        }
                        
                        xCount = xCount + 1;
                    }
                    
                }
                else
                {
                    if ([[mainDiseasesArr objectAtIndex:k] isEqualToString:condition.name])
                    {
                        float x = kOffsetX + (xCount * kStepX) + kStepX + kStepX/2;
                        float y = kOffsetY + (i * kStepY) + 50 ;
                        CGRect rect = CGRectMake(x - kCircleRadius, y - kCircleRadius, 2 * kCircleRadius, 2 * kCircleRadius);
                        [image drawInRect:rect];
                        CGContextAddEllipseInRect(ctx, rect);
                    }
                    xCount = xCount+1;
                }
                

                
            }

        }// END FOR CONTRACTED DISEASES
        
    }// END FOR RELATIVES
   
    CGContextDrawPath(ctx, kCGPathFillStroke);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //Preparation
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.6);
    CGContextSetStrokeColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
    
    CGFloat dash[] = {2.0, 2.0};
    CGContextSetLineDash(context, 0.0, dash, 2);
    
    //setting the arr with the list of main disease categories
    mainDiseasesArr = @[@"No Known Conditions", @"Cancer", @"Clotting Disorder", @"Dementia/Alzheimers", @"Diabetes/Prediabetes/metabolic Syndrome", @"Gastrointestinal Disorder", @"Heart Disease", @"High Cholesterol", @"Hypertension", @"kidney Disease", @"Lung Disease", @"Osteoporosis", @"Psychological Disorder", @"Septecemia", @"Stroke/ Brain Attack", @"Sudden Infant Death Syndrome", @"Unknown Disease", @"Other-Add New"];
    
    relationsArr = @[@"Father", @"Mother", @"Brother", @"Sister", @"Son", @"Daughter",
                     @"Patl' GF", @"Patl' GM", @"Patl' Uncle", @"Patl' Aunt",
                     @"Matl' GF", @"Matl' GM", @"Matl' Uncle", @"Matl' Aunt",
                     @"Nephew", @"Niece", @"Grandson", @"Granddaughter", @"Cousin", @"Half-Brother", @"Half-Sister"];
    
    // Here the lines go - both horizontal and vertical
    // Number of horizontal rows
    int howManyHorizontal = (int)[relatives count];
    for (int i = 0; i <= howManyHorizontal; i++)
    {
        CGContextMoveToPoint(context, kOffsetX, kGraphBottom + kOffsetY + i * kStepY);
        CGContextAddLineToPoint(context, kDefaultGraphWidth, kGraphBottom + kOffsetY + i * kStepY);
    }
    
    // Number of vertical rows
    int mainDiseasesCount = (int)[mainDiseasesArr count];
    howMany = 0;
    for (int i = 0; i< mainDiseasesCount; i++)
    {
        //finding the list of sub_diseases
        NSString* path = [[NSBundle mainBundle] pathForResource:@"Diseases_Catalog_2" ofType:@"plist"];
        NSArray* arr = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray* _subDiseasesArr = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in arr) {
            if ([[dict objectForKey:@"Disease_Number"] intValue]== i) {
                _subDiseasesArr = (NSMutableArray *)[dict objectForKey:@"Disease_Sub_Category"];
            }
        }
        if ([_subDiseasesArr count] > 0)
        {
            howMany = howMany + [_subDiseasesArr count];
        }
        else
        {
            howMany =  howMany + 1;
        }

    }
    
    // Here the lines go
    for (int i = 0; i < howMany; i++)
    {
        CGContextMoveToPoint(context, kOffsetX + i * kStepX, kGraphHeight);
        CGContextAddLineToPoint(context, kOffsetX + i * kStepX, kGraphBottom);
    }
    
    CGContextStrokePath(context);
    CGContextSetLineDash(context, 0, NULL, 0); // Remove the dash
    
    // Drawing the Text
    //Core Text (Create Attributed String)
    UIColor *textColor = [UIColor brownColor];
    CGColorRef color = textColor.CGColor;
    CTFontRef font = CTFontCreateWithName((CFStringRef) @"HelveticaNeue", 12.0, NULL);
    
    NSDictionary *attributesDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                    CFBridgingRelease(font), (NSString *)kCTFontAttributeName,
                                    color, (NSString *)kCTForegroundColorAttributeName,
                                    nil];
    
    for (int i = 0; i < mainDiseasesArr.count; i++)
    {
         //Drawing the Text for the x-axis
         NSString *xText = @"";
        int xCount = 0;
   
        for (int i = 0; i< mainDiseasesCount; i++)
        {
            //finding the list of sub_diseases
            NSString* path = [[NSBundle mainBundle] pathForResource:@"Diseases_Catalog_2" ofType:@"plist"];
            NSArray* arr = [NSArray arrayWithContentsOfFile:path];
            
            NSMutableArray* _subDiseasesArr = [[NSMutableArray alloc] init];
            for (NSDictionary *dict in arr) {
                if ([[dict objectForKey:@"Disease_Number"] intValue]== i) {
                    _subDiseasesArr = (NSMutableArray *)[dict objectForKey:@"Disease_Sub_Category"];
                }
            }
            if ([_subDiseasesArr count] > 0)
            {
                for (int j = 0; j< [_subDiseasesArr count]; j++) {
                    
                    xText = [_subDiseasesArr objectAtIndex:j];
                    NSAttributedString *stringToDraw = [[NSAttributedString alloc] initWithString:xText attributes:attributesDict];
                    [stringToDraw drawInRect:CGRectMake((kOffsetX+80) + xCount * kStepX, 0, 78, 78)];
                    
                    xCount = xCount + 1;
                }
            }
            else
            {
               xText = [mainDiseasesArr objectAtIndex:i];
               NSAttributedString *stringToDraw = [[NSAttributedString alloc] initWithString:xText attributes:attributesDict];
                [stringToDraw drawInRect:CGRectMake((kOffsetX+80) + xCount * kStepX, 0, 78, 78)];
            
               xCount = xCount+1;
            }
            
        }

    }
 
    for (int i = 0; i < [self.relatives count]; i++)
    {
        //Drawing the Text for the y-axis
        Relative *relative = (Relative *)[self.relatives objectAtIndex:i];
        NSString *yText = relative.firstName;
        
        NSAttributedString *stringToDraw = [[NSAttributedString alloc] initWithString:yText attributes:attributesDict];
        [stringToDraw drawInRect:CGRectMake(kOffsetY-8, (i*kStepY+50), 72, 48)];
    }
    
    //Actual Plot with the Circles
    [self drawLineGraphWithContext:context];
}

@end
