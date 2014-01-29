//
//  UILabel+Boldify.m
//  pedigree
//
//  Created by  Madhavi Tammineni on 1/24/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "UILabel+Boldify.h"

@implementation UILabel (Boldify)

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void) boldSubstring: (NSString* ) substring{
    NSRange range = [self.text rangeOfString:substring];
    [self boldRange:range];
    
}

-(void) boldRange: (NSRange) range{
    if(![self respondsToSelector:@selector(setAttributedText:)]){
        return;
    }
    NSMutableAttributedString *attributedText;
    if (!self.attributedText) {
        attributedText = [[NSMutableAttributedString alloc] initWithString:self.text];
    } else {
        attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    }
    
    [attributedText setAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:self.font.pointSize]} range:range];
    self.attributedText = attributedText;
}

@end
