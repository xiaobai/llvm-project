//===--- JSONRPCDispatcher.h - Main JSON parser entry point -----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_CLANG_TOOLS_EXTRA_CLANGD_JSONRPCDISPATCHER_H
#define LLVM_CLANG_TOOLS_EXTRA_CLANGD_JSONRPCDISPATCHER_H

#include "clang/Basic/LLVM.h"
#include "llvm/ADT/StringMap.h"
#include "llvm/Support/YAMLParser.h"

namespace clang {
namespace clangd {

/// Callback for messages sent to the server, called by the JSONRPCDispatcher.
class Handler {
public:
  Handler(llvm::raw_ostream &Outs, llvm::raw_ostream &Logs)
      : Outs(Outs), Logs(Logs) {}
  virtual ~Handler() = default;

  /// Called when the server receives a method call. This is supposed to return
  /// a result on Outs. The default implementation returns an "unknown method"
  /// error to the client and logs a warning.
  virtual void handleMethod(llvm::yaml::MappingNode *Params, StringRef ID);
  /// Called when the server receives a notification. No result should be
  /// written to Outs. The default implemetation logs a warning.
  virtual void handleNotification(llvm::yaml::MappingNode *Params);

protected:
  llvm::raw_ostream &Outs;
  llvm::raw_ostream &Logs;

  /// Helper to write a JSONRPC result to Outs.
  void writeMessage(const Twine &Message);
};

/// Main JSONRPC entry point. This parses the JSONRPC "header" and calls the
/// registered Handler for the method received.
class JSONRPCDispatcher {
public:
  /// Create a new JSONRPCDispatcher. UnknownHandler is called when an unknown
  /// method is received.
  JSONRPCDispatcher(std::unique_ptr<Handler> UnknownHandler)
      : UnknownHandler(std::move(UnknownHandler)) {}

  /// Registers a Handler for the specified Method.
  void registerHandler(StringRef Method, std::unique_ptr<Handler> H);

  /// Parses a JSONRPC message and calls the Handler for it.
  bool call(StringRef Content) const;

private:
  llvm::StringMap<std::unique_ptr<Handler>> Handlers;
  std::unique_ptr<Handler> UnknownHandler;
};

} // namespace clangd
} // namespace clang

#endif
