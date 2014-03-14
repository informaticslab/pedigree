//
//  GridView.m
//  pedigree
//
//  Created by Murali Tammineni on 3/11/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "GridView.h"
#import "RelationshipUtil.h"

#define kGraphHeight 600
#define kDefaultGraphWidth 1400

//#define kOffsetX 10
#define kOffsetX 0
#define kStepX 50

#define kStepY 50
#define kOffsetY 10

#define kGraphBottom 20
#define kGraphTop 0

#define kCircleRadius 10

@implementation GridView

float data[] = {1.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0, 1.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 1.0, 0.0};
float lungData[] = {0.0, 0.0, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

//RelationshipUtil *relUtil;
NSArray *mainDiseasesArr;
NSArray *relationsArr;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawLineGraphWithContext:(CGContextRef)ctx
{
  /*  CGContextSetFillColorWithColor(ctx, [[UIColor colorWithRed:1.0 green:0.5 blue:0 alpha:1.0] CGColor]);
    
    int maxGraphHeight = kGraphHeight - kOffsetY;
    for (int i = 1; i < sizeof(data) - 1; i++)
    {
        float x = kOffsetX-30 + i * kStepX;
        float y = kGraphHeight - maxGraphHeight * data[i];
        CGRect rect = CGRectMake(x - kCircleRadius, y - kCircleRadius, 2 * kCircleRadius, 2 * kCircleRadius);
        CGContextAddEllipseInRect(ctx, rect);
    }
    CGContextDrawPath(ctx, kCGPathFillStroke);
   */
    
 /*   CGContextSetFillColorWithColor(ctx, [[UIColor colorWithRed:1.0 green:0.5 blue:0 alpha:1.0] CGColor]);
    
    mainDiseasesArr = @[@"No Known Conditions", @"Cancer", @"Clotting Disorder", @"Dementia/Alzheimers", @"Diabetes/Prediabetes/metabolic Syndrome", @"Gastrointestinal Disorder", @"Heart Disease", @"High Cholesterol", @"Hypertension", @"kidney Disease", @"Lung Disease", @"Osteoporosis", @"Psychological Disorder", @"Septecemia", @"Stroke/ Brain Attack", @"Sudden Infant Death Syndrome", @"Unknown Disease", @"Other-Add New"];
    
    relationsArr = @[@"Father", @"Mother", @"Brother", @"Sister", @"Son", @"Daughter",
                     @"Patl' GF", @"Patl' GM", @"Patl' Uncle", @"Patl' Aunt",
                     @"Matl' GF", @"Matl' GM", @"Matl' Uncle", @"Matl' Aunt",
                     @"Nephew", @"Niece", @"Grandson", @"Granddaughter", @"Cousin", @"Half-Brother", @"Half-Sister"];
    
    //  int maxGraphHeight = kGraphHeight - kOffsetY;
    for (int i = 0; i < relationsArr.count; i++)
    {
        float theValue = data[i];
        if (theValue == 1.0) {
            
            // let us say, the heart disease is at the 4th index.
            float x = kOffsetX + (4 * kStepX) + 50 + 25;
            float y = kOffsetY + (i * kStepY) + 50 ;
            CGRect rect = CGRectMake(x - kCircleRadius, y - kCircleRadius, 2 * kCircleRadius, 2 * kCircleRadius);
            CGContextAddEllipseInRect(ctx, rect);
        }
        else if (theValue == 0.0) {
            // do nothing
        }
    }
    CGContextDrawPath(ctx, kCGPathFillStroke);
  */
    
     CGContextSetFillColorWithColor(ctx, [[UIColor colorWithRed:1.0 green:0.5 blue:0 alpha:1.0] CGColor]);
     
     mainDiseasesArr = @[@"No Known Conditions", @"Cancer", @"Clotting Disorder", @"Dementia/Alzheimers", @"Diabetes/Prediabetes/metabolic Syndrome", @"Gastrointestinal Disorder", @"Heart Disease", @"High Cholesterol", @"Hypertension", @"kidney Disease", @"Lung Disease", @"Osteoporosis", @"Psychological Disorder", @"Septecemia", @"Stroke/ Brain Attack", @"Sudden Infant Death Syndrome", @"Unknown Disease", @"Other-Add New"];
     
     relationsArr = @[@"Father", @"Mother", @"Brother", @"Sister", @"Son", @"Daughter",
     @"Patl' GF", @"Patl' GM", @"Patl' Uncle", @"Patl' Aunt",
     @"Matl' GF", @"Matl' GM", @"Matl' Uncle", @"Matl' Aunt",
     @"Nephew", @"Niece", @"Grandson", @"Granddaughter", @"Cousin", @"Half-Brother", @"Half-Sister"];
     
     //  int maxGraphHeight = kGraphHeight - kOffsetY;
     for (int i = 0; i < relationsArr.count; i++)
     {
         
         for (int j = 0; j < mainDiseasesArr.count; j++) {
             
             if(j == 1){
                 float theValue = data[i];
                 if (theValue == 1.0)
                 {
                     // let us say, the heart disease is at the 4th index.
                     float x = kOffsetX + (j * kStepX) + 50 + 25;
                     float y = kOffsetY + (i * kStepY) + 50 ;
                     CGRect rect = CGRectMake(x - kCircleRadius, y - kCircleRadius, 2 * kCircleRadius, 2 * kCircleRadius);
                     CGContextAddEllipseInRect(ctx, rect);
                 }
                 else if (theValue == 0.0) {
                     // do nothing
                 }
             }
             else if(j == 3)
             {
                 float theValue = lungData[i];
                 if (theValue == 1.0)
                 {
                     // let us say, the heart disease is at the 4th index.
                     float x = kOffsetX + (j * kStepX) + 50 + 25;
                     float y = kOffsetY + (i * kStepY) + 50 ;
                     CGRect rect = CGRectMake(x - kCircleRadius, y - kCircleRadius, 2 * kCircleRadius, 2 * kCircleRadius);
                     CGContextAddEllipseInRect(ctx, rect);
                 }
                 else if (theValue == 0.0) {
                     // do nothing
                 }
             }
         }
        
     }// END FOR LOOP
    
     CGContextDrawPath(ctx, kCGPathFillStroke);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
 /*   // Drawing code
    //Preparation
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.6);
    CGContextSetStrokeColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
    
    CGFloat dash[] = {2.0, 2.0};
    CGContextSetLineDash(context, 0.0, dash, 2);
    
    int howManyHorizontal = (kGraphBottom - kGraphTop - kOffsetY) / kStepY;
    for (int i = 0; i <= howManyHorizontal; i++)
    {
        CGContextMoveToPoint(context, kOffsetX, kGraphBottom - kOffsetY - i * kStepY);
        CGContextAddLineToPoint(context, kDefaultGraphWidth, kGraphBottom - kOffsetY - i * kStepY);
    }
    
    // How many lines?
    int howMany = (kDefaultGraphWidth - kOffsetX) / kStepX;
    
    // Here the lines go
    for (int i = 0; i < howMany; i++)
    {
        CGContextMoveToPoint(context, kOffsetX + i * kStepX, kGraphTop);
        CGContextAddLineToPoint(context, kOffsetX + i * kStepX, kGraphBottom);
    }
    
    CGContextStrokePath(context);
    CGContextSetLineDash(context, 0, NULL, 0); // Remove the dash
    
    // Drawing the text - working code
    CGContextSetTextMatrix(context, CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0));
    CGContextSelectFont(context, "Helvetica", 18, kCGEncodingMacRoman);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0] CGColor]);
    for (int i = 1; i < sizeof(data); i++)
    {
        NSString *theText = [NSString stringWithFormat:@"%d", i];
        
        //Drawing the Text for the x-axis
        CGContextShowTextAtPoint(context, kOffsetX + i * kStepX, kGraphBottom - 5, [theText cStringUsingEncoding:NSUTF8StringEncoding], [theText length]);
        
        //Drawing the Text for the y-axis
        CGContextShowTextAtPoint(context, kOffsetY+20 , kGraphTop +(i*kStepY-25), [theText cStringUsingEncoding:NSUTF8StringEncoding], [theText length]);
    }
  */
    
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
    
    int howManyHorizontal = [mainDiseasesArr count];
    for (int i = 0; i <= howManyHorizontal; i++)
    {
        CGContextMoveToPoint(context, kOffsetX, kGraphBottom + kOffsetY + i * kStepY);
        CGContextAddLineToPoint(context, kDefaultGraphWidth, kGraphBottom + kOffsetY + i * kStepY);
    }
    
    // How many lines?
    int howMany = [relationsArr count];
 
    // Here the lines go
    for (int i = 0; i < howMany; i++)
    {
        
        CGContextMoveToPoint(context, kOffsetX + i * kStepX, kGraphHeight);
        CGContextAddLineToPoint(context, kOffsetX + i * kStepX, kGraphBottom);
        
       // CGContextShowTextAtPoint(context, kOffsetY-10 , kGraphTop +(i*kStepY+50)+10, [yText cStringUsingEncoding:NSUTF8StringEncoding], [yText length]);
    }
    
    CGContextStrokePath(context);
    CGContextSetLineDash(context, 0, NULL, 0); // Remove the dash
    
    //Drawing the Text
    CGContextSetTextMatrix(context, CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0));
    CGContextSelectFont(context, "Helvetica", 18, kCGEncodingMacRoman);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0] CGColor]);
    
    for (int i = 0; i < mainDiseasesArr.count; i++)
    {
        //Drawing the Text for the x-axis
       // NSString *xText = [mainDiseasesArr objectAtIndex:i];
         NSString *xText = [NSString stringWithFormat:@"%d", i];
         CGContextShowTextAtPoint(context, (kOffsetX+50)+25 + i * kStepX , kGraphBottom , [xText cStringUsingEncoding:NSUTF8StringEncoding], [xText length]);
    }
    
    for (int i = 0; i < relationsArr.count; i++)
    {
        //Drawing the Text for the y-axis
        NSString *yText = [relationsArr objectAtIndex:i];
        CGContextShowTextAtPoint(context, kOffsetY-10 , kGraphTop +(i*kStepY+50)+10, [yText cStringUsingEncoding:NSUTF8StringEncoding], [yText length]);
    }
    
    //Actual Plot with the Circles
    [self drawLineGraphWithContext:context];
}

@end
