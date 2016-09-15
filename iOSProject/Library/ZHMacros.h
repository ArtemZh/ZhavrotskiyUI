//
//  ZHMacros.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 15.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#define HZEmpty


#define ZHWeakify(variable) \
__weak __typeof(variable) __ZHWeakified_##variable = variable;

#define ZHStrongify(variable) \
__strong __typeof(variable) variable = __ZHWeakified_##variable;


#define ZHDefineBaseViewProrety(propertyName, viewClass) \
@property (nonatomic, readonly) viewClass *propertyName;

#define ZHBaseViewGetterSyntesize(selector, viewClass) \
- (viewClass *)selector { \
if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
return (viewClass *)self.view; \
} \
\
return nil; \
}


#define ZHViewControllerBaseViewPropertyWithGetter(viewControllerClass, propertyName, baseViewClass) \
@interface viewControllerClass (__ZHPrivateBaseView_##viewControllerClass_##propertyName) \
ZHDefineBaseViewProrety(propertyName, baseViewClass)\
\
@end \
\
@implementation viewControllerClass (__ZHPrivateBaseView_##viewControllerClass_##propertyName) \
\
@dynamic propertyName; \
\
ZHBaseViewGetterSyntesize(propertyName, baseViewClass)\
\
@end

