//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//  LLM Chat Module
//
// Exposed interface of Object-C, enables swift binding.
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 * This is an internal Raw JSON FFI Engine that redirects request to internal JSON FFI Engine in C++
 */
@interface JSONFFIEngine : NSObject

/**
 * Unload the current model and free all memory.
 * @note This function is useful to get memory estimation before launch next model.
 */
- (void)unload;

/**
 * Reload the chat module to a new model.
 *
 * @param modelLib The name of the modelLib
 * @param modelPath The path to the model artifacts.
 * @param appConfigJson The partial config that is used to partially override the model
 * configuration.
 */
- (void)reload:(NSString*)modelLib
        modelPath:(NSString*)modelPath
    appConfigJson:(NSString*)appConfigJson;

- (void)chatCompletion:(NSString*)requestJSON requestID:(NSString*)requestID;

- (void)setStreamCallback:(void (^)(NSString*))callback;

@end
