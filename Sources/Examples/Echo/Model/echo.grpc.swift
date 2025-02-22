//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: echo.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf


/// Usage: instantiate `Echo_EchoClient`, then call methods of this protocol to make API calls.
public protocol Echo_EchoClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Echo_EchoClientInterceptorFactoryProtocol? { get }

  func get(
    _ request: Echo_EchoRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Echo_EchoRequest, Echo_EchoResponse>

  func expand(
    _ request: Echo_EchoRequest,
    callOptions: CallOptions?,
    handler: @escaping (Echo_EchoResponse) -> Void
  ) -> ServerStreamingCall<Echo_EchoRequest, Echo_EchoResponse>

  func collect(
    callOptions: CallOptions?
  ) -> ClientStreamingCall<Echo_EchoRequest, Echo_EchoResponse>

  func update(
    callOptions: CallOptions?,
    handler: @escaping (Echo_EchoResponse) -> Void
  ) -> BidirectionalStreamingCall<Echo_EchoRequest, Echo_EchoResponse>
}

extension Echo_EchoClientProtocol {
  public var serviceName: String {
    return "echo.Echo"
  }

  /// Immediately returns an echo of a request.
  ///
  /// - Parameters:
  ///   - request: Request to send to Get.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func get(
    _ request: Echo_EchoRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Echo_EchoRequest, Echo_EchoResponse> {
    return self.makeUnaryCall(
      path: Echo_EchoClientMetadata.Methods.get.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetInterceptors() ?? []
    )
  }

  /// Splits a request into words and returns each word in a stream of messages.
  ///
  /// - Parameters:
  ///   - request: Request to send to Expand.
  ///   - callOptions: Call options.
  ///   - handler: A closure called when each response is received from the server.
  /// - Returns: A `ServerStreamingCall` with futures for the metadata and status.
  public func expand(
    _ request: Echo_EchoRequest,
    callOptions: CallOptions? = nil,
    handler: @escaping (Echo_EchoResponse) -> Void
  ) -> ServerStreamingCall<Echo_EchoRequest, Echo_EchoResponse> {
    return self.makeServerStreamingCall(
      path: Echo_EchoClientMetadata.Methods.expand.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeExpandInterceptors() ?? [],
      handler: handler
    )
  }

  /// Collects a stream of messages and returns them concatenated when the caller closes.
  ///
  /// Callers should use the `send` method on the returned object to send messages
  /// to the server. The caller should send an `.end` after the final message has been sent.
  ///
  /// - Parameters:
  ///   - callOptions: Call options.
  /// - Returns: A `ClientStreamingCall` with futures for the metadata, status and response.
  public func collect(
    callOptions: CallOptions? = nil
  ) -> ClientStreamingCall<Echo_EchoRequest, Echo_EchoResponse> {
    return self.makeClientStreamingCall(
      path: Echo_EchoClientMetadata.Methods.collect.path,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCollectInterceptors() ?? []
    )
  }

  /// Streams back messages as they are received in an input stream.
  ///
  /// Callers should use the `send` method on the returned object to send messages
  /// to the server. The caller should send an `.end` after the final message has been sent.
  ///
  /// - Parameters:
  ///   - callOptions: Call options.
  ///   - handler: A closure called when each response is received from the server.
  /// - Returns: A `ClientStreamingCall` with futures for the metadata and status.
  public func update(
    callOptions: CallOptions? = nil,
    handler: @escaping (Echo_EchoResponse) -> Void
  ) -> BidirectionalStreamingCall<Echo_EchoRequest, Echo_EchoResponse> {
    return self.makeBidirectionalStreamingCall(
      path: Echo_EchoClientMetadata.Methods.update.path,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateInterceptors() ?? [],
      handler: handler
    )
  }
}

@available(*, deprecated)
extension Echo_EchoClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Echo_EchoNIOClient")
public final class Echo_EchoClient: Echo_EchoClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Echo_EchoClientInterceptorFactoryProtocol?
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  public var interceptors: Echo_EchoClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the echo.Echo service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Echo_EchoClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

public struct Echo_EchoNIOClient: Echo_EchoClientProtocol {
  public var channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Echo_EchoClientInterceptorFactoryProtocol?

  /// Creates a client for the echo.Echo service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Echo_EchoClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public protocol Echo_EchoAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Echo_EchoClientInterceptorFactoryProtocol? { get }

  func makeGetCall(
    _ request: Echo_EchoRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Echo_EchoRequest, Echo_EchoResponse>

  func makeExpandCall(
    _ request: Echo_EchoRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncServerStreamingCall<Echo_EchoRequest, Echo_EchoResponse>

  func makeCollectCall(
    callOptions: CallOptions?
  ) -> GRPCAsyncClientStreamingCall<Echo_EchoRequest, Echo_EchoResponse>

  func makeUpdateCall(
    callOptions: CallOptions?
  ) -> GRPCAsyncBidirectionalStreamingCall<Echo_EchoRequest, Echo_EchoResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Echo_EchoAsyncClientProtocol {
  public static var serviceDescriptor: GRPCServiceDescriptor {
    return Echo_EchoClientMetadata.serviceDescriptor
  }

  public var interceptors: Echo_EchoClientInterceptorFactoryProtocol? {
    return nil
  }

  public func makeGetCall(
    _ request: Echo_EchoRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Echo_EchoRequest, Echo_EchoResponse> {
    return self.makeAsyncUnaryCall(
      path: Echo_EchoClientMetadata.Methods.get.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetInterceptors() ?? []
    )
  }

  public func makeExpandCall(
    _ request: Echo_EchoRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncServerStreamingCall<Echo_EchoRequest, Echo_EchoResponse> {
    return self.makeAsyncServerStreamingCall(
      path: Echo_EchoClientMetadata.Methods.expand.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeExpandInterceptors() ?? []
    )
  }

  public func makeCollectCall(
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncClientStreamingCall<Echo_EchoRequest, Echo_EchoResponse> {
    return self.makeAsyncClientStreamingCall(
      path: Echo_EchoClientMetadata.Methods.collect.path,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCollectInterceptors() ?? []
    )
  }

  public func makeUpdateCall(
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncBidirectionalStreamingCall<Echo_EchoRequest, Echo_EchoResponse> {
    return self.makeAsyncBidirectionalStreamingCall(
      path: Echo_EchoClientMetadata.Methods.update.path,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Echo_EchoAsyncClientProtocol {
  public func get(
    _ request: Echo_EchoRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Echo_EchoResponse {
    return try await self.performAsyncUnaryCall(
      path: Echo_EchoClientMetadata.Methods.get.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetInterceptors() ?? []
    )
  }

  public func expand(
    _ request: Echo_EchoRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncResponseStream<Echo_EchoResponse> {
    return self.performAsyncServerStreamingCall(
      path: Echo_EchoClientMetadata.Methods.expand.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeExpandInterceptors() ?? []
    )
  }

  public func collect<RequestStream>(
    _ requests: RequestStream,
    callOptions: CallOptions? = nil
  ) async throws -> Echo_EchoResponse where RequestStream: Sequence, RequestStream.Element == Echo_EchoRequest {
    return try await self.performAsyncClientStreamingCall(
      path: Echo_EchoClientMetadata.Methods.collect.path,
      requests: requests,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCollectInterceptors() ?? []
    )
  }

  public func collect<RequestStream>(
    _ requests: RequestStream,
    callOptions: CallOptions? = nil
  ) async throws -> Echo_EchoResponse where RequestStream: AsyncSequence & Sendable, RequestStream.Element == Echo_EchoRequest {
    return try await self.performAsyncClientStreamingCall(
      path: Echo_EchoClientMetadata.Methods.collect.path,
      requests: requests,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCollectInterceptors() ?? []
    )
  }

  public func update<RequestStream>(
    _ requests: RequestStream,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncResponseStream<Echo_EchoResponse> where RequestStream: Sequence, RequestStream.Element == Echo_EchoRequest {
    return self.performAsyncBidirectionalStreamingCall(
      path: Echo_EchoClientMetadata.Methods.update.path,
      requests: requests,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateInterceptors() ?? []
    )
  }

  public func update<RequestStream>(
    _ requests: RequestStream,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncResponseStream<Echo_EchoResponse> where RequestStream: AsyncSequence & Sendable, RequestStream.Element == Echo_EchoRequest {
    return self.performAsyncBidirectionalStreamingCall(
      path: Echo_EchoClientMetadata.Methods.update.path,
      requests: requests,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public struct Echo_EchoAsyncClient: Echo_EchoAsyncClientProtocol {
  public var channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Echo_EchoClientInterceptorFactoryProtocol?

  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Echo_EchoClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

public protocol Echo_EchoClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'get'.
  func makeGetInterceptors() -> [ClientInterceptor<Echo_EchoRequest, Echo_EchoResponse>]

  /// - Returns: Interceptors to use when invoking 'expand'.
  func makeExpandInterceptors() -> [ClientInterceptor<Echo_EchoRequest, Echo_EchoResponse>]

  /// - Returns: Interceptors to use when invoking 'collect'.
  func makeCollectInterceptors() -> [ClientInterceptor<Echo_EchoRequest, Echo_EchoResponse>]

  /// - Returns: Interceptors to use when invoking 'update'.
  func makeUpdateInterceptors() -> [ClientInterceptor<Echo_EchoRequest, Echo_EchoResponse>]
}

public enum Echo_EchoClientMetadata {
  public static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Echo",
    fullName: "echo.Echo",
    methods: [
      Echo_EchoClientMetadata.Methods.get,
      Echo_EchoClientMetadata.Methods.expand,
      Echo_EchoClientMetadata.Methods.collect,
      Echo_EchoClientMetadata.Methods.update,
    ]
  )

  public enum Methods {
    public static let get = GRPCMethodDescriptor(
      name: "Get",
      path: "/echo.Echo/Get",
      type: GRPCCallType.unary
    )

    public static let expand = GRPCMethodDescriptor(
      name: "Expand",
      path: "/echo.Echo/Expand",
      type: GRPCCallType.serverStreaming
    )

    public static let collect = GRPCMethodDescriptor(
      name: "Collect",
      path: "/echo.Echo/Collect",
      type: GRPCCallType.clientStreaming
    )

    public static let update = GRPCMethodDescriptor(
      name: "Update",
      path: "/echo.Echo/Update",
      type: GRPCCallType.bidirectionalStreaming
    )
  }
}

@available(swift, deprecated: 5.6)
extension Echo_EchoTestClient: @unchecked Sendable {}

@available(swift, deprecated: 5.6, message: "Test clients are not Sendable but the 'GRPCClient' API requires clients to be Sendable. Using a localhost client and server is the recommended alternative.")
public final class Echo_EchoTestClient: Echo_EchoClientProtocol {
  private let fakeChannel: FakeChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Echo_EchoClientInterceptorFactoryProtocol?

  public var channel: GRPCChannel {
    return self.fakeChannel
  }

  public init(
    fakeChannel: FakeChannel = FakeChannel(),
    defaultCallOptions callOptions: CallOptions = CallOptions(),
    interceptors: Echo_EchoClientInterceptorFactoryProtocol? = nil
  ) {
    self.fakeChannel = fakeChannel
    self.defaultCallOptions = callOptions
    self.interceptors = interceptors
  }

  /// Make a unary response for the Get RPC. This must be called
  /// before calling 'get'. See also 'FakeUnaryResponse'.
  ///
  /// - Parameter requestHandler: a handler for request parts sent by the RPC.
  public func makeGetResponseStream(
    _ requestHandler: @escaping (FakeRequestPart<Echo_EchoRequest>) -> () = { _ in }
  ) -> FakeUnaryResponse<Echo_EchoRequest, Echo_EchoResponse> {
    return self.fakeChannel.makeFakeUnaryResponse(path: Echo_EchoClientMetadata.Methods.get.path, requestHandler: requestHandler)
  }

  public func enqueueGetResponse(
    _ response: Echo_EchoResponse,
    _ requestHandler: @escaping (FakeRequestPart<Echo_EchoRequest>) -> () = { _ in }
  ) {
    let stream = self.makeGetResponseStream(requestHandler)
    // This is the only operation on the stream; try! is fine.
    try! stream.sendMessage(response)
  }

  /// Returns true if there are response streams enqueued for 'Get'
  public var hasGetResponsesRemaining: Bool {
    return self.fakeChannel.hasFakeResponseEnqueued(forPath: Echo_EchoClientMetadata.Methods.get.path)
  }

  /// Make a streaming response for the Expand RPC. This must be called
  /// before calling 'expand'. See also 'FakeStreamingResponse'.
  ///
  /// - Parameter requestHandler: a handler for request parts sent by the RPC.
  public func makeExpandResponseStream(
    _ requestHandler: @escaping (FakeRequestPart<Echo_EchoRequest>) -> () = { _ in }
  ) -> FakeStreamingResponse<Echo_EchoRequest, Echo_EchoResponse> {
    return self.fakeChannel.makeFakeStreamingResponse(path: Echo_EchoClientMetadata.Methods.expand.path, requestHandler: requestHandler)
  }

  public func enqueueExpandResponses(
    _ responses: [Echo_EchoResponse],
    _ requestHandler: @escaping (FakeRequestPart<Echo_EchoRequest>) -> () = { _ in }
  ) {
    let stream = self.makeExpandResponseStream(requestHandler)
    // These are the only operation on the stream; try! is fine.
    responses.forEach { try! stream.sendMessage($0) }
    try! stream.sendEnd()
  }

  /// Returns true if there are response streams enqueued for 'Expand'
  public var hasExpandResponsesRemaining: Bool {
    return self.fakeChannel.hasFakeResponseEnqueued(forPath: Echo_EchoClientMetadata.Methods.expand.path)
  }

  /// Make a unary response for the Collect RPC. This must be called
  /// before calling 'collect'. See also 'FakeUnaryResponse'.
  ///
  /// - Parameter requestHandler: a handler for request parts sent by the RPC.
  public func makeCollectResponseStream(
    _ requestHandler: @escaping (FakeRequestPart<Echo_EchoRequest>) -> () = { _ in }
  ) -> FakeUnaryResponse<Echo_EchoRequest, Echo_EchoResponse> {
    return self.fakeChannel.makeFakeUnaryResponse(path: Echo_EchoClientMetadata.Methods.collect.path, requestHandler: requestHandler)
  }

  public func enqueueCollectResponse(
    _ response: Echo_EchoResponse,
    _ requestHandler: @escaping (FakeRequestPart<Echo_EchoRequest>) -> () = { _ in }
  ) {
    let stream = self.makeCollectResponseStream(requestHandler)
    // This is the only operation on the stream; try! is fine.
    try! stream.sendMessage(response)
  }

  /// Returns true if there are response streams enqueued for 'Collect'
  public var hasCollectResponsesRemaining: Bool {
    return self.fakeChannel.hasFakeResponseEnqueued(forPath: Echo_EchoClientMetadata.Methods.collect.path)
  }

  /// Make a streaming response for the Update RPC. This must be called
  /// before calling 'update'. See also 'FakeStreamingResponse'.
  ///
  /// - Parameter requestHandler: a handler for request parts sent by the RPC.
  public func makeUpdateResponseStream(
    _ requestHandler: @escaping (FakeRequestPart<Echo_EchoRequest>) -> () = { _ in }
  ) -> FakeStreamingResponse<Echo_EchoRequest, Echo_EchoResponse> {
    return self.fakeChannel.makeFakeStreamingResponse(path: Echo_EchoClientMetadata.Methods.update.path, requestHandler: requestHandler)
  }

  public func enqueueUpdateResponses(
    _ responses: [Echo_EchoResponse],
    _ requestHandler: @escaping (FakeRequestPart<Echo_EchoRequest>) -> () = { _ in }
  ) {
    let stream = self.makeUpdateResponseStream(requestHandler)
    // These are the only operation on the stream; try! is fine.
    responses.forEach { try! stream.sendMessage($0) }
    try! stream.sendEnd()
  }

  /// Returns true if there are response streams enqueued for 'Update'
  public var hasUpdateResponsesRemaining: Bool {
    return self.fakeChannel.hasFakeResponseEnqueued(forPath: Echo_EchoClientMetadata.Methods.update.path)
  }
}

/// To build a server, implement a class that conforms to this protocol.
public protocol Echo_EchoProvider: CallHandlerProvider {
  var interceptors: Echo_EchoServerInterceptorFactoryProtocol? { get }

  /// Immediately returns an echo of a request.
  func get(request: Echo_EchoRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Echo_EchoResponse>

  /// Splits a request into words and returns each word in a stream of messages.
  func expand(request: Echo_EchoRequest, context: StreamingResponseCallContext<Echo_EchoResponse>) -> EventLoopFuture<GRPCStatus>

  /// Collects a stream of messages and returns them concatenated when the caller closes.
  func collect(context: UnaryResponseCallContext<Echo_EchoResponse>) -> EventLoopFuture<(StreamEvent<Echo_EchoRequest>) -> Void>

  /// Streams back messages as they are received in an input stream.
  func update(context: StreamingResponseCallContext<Echo_EchoResponse>) -> EventLoopFuture<(StreamEvent<Echo_EchoRequest>) -> Void>
}

extension Echo_EchoProvider {
  public var serviceName: Substring {
    return Echo_EchoServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  public func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Get":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Echo_EchoRequest>(),
        responseSerializer: ProtobufSerializer<Echo_EchoResponse>(),
        interceptors: self.interceptors?.makeGetInterceptors() ?? [],
        userFunction: self.get(request:context:)
      )

    case "Expand":
      return ServerStreamingServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Echo_EchoRequest>(),
        responseSerializer: ProtobufSerializer<Echo_EchoResponse>(),
        interceptors: self.interceptors?.makeExpandInterceptors() ?? [],
        userFunction: self.expand(request:context:)
      )

    case "Collect":
      return ClientStreamingServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Echo_EchoRequest>(),
        responseSerializer: ProtobufSerializer<Echo_EchoResponse>(),
        interceptors: self.interceptors?.makeCollectInterceptors() ?? [],
        observerFactory: self.collect(context:)
      )

    case "Update":
      return BidirectionalStreamingServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Echo_EchoRequest>(),
        responseSerializer: ProtobufSerializer<Echo_EchoResponse>(),
        interceptors: self.interceptors?.makeUpdateInterceptors() ?? [],
        observerFactory: self.update(context:)
      )

    default:
      return nil
    }
  }
}

/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public protocol Echo_EchoAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Echo_EchoServerInterceptorFactoryProtocol? { get }

  /// Immediately returns an echo of a request.
  @Sendable func get(
    request: Echo_EchoRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Echo_EchoResponse

  /// Splits a request into words and returns each word in a stream of messages.
  @Sendable func expand(
    request: Echo_EchoRequest,
    responseStream: GRPCAsyncResponseStreamWriter<Echo_EchoResponse>,
    context: GRPCAsyncServerCallContext
  ) async throws

  /// Collects a stream of messages and returns them concatenated when the caller closes.
  @Sendable func collect(
    requestStream: GRPCAsyncRequestStream<Echo_EchoRequest>,
    context: GRPCAsyncServerCallContext
  ) async throws -> Echo_EchoResponse

  /// Streams back messages as they are received in an input stream.
  @Sendable func update(
    requestStream: GRPCAsyncRequestStream<Echo_EchoRequest>,
    responseStream: GRPCAsyncResponseStreamWriter<Echo_EchoResponse>,
    context: GRPCAsyncServerCallContext
  ) async throws
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Echo_EchoAsyncProvider {
  public static var serviceDescriptor: GRPCServiceDescriptor {
    return Echo_EchoServerMetadata.serviceDescriptor
  }

  public var serviceName: Substring {
    return Echo_EchoServerMetadata.serviceDescriptor.fullName[...]
  }

  public var interceptors: Echo_EchoServerInterceptorFactoryProtocol? {
    return nil
  }

  public func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Get":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Echo_EchoRequest>(),
        responseSerializer: ProtobufSerializer<Echo_EchoResponse>(),
        interceptors: self.interceptors?.makeGetInterceptors() ?? [],
        wrapping: self.get(request:context:)
      )

    case "Expand":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Echo_EchoRequest>(),
        responseSerializer: ProtobufSerializer<Echo_EchoResponse>(),
        interceptors: self.interceptors?.makeExpandInterceptors() ?? [],
        wrapping: self.expand(request:responseStream:context:)
      )

    case "Collect":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Echo_EchoRequest>(),
        responseSerializer: ProtobufSerializer<Echo_EchoResponse>(),
        interceptors: self.interceptors?.makeCollectInterceptors() ?? [],
        wrapping: self.collect(requestStream:context:)
      )

    case "Update":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Echo_EchoRequest>(),
        responseSerializer: ProtobufSerializer<Echo_EchoResponse>(),
        interceptors: self.interceptors?.makeUpdateInterceptors() ?? [],
        wrapping: self.update(requestStream:responseStream:context:)
      )

    default:
      return nil
    }
  }
}

public protocol Echo_EchoServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'get'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeGetInterceptors() -> [ServerInterceptor<Echo_EchoRequest, Echo_EchoResponse>]

  /// - Returns: Interceptors to use when handling 'expand'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeExpandInterceptors() -> [ServerInterceptor<Echo_EchoRequest, Echo_EchoResponse>]

  /// - Returns: Interceptors to use when handling 'collect'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeCollectInterceptors() -> [ServerInterceptor<Echo_EchoRequest, Echo_EchoResponse>]

  /// - Returns: Interceptors to use when handling 'update'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeUpdateInterceptors() -> [ServerInterceptor<Echo_EchoRequest, Echo_EchoResponse>]
}

public enum Echo_EchoServerMetadata {
  public static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Echo",
    fullName: "echo.Echo",
    methods: [
      Echo_EchoServerMetadata.Methods.get,
      Echo_EchoServerMetadata.Methods.expand,
      Echo_EchoServerMetadata.Methods.collect,
      Echo_EchoServerMetadata.Methods.update,
    ]
  )

  public enum Methods {
    public static let get = GRPCMethodDescriptor(
      name: "Get",
      path: "/echo.Echo/Get",
      type: GRPCCallType.unary
    )

    public static let expand = GRPCMethodDescriptor(
      name: "Expand",
      path: "/echo.Echo/Expand",
      type: GRPCCallType.serverStreaming
    )

    public static let collect = GRPCMethodDescriptor(
      name: "Collect",
      path: "/echo.Echo/Collect",
      type: GRPCCallType.clientStreaming
    )

    public static let update = GRPCMethodDescriptor(
      name: "Update",
      path: "/echo.Echo/Update",
      type: GRPCCallType.bidirectionalStreaming
    )
  }
}
