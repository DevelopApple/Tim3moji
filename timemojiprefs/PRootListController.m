#import "PRootListController.h"
#import <Preferences/PSSpecifier.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>
#import <spawn.h>
#import <Preferences/PSListController.h>
#import <Preferences/PSTableCell.h>
#import <Preferences/PSHeaderFooterView.h>

@interface HBImageTableCell : PSTableCell <PSHeaderFooterView>
@end


@implementation PRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

- (void)respring {
	pid_t pid;
    const char* args[] = {"killall", "backboardd", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
}
-(void)twitter {
	[[UIApplication sharedApplication]
	openURL:[NSURL URLWithString:@"https://twitter.com/1DI4R"]
	options:@{}
	completionHandler:nil];
		}
-(void)paypal {
			[[UIApplication sharedApplication]
			openURL:[NSURL URLWithString:@"https://paypal.me/dyarib/2"]
			options:@{}
			completionHandler:nil];
				}
-(void)github {
		 	 			[[UIApplication sharedApplication]
		 	 			openURL:[NSURL URLWithString:@"https://github.com/1di4r"]
		 	 			options:@{}
		 	 			completionHandler:nil];
		 	 				}

							//thanks to @teo155 for this :P
							
- (void)loadSpinner {
	             UIActivityIndicatorView *progressWheel=[[UIActivityIndicatorView alloc]     initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];

	             //makes activity indicator disappear when it is stopped
	             progressWheel.hidesWhenStopped = YES;
               	//used to locate position of activity indicator
	             progressWheel.center = CGPointMake(185, 166);
	             [self.view addSubview: progressWheel];
	             [progressWheel startAnimating];
	             [progressWheel performSelector:@selector(stopAnimating) withObject:nil afterDelay:3.0];
	             [progressWheel release];
             }
- (void)_returnKeyPressed:(NSNotification *)settingschanged {
	                  [self loadSpinner];
	                  [self.view endEditing:YES];
             }
@end
