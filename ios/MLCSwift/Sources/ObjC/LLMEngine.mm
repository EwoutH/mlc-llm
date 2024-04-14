//
//  LLMEngine.mm
//  LLMEngine
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include <os/proc.h>

#include "LLMEngine.h"

#define TVM_USE_LIBBACKTRACE 0
#define DMLC_USE_LOGGING_LIBRARY <tvm/runtime/logging.h>

#include <tvm/runtime/packed_func.h>
#include <tvm/runtime/registry.h>

using namespace tvm::runtime;

@implementation JSONFFIEngine {
  // Internal c++ classes
  // chat-related module and functions

  // internal module backed by JSON FFI
  Module json_ffi_engine_;
}

- (instancetype)init {
  if (self = [super init]) {
  }
  return self;
}

- (void)unload {
  // TODO
}

- (void)reload:(NSString*)modelLib
        modelPath:(NSString*)modelPath
    appConfigJson:(NSString*)appConfigJson {
  // TODO
}

- (void)chatCompletion:(NSString*)requestJSON requestID:(NSString*)requestID {
  // TODO
}

- (void)setStreamCallback:(void (^)(NSString*))callback {
  TypedPackedFunc<void(std::string)> internal_callback(
      [callback](std::string res) { callback([NSString stringWithUTF8String:res.c_str()]); });
}

@end
