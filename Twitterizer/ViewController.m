//
//  ViewController.m
//  Twitterizer
//
//  Created by Dylan Bruschi on 3/16/16.
//  Copyright © 2016 Dylan Bruschi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *label;



@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *words = self.textView.text;
    NSUInteger count = words.length;
    self.label.text = @"Count: %i", count;
    
}

- (IBAction)twitterizerButton:(UIButton *)sender {
    NSMutableString *twitterize = [[NSMutableString alloc] initWithString: self.textView.text];
    NSMutableString *consonant = [[NSMutableString alloc] init];
    
    NSCharacterSet *vowel = [NSCharacterSet characterSetWithCharactersInString:@"aeiouàèìòùáéíóúAEIOUÀÈÌÒÙÁÉÍÓÚ"];
    
    NSRange r;
    
    for (int i=0; i < [twitterize length]; i++) {
        
        r = [twitterize rangeOfCharacterFromSet:vowel];
        
        if(![vowel characterIsMember:[twitterize characterAtIndex:i]])
            [consonant appendFormat:@"%C",[twitterize characterAtIndex:i]];
        
    }
        self.textView.text = consonant;
    

}





@end
