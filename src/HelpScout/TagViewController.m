//
//  ViewController.m
//  ASJTagsViewExample
//
//  Created by Software on 05/01/17.
//  Copyright © 2017 GlobalSTD. All rights reserved.
//


#import "TagViewController.h"
#import "ASJTagsView.h"

@interface TagViewController () <UITextFieldDelegate>
- (IBAction)buttonDismiss:(id)sender;

@property (weak, nonatomic) IBOutlet ASJTagsView *tagsView;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

- (void)setup;
- (void)handleTagBlocks;
- (void)showAlertMessage:(NSString *)message;
- (IBAction)addTapped:(id)sender;
- (IBAction)clearAllTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

- (IBAction)saveBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *clearBtn;
@end




@implementation TagViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self setup];
    //_inputTextField.layer.cornerRadius = 5;
    _addBtn.layer.cornerRadius = 5.0;
    _clearBtn.layer.cornerRadius = 5.0;
    _saveBtn.frame = CGRectMake(10, 10, 70, 30);
    _saveBtn.layer.cornerRadius = 5.0;
}

#pragma mark - Setup
- (void)setup
{
  _tagsView.tagColorTheme = TagColorThemeStrawberry;
  [self handleTagBlocks];
  [_inputTextField becomeFirstResponder];
}

#pragma mark - Tag blocks
- (void)handleTagBlocks
{
    
  __weak typeof(self) weakSelf = self;
  [_tagsView setTapBlock:^(NSString *tagText, NSInteger idx)
   {
     NSString *message = [NSString stringWithFormat:@"You tapped: %@", tagText];
     [weakSelf showAlertMessage:message];
   }];
  
  [_tagsView setDeleteBlock:^(NSString *tagText, NSInteger idx)
   {
     NSString *message = [NSString stringWithFormat:@"You deleted: %@", tagText];
     [weakSelf showAlertMessage:message];
     [weakSelf.tagsView deleteTagAtIndex:idx];
   }];
}

- (void)showAlertMessage:(NSString *)message
{
    //SETUP ALERT
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Etiqueta eliminada" message:message preferredStyle:UIAlertControllerStyleAlert];
    
  UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
  [alert addAction:action];
  [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - IBActions

- (IBAction)addTapped:(id)sender
{
  [_tagsView addTag:_inputTextField.text];
  _inputTextField.text = nil;
   
}

- (IBAction)clearAllTapped:(id)sender
{
  [_tagsView deleteAllTags];
   
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  return [textField resignFirstResponder];
}
//Dismiss ViewCtroller
- (IBAction)buttonDismiss:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)saveBtn:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
 }

@end
