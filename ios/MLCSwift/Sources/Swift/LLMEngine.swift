import Foundation
import LLMChatObjC


@available(iOS 13.0.0, *)
public class LLMEngine {
    private let jsonFFIEngine = JSONFFIEngine()
    private var continuationMap = Dictionary<String, AsyncStream<String>.Continuation>();
    
    public init() {
        jsonFFIEngine.setStreamCallback { (result : String?) -> Void in
            self.streamCallback(result: result)
        }
    }
    
    // TODO(mlc-team) turn into a structured interface
    public func chatCompletion(jsonRequest: String) -> AsyncStream<String> {
        // generate a UUID for the request
        let requestID = UUID().uuidString
        let stream = AsyncStream(String.self) { continuation in
            continuation.onTermination = { termination in
                if termination == .cancelled {
                    // TODO(mlc-team)
                    // jsonFFIEngine.abort(requestID);
                }
                
            }          
            // store continuation map for further callbacks
            self.continuationMap[requestID] = continuation
            // start invoking engine for completion
            self.jsonFFIEngine.chatCompletion(jsonRequest, requestID: requestID)
        }
        return stream
    }
    
    private func streamCallback(result: String?) {
        // TODO(mlc-team) read request id from result
        let requestID = "xyz";
        // dispatch to right request ID
        assert(result != nil)
        if let continuation = self.continuationMap[requestID] {
            // TODO(mlc-team) detect finished from result
            let finished = false;
            continuation.yield(result!)
            if finished {
                continuation.finish()
            }
        }
    }

}
