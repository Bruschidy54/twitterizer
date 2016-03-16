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
    
}

-(void)textViewDidChange:(UITextView *)textView
{
    int len = textView.text.length;
    self.label.text=[NSString stringWithFormat:@"Count: %i",len-1];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text length] == 0)
    {
        if([textView.text length] != 0)
        {
            return YES;
        }
    }
    else if([[textView text] length] > 140)
    {
        return NO;
    }
    return YES;
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
- (IBAction)hashtagButton:(UIButton *)sender {
    NSMutableString *hashtagString = [NSMutableString stringWithString:self.textView.text];
    NSLog(@"%@",hashtagString);
    NSString *blankString = @" ";
    for (int i = 0; i < self.textView.text.length; i++) {
        
        if ([[NSString stringWithFormat:@"%c" , [self.textView.text characterAtIndex:i]]  isEqual: blankString]) {
            [hashtagString insertString:@" #" atIndex:i];
        }
        else {
            
        }
    }
    
    self.textView.text = hashtagString;
  
   
    }
    
    






@end

