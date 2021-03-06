//
//  LocalizeHelper.h
//
//  Created by Ankit on 9/21/12.
//  Copyright (c) 2012 MVNO. All rights reserved.
//

#import <Foundation/Foundation.h>

// some macros (optional, but makes life easy)

// Use "LocalizedString(key)" the same way you would use "LocalizedString(key,comment)"
#define LocalizedString(key, comment) [[LocalizeHelper sharedLocalSystem] localizedStringForKey:(key)]

// "language" can be (for american english): "en", "en-US", "english". Analogous for other languages.
#define LocalizationSetLanguage(language) [[LocalizeHelper sharedLocalSystem] setLanguage:(language)]

@interface LocalizeHelper : NSObject

// a singleton:
+ (LocalizeHelper*) sharedLocalSystem;

// this gets the string localized:
- (NSString*) localizedStringForKey:(NSString*) key;

//set a new language:
- (void) setLanguage:(NSString*) lang;              

@end
