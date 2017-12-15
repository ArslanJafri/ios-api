#pragma once

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/*!
 * A set of parameters for creating a mapscene request.
 */
@interface WRLDMapsceneRequestOptions : NSObject

/*!
 * @param shortLinkUrl The full url or the short link of the mapscene to load.
 * @param applyMapsceneOnSuccess determine whether the mapscene should be applied once loaded.
 * @returns A WRLDMapsceneRequestOptions instance.
 */
-(instancetype)initWithShortLink:(NSString*)shortLinkUrl applyMapsceneOnSuccess:(bool)applyMapsceneOnSuccess;

/// gets the short link.
@property (readonly) NSString* shortLinkUrl;

/// applyMapscene
@property (readonly) bool applyMapsceneOnSuccess;

@end

NS_ASSUME_NONNULL_END
