//
//  JSValue.ErrorHandling.swift
//  JSON
//
//  Created by David Owens II on 8/11/14.
//  Copyright (c) 2014 Kiad Software. All rights reserved.
//

extension JSValue {
    
    /// A type that holds the error code and standard error message for the various types of failures
    /// a `JSValue` can have.
    public struct ErrorMessage {
        /// The numeric value of the error number.
        public let code: Int
        
        /// The default message describing the error.
        public let message: String
        
        /// Simple conversion for easy-use when needing to access the error code.
        public func __conversion() -> Int {
            return self.code
        }
        
        /// Simple conversion for easy-use when needing to access the error message.
        public func __conversion() -> String {
            return self.message
        }
    }
    
    /// All of the error codes and standard error messages when parsing JSON.
    public struct ErrorCode {
        private init() {}
        
        /// A integer that is outside of the safe range was attempted to be set.
        public static let InvalidIntegerValue = ErrorMessage(
            code:1,
            message: "The specified number is not valid. Valid numbers are within the range: [\(JSValue.MinimumSafeInt), \(JSValue.MaximumSafeInt)]")
        
        /// Error when attempting to access an element from a `JSValue` backed by a dictionary and there is no
        /// value stored at the specified key.
        public static let KeyNotFound = ErrorMessage(
            code: 2,
            message: "The specified key cannot be found.")
        
        /// Error when attempting to index into a `JSValue` that is not backed by a dictionary or array.
        public static let IndexingIntoUnsupportedType = ErrorMessage(
            code: 3,
            message: "Indexing is only supported on arrays and dictionaries."
        )
        
        /// Error when attempting to access an element from a `JSValue` backed by an array and the index is
        /// out of range.
        public static let IndexOutOfRange = ErrorMessage(
            code: 4,
            message: "The specified index is out of range of the bounds for the array.")

//        /// An unsupported type is attempting to be parsed.
//        case UnsupportedType
//        
//        /// Error used when attempting to convert a value to an type it does not represent.
//        case InvalidType
//        
//        /// Error used when attempting to convert a value to an type when the value is null.
//        case NullValue
//        
//        /// Error used when attempting to retrieve a dictionary item with an invalid key.
//        case InvalidKeyValue
//        
//        /// Error used when attempting to retrieve an array item with an invalid index.
//        case InvalidIndexValue
    }
}
