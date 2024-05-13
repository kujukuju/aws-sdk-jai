//
// This file was auto-generated using the following command:
//
// jai -import_dir ../ ./generate.jai
//



BUILD_ONLY :: "s3";
JAI_GENERATOR :: 1;
PRInSTR :: "%.*s";

AWS_PACKAGE_SLOTS :: 32;

AWS_C_COMMON_PACKAGE_ID :: 0;

AWS_OP_SUCCESS :: 0;
AWS_OP_ERR :: -1;

AWS_ERROR_ENUM_STRIDE_BITS :: 10;
AWS_ERROR_ENUM_STRIDE :: 1 << AWS_ERROR_ENUM_STRIDE_BITS;

SIZE_BITS :: 64;

SIZE_MAX_POWER_OF_TWO :: (cast(u64) 1) << (SIZE_BITS - 1);

AWS_THREAD_NAME_RECOMMENDED_STRLEN :: 15;

AWS_LOG_LEVEL_NONE :: 0;
AWS_LOG_LEVEL_FATAL :: 1;
AWS_LOG_LEVEL_ERROR :: 2;
AWS_LOG_LEVEL_WARN :: 3;
AWS_LOG_LEVEL_INFO :: 4;
AWS_LOG_LEVEL_DEBUG :: 5;
AWS_LOG_LEVEL_TRACE :: 6;

CJSON_AS4CPP_VERSION_MAJOR :: 1;
CJSON_AS4CPP_VERSION_MINOR :: 7;
CJSON_AS4CPP_VERSION_PATCH :: 14;

cJSON_AS4CPP_Invalid :: 0;
cJSON_AS4CPP_False :: 1 << 0;
cJSON_AS4CPP_True :: 1 << 1;
cJSON_AS4CPP_NULL :: 1 << 2;
cJSON_AS4CPP_Number :: 1 << 3;
cJSON_AS4CPP_String :: 1 << 4;
cJSON_AS4CPP_Array :: 1 << 5;
cJSON_AS4CPP_Object :: 1 << 6;
cJSON_AS4CPP_Raw :: 1 << 7;

cJSON_AS4CPP_IsReference :: 256;
cJSON_AS4CPP_StringIsConst :: 512;

CJSON_AS4CPP_NESTING_LIMIT :: 1000;

AWS_C_IO_PACKAGE_ID :: 1;

AWS_ADDRESS_MAX_LEN :: 256;

AWS_C_MQTT_PACKAGE_ID :: 5;

AWS_C_SDKUTILS_PACKAGE_ID :: 15;

AWS_C_AUTH_PACKAGE_ID :: 6;

AWS_SDK_VERSION_STRING :: "1.11.326";
AWS_SDK_VERSION_MAJOR :: 1;
AWS_SDK_VERSION_MINOR :: 11;
AWS_SDK_VERSION_PATCH :: 326;

AWS_TLS_NEGOTIATED_PROTOCOL_MESSAGE :: 0x01;

/**
* Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
* SPDX-License-Identifier: Apache-2.0.
*/
Aws :: struct {
    Utils :: struct {
        Memory :: struct {
            /**
            * Central interface for memory management customizations. To create a custom memory manager, implement this interface and then
            * call InitializeAWSMemorySystem().
            */
            MemorySystemInterface :: struct {
                vtable: *MemorySystemInterface_VTable;
            }
            MemorySystemInterface_VTable :: struct #type_info_none {
                Destructor: (this: *MemorySystemInterface, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                Begin: (this: *MemorySystemInterface) -> void #cpp_method;

                End: (this: *MemorySystemInterface) -> void #cpp_method;

                FreeMemory: (this: *MemorySystemInterface, memoryPtr: *void) -> void #cpp_method;
            }

            MemorySystemInterface_Destructor :: inline (this: *MemorySystemInterface, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            MemorySystemInterface_Begin :: inline (this: *MemorySystemInterface) { this.vtable.Begin(this); }

            MemorySystemInterface_End :: inline (this: *MemorySystemInterface) { this.vtable.End(this); }

            MemorySystemInterface_FreeMemory :: inline (this: *MemorySystemInterface, memoryPtr: *void) { this.vtable.FreeMemory(this, memoryPtr); }

            vtable :: (obj: *MemorySystemInterface) -> *MemorySystemInterface_VTable { return obj.vtable; }

        }

        Logging :: struct {
            /**
            * LogLevel used to control verbosity of logging system.
            */
            LogLevel :: enum s32 {
                Off   :: 0;
                Fatal :: 1;
                Error :: 2;
                Warn  :: 3;
                Info  :: 4;
                Debug :: 5;
                Trace :: 6;
            }

            /**
            * Interface for logging implementations. If you want to write your own logger, you can start here, though you may have more
            * luck going down one more level to FormattedLogSystem. It does a bit more of the work for you and still gives you the ability
            * to override the IO portion.
            */
            LogSystemInterface :: struct {
                vtable: *LogSystemInterface_VTable;
            }
            LogSystemInterface_VTable :: struct #type_info_none {
                Destructor: (this: *LogSystemInterface, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                GetLogLevel: (this: *LogSystemInterface) -> LogLevel #cpp_method;

                Log: (this: *LogSystemInterface, logLevel: LogLevel, tag: *u8, formatStr: *u8, __args: ..Any) -> void #cpp_method;

                vaLog: *void;

                LogStream: (this: *LogSystemInterface, logLevel: LogLevel, tag: *u8, messageStream: *OStringStream) -> void #cpp_method;

                Flush: (this: *LogSystemInterface) -> void #cpp_method;

                Stop: (this: *LogSystemInterface) -> void #cpp_method;
            }

            LogSystemInterface_Destructor :: inline (this: *LogSystemInterface, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            LogSystemInterface_GetLogLevel :: inline (this: *LogSystemInterface) -> LogLevel { return this.vtable.GetLogLevel(this); }

            LogSystemInterface_LogStream :: inline (this: *LogSystemInterface, logLevel: LogLevel, tag: *u8, messageStream: *OStringStream) { this.vtable.LogStream(this, logLevel, tag, messageStream); }

            LogSystemInterface_Flush :: inline (this: *LogSystemInterface) { this.vtable.Flush(this); }

            LogSystemInterface_Stop :: inline (this: *LogSystemInterface) { this.vtable.Stop(this); }

            vtable :: (obj: *LogSystemInterface) -> *LogSystemInterface_VTable { return obj.vtable; }


            /**
            * Interface for CRT (common runtime libraries) logging implementations.
            * A wrapper on the top of aws_logger, the logging interface used by common runtime libraries.
            */
            CRTLogSystemInterface :: struct {
                vtable: *CRTLogSystemInterface_VTable;
            }
            CRTLogSystemInterface_VTable :: struct #type_info_none {
                Destructor: (this: *CRTLogSystemInterface, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                GetLogLevel: (this: *CRTLogSystemInterface) -> LogLevel #cpp_method;

                SetLogLevel: (this: *CRTLogSystemInterface, logLevel: LogLevel) -> void #cpp_method;

                Log: *void;

                CleanUp: (this: *CRTLogSystemInterface) -> void #cpp_method;
            }

            CRTLogSystemInterface_Destructor :: inline (this: *CRTLogSystemInterface, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            CRTLogSystemInterface_GetLogLevel :: inline (this: *CRTLogSystemInterface) -> LogLevel { return this.vtable.GetLogLevel(this); }

            CRTLogSystemInterface_SetLogLevel :: inline (this: *CRTLogSystemInterface, logLevel: LogLevel) { this.vtable.SetLogLevel(this, logLevel); }

            CRTLogSystemInterface_CleanUp :: inline (this: *CRTLogSystemInterface) { this.vtable.CleanUp(this); }

            vtable :: (obj: *CRTLogSystemInterface) -> *CRTLogSystemInterface_VTable { return obj.vtable; }


            /**
            * The default CRT log system will just do a redirection of all logs from common runtime libraries to C++ SDK.
            */
            DefaultCRTLogSystem :: struct {
                #as using crtlogsysteminterface: CRTLogSystemInterface;
            }
        }

        ARRAY_ALLOCATION_TAG: *u8 = "Aws::Array";

        /**
        * Safe array class with move and copy semantics.
        */
        Array :: struct(T: Type) {
            m_size: u64;

            m_data: UniqueArrayPtr(T);
        }

        ByteBuffer :: Array(u8);

        /**
        * Buffer for cryptographic operations. It zeroes itself back out upon deletion. Everything else is identical
        * to byte buffer.
        */
        CryptoBuffer :: struct {
            #as using bytebuffer: ByteBuffer;
            vtable: *CryptoBuffer_VTable;
        }
        CryptoBuffer_VTable :: struct #type_info_none {
            Destructor: (this: *CryptoBuffer, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;
        }
        CryptoBuffer_Destructor :: inline (this: *CryptoBuffer, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

        vtable :: (obj: *CryptoBuffer) -> *CryptoBuffer_VTable { return obj.vtable; }


        Crypto :: struct {
            SymmetricCipher :: struct {}

            SymmetricCipherFactory :: struct {}
            SecureRandomBytes :: struct {}
            SecureRandomFactory :: struct {}

            HashResult :: Outcome(ByteBuffer, bool);

            /**
            * Interface for computing hash codes using various hash algorithms
            */
            Hash :: struct {
                vtable: *Hash_VTable;
                // when hashing streams, this is the size of our internal buffer we read the stream into
                INTERNAL_HASH_STREAM_BUFFER_SIZE: u32 : 8192;
            }
            Hash_VTable :: struct #type_info_none {
                Destructor: (this: *Hash, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                Calculate: (this: *Hash, stream: *IStream) -> HashResult #cpp_method;

                Calculate_1: (this: *Hash, str: /*const reference*/ *String) -> HashResult #cpp_method;

                Update: (this: *Hash, unknown0: *u8, bufferSize: u64) -> void #cpp_method;

                GetHash: (this: *Hash) -> HashResult #cpp_method;
            }

            Hash_Destructor :: inline (this: *Hash, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            Hash_Calculate :: inline (this: *Hash, stream: /*reference*/ *IStream) -> HashResult { return this.vtable.Calculate(this, stream); }

            Hash_Calculate_1 :: inline (this: *Hash, str: /*const reference*/ *String) -> HashResult { return this.vtable.Calculate_1(this, str); }

            Hash_Update :: inline (this: *Hash, unknown0: *u8, bufferSize: u64) { this.vtable.Update(this, unknown0, bufferSize); }

            Hash_GetHash :: inline (this: *Hash) -> HashResult { return this.vtable.GetHash(this); }

            vtable :: (obj: *Hash) -> *Hash_VTable { return obj.vtable; }


            /**
            * Simple abstract factory interface. Subclass this and create a factory if you want to control
            * how Hash objects are created.
            */
            HashFactory :: struct {
                vtable: *HashFactory_VTable;
            }
            HashFactory_VTable :: struct #type_info_none {
                Destructor: (this: *HashFactory, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                CreateImplementation: (this: *HashFactory) -> std.shared_ptr(Hash) #cpp_method;

                InitStaticState: (this: *HashFactory) -> void #cpp_method;

                CleanupStaticState: (this: *HashFactory) -> void #cpp_method;
            }

            HashFactory_Destructor :: inline (this: *HashFactory, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            HashFactory_CreateImplementation :: inline (this: *HashFactory) -> std.shared_ptr(Hash) { return this.vtable.CreateImplementation(this); }

            HashFactory_InitStaticState :: inline (this: *HashFactory) { this.vtable.InitStaticState(this); }

            HashFactory_CleanupStaticState :: inline (this: *HashFactory) { this.vtable.CleanupStaticState(this); }

            vtable :: (obj: *HashFactory) -> *HashFactory_VTable { return obj.vtable; }


            WindowsHashImpl :: struct {}

            /**
            * Sha256 hash implementation.
            */
            Sha256 :: struct {
                #as using hash: Hash;

                m_hashImpl: std.shared_ptr(Hash);
            }

            /**
            * Interface for HMAC hash providers. To implement an HMAC provider, inherit from this class and override Calculate.
            */
            HMAC :: struct {
                vtable: *HMAC_VTable;
            }
            HMAC_VTable :: struct #type_info_none {
                Destructor: (this: *HMAC, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                Calculate: (this: *HMAC, toSign: *ByteBuffer, secret: *ByteBuffer) -> HashResult #cpp_method;
            }

            HMAC_Destructor :: inline (this: *HMAC, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            HMAC_Calculate :: inline (this: *HMAC, toSign: *ByteBuffer, secret: *ByteBuffer) -> HashResult { return this.vtable.Calculate(this, toSign, secret); }

            vtable :: (obj: *HMAC) -> *HMAC_VTable { return obj.vtable; }


            /**
            * Simple abstract factory interface. Subclass this and create a factory if you want to control
            * how HMAC Hash objects are created.
            */
            HMACFactory :: struct {
                vtable: *HMACFactory_VTable;
            }
            HMACFactory_VTable :: struct #type_info_none {
                Destructor: (this: *HMACFactory, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                CreateImplementation: (this: *HMACFactory) -> std.shared_ptr(HMAC) #cpp_method;

                InitStaticState: (this: *HMACFactory) -> void #cpp_method;

                CleanupStaticState: (this: *HMACFactory) -> void #cpp_method;
            }

            HMACFactory_Destructor :: inline (this: *HMACFactory, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            HMACFactory_CreateImplementation :: inline (this: *HMACFactory) -> std.shared_ptr(HMAC) { return this.vtable.CreateImplementation(this); }

            HMACFactory_InitStaticState :: inline (this: *HMACFactory) { this.vtable.InitStaticState(this); }

            HMACFactory_CleanupStaticState :: inline (this: *HMACFactory) { this.vtable.CleanupStaticState(this); }

            vtable :: (obj: *HMACFactory) -> *HMACFactory_VTable { return obj.vtable; }


            /**
            * Sha256 HMAC implementation
            */
            Sha256HMAC :: struct {
                #as using hmac: HMAC;

                m_hmacImpl: std.shared_ptr(HMAC);
            }

            MD5 :: struct {}
        }

        Threading :: struct {
            Executor :: struct {}

            Semaphore :: struct {
                m_count:     u64;
                m_maxCount:  u64;
                m_mutex:     std.mutex;
                m_syncPoint: std.condition_variable;
            }

            /**
            * This lock is optimized for frequent reads and infrequent writes.
            * However, writers get priority to the lock.
            */
            ReaderWriterLock :: struct {
                m_readers:    std.atomic(s64);
                m_holdouts:   std.atomic(s64);
                m_readerSem:  Semaphore;
                m_writerSem:  Semaphore;
                m_writerLock: std.mutex;
            }

            ReaderLockGuard :: struct {
                Constructor :: (this: *ReaderLockGuard, rwl: *ReaderWriterLock) -> void #cpp_method #foreign aws_cpp_sdk_s3 "??0ReaderLockGuard@Threading@Utils@Aws@@QEAA@AEAVReaderWriterLock@123@@Z";

                Destructor :: (this: *ReaderLockGuard) -> void #cpp_method #foreign aws_cpp_sdk_s3 "??1ReaderLockGuard@Threading@Utils@Aws@@QEAA@XZ";

                m_rwlock:   *ReaderWriterLock;
                m_upgraded: bool;
            }

            WriterLockGuard :: struct {
                Constructor :: (this: *WriterLockGuard, rwl: *ReaderWriterLock) -> void #cpp_method #foreign aws_cpp_sdk_s3 "??0WriterLockGuard@Threading@Utils@Aws@@QEAA@AEAVReaderWriterLock@123@@Z";

                Destructor :: (this: *WriterLockGuard) -> void #cpp_method #foreign aws_cpp_sdk_s3 "??1WriterLockGuard@Threading@Utils@Aws@@QEAA@XZ";

                m_rwlock: *ReaderWriterLock;
            }
        }

        RateLimits :: struct {
            RateLimiterInterface :: struct {}
        }

        /**
        * Template class representing the outcome of making a request.  It will contain
        * either a successful result or the failure error.  The caller must check
        * whether the outcome of the request was a success before attempting to access
        *  the result or the error.
        */
        Outcome :: struct(R: Type, E: Type) {
            result:     R;
            error:      E;
            success     := false;
            retryCount: u32 = 0;
        }

        DateFormat :: enum s32 {
            RFC822         :: 0;
            ISO_8601       :: 1;
            ISO_8601_BASIC :: 2;
            AutoDetect     :: 3;
        }

        Month :: enum s32 {
            January   :: 0;
            February  :: 1;
            March     :: 2;
            April     :: 3;
            May       :: 4;
            June      :: 5;
            July      :: 6;
            August    :: 7;
            September :: 8;
            October   :: 9;
            November  :: 10;
            December  :: 11;
        }

        DayOfWeek :: enum s32 {
            Sunday    :: 0;
            Monday    :: 1;
            Tuesday   :: 2;
            Wednesday :: 3;
            Thursday  :: 4;
            Friday    :: 5;
            Saturday  :: 6;
        }

        /**
        * Wrapper for timestamp functionality.
        */
        DateTime :: struct {
            m_time:  std.chrono.system_clock.time_point;
            m_valid: bool;
        }

        Event :: struct {
            Message :: struct {}
        }

        /**
        * All the things the c++ stdlib is missing for string operations that I needed.
        */
        StringUtils :: struct {
            SplitOptions :: enum s32 {
                NOT_SET                :: 0;

                INCLUDE_EMPTY_ENTRIES  :: 1;

                INCLUDE_EMPTY_SEGMENTS :: 2;
            }
            __empty_struct_padding: u8; // C++ makes empty structs have length 1
        }

        Stream :: struct {
            /**
            * Encapsulates and manages ownership of custom response streams. This is a move only type.
            */
            ResponseStream :: struct {
                m_underlyingStream: *IOStream = null;
            }

            /**
            * A default IOStream for ResponseStream.
            */
            DefaultUnderlyingStream :: struct {
                #as using iostream: IOStream;
                vtable: *DefaultUnderlyingStream_VTable;

                Base :: IOStream;
            }
            DefaultUnderlyingStream_VTable :: struct #type_info_none {
                Destructor: (this: *DefaultUnderlyingStream, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;
            }
            DefaultUnderlyingStream_Destructor :: inline (this: *DefaultUnderlyingStream, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            vtable :: (obj: *DefaultUnderlyingStream) -> *DefaultUnderlyingStream_VTable { return obj.vtable; }

        }

        UUID_BINARY_SIZE: u64 : 16;

        /**
        * Class encapsulating a UUID. This is platform dependent. The method you are most likely interested in is RandomUUID().
        */
        UUID :: struct {
            m_uuid: [16] u8;
        }

        Xml :: struct {
            /**
            * Node in an Xml Document
            */
            XmlNode :: struct {
                //we do not own these.... I just had to change it from ref because the compiler was
                //confused about which assignment operator to call. Do not... I repeat... do not delete
                //these pointers in your destructor.
                m_node: *External.tinyxml2.XMLNode = null;
                m_doc:  *XmlDocument = null;
            }

            /**
            * Container for Xml Document as a whole. All nodes have a reference to their parent document. Any changes
            * you make to the nodes will be reflected here.
            */
            XmlDocument :: struct {
                m_doc: *External.tinyxml2.XMLDocument = null;
            }
        }

        Document :: struct {}
        DocumentView :: struct {}

        Json :: struct {
            /**
            * JSON DOM manipulation class.
            * To read or serialize use @ref View function.
            */
            JsonValue :: struct {
                m_value:              *cJSON;
                m_wasParseSuccessful: bool;
                m_errorMessage:       String;
            }

            /**
            * Provides read-only view to an existing JsonValue. This allows lightweight copying without making deep
            * copies of the JsonValue.
            * Note: This class does not extend the lifetime of the given JsonValue. It's your responsibility to ensure
            * the lifetime of the JsonValue is extended beyond the lifetime of its view.
            */
            JsonView :: struct {
                m_value: *cJSON;
            }
        }

        EnumParseOverflowContainer :: struct {}
    }

    /**
    * modeled from std::default_delete
    */
    Deleter :: struct(T: Type) {}

    /*
    * A UniquePtr that ensures that underlying pointer is set to null on destruction.
    *   ...thanks to the legacy design, UniquePtr is used as a static global variable that may be destructed twice.
    */
    UniquePtrSafeDeleted :: struct(T: Type, D: Type) {
        #as uniqueptr: UniquePtr(T, D); // jai: no "using" to avoid name-clashes
    }

    ArrayDeleter :: struct(T: Type) {}

    Crt :: struct {
        Allocator :: aws_allocator;

        /**
        * @deprecated Use ApiAllocator() instead, to avoid issues with delay-loaded DLLs.
        * https://github.com/aws/aws-sdk-cpp/issues/1960
        */
        g_allocator: *Allocator;

        /**
        * Stateful allocator variant that uses an underlying CRT allocator
        * @tparam T type that allocator can allocate
        */
        StlAllocator :: struct(T: Type) {
            #as allocator_: std.allocator(T); // jai: no "using" to avoid name-clashes

            Base :: std.allocator(T);

            rebind :: struct(U: Type) {
                other :: StlAllocator(U);
            }

            RawPointer :: std;

            m_allocator: *Allocator;
        }

        /**
        * Custom implementation of an in_place type tag for constructor parameter list
        */
        InPlaceT :: struct {
            __empty_struct_padding: u8; // C++ makes empty structs have length 1
        }

        InPlace: InPlaceT;

        InPlaceTypeT :: struct(T: Type) {}

        /**
        * Custom implementation of an Option type.  std::optional requires C++17
        * @tparam T type of the optional value
        */
        Optional :: struct(T: Type) {
            m_storage: [sizeof(T)] u8;
            m_value:   *T;
        }

        Http :: struct {
            HttpRequest :: struct {}
        }

        /**
        * Custom string view implementation in order to meet C++11 baseline
        * @tparam CharT
        * @tparam Traits
        */
        basic_string_view :: struct(CharT: Type, Traits: Type) {
            // types
            traits_type :: Traits;
            value_type :: CharT;
            pointer :: *value_type;
            const_pointer :: *value_type;
            reference :: *value_type;
            const_reference :: *value_type;
            const_iterator :: *value_type;
            iterator :: const_iterator;
            const_reverse_iterator :: std.reverse_iterator(const_iterator);
            reverse_iterator :: const_reverse_iterator;
            size_type :: u64;
            difference_type :: ptrdiff_t;
            npos:                   size_type : 0xffff_ffff_ffff_ffff;

            m_size:                 size_type;
            m_data:                 *CharT;
        }

        string_view :: basic_string_view(u8);
        u16string_view :: basic_string_view(u16);
        u32string_view :: basic_string_view(u32);
        wstring_view :: basic_string_view(s16);

        StringView :: string_view;

        ByteBuf :: aws_byte_buf;
        ByteCursor :: aws_byte_cursor;

        Io :: struct {
            IStream :: basic_istream(u8, std.char_traits(u8));

            /**
            * A collection of event loops.
            *
            * An event-loop is a thread for doing async work, such as I/O. Classes that need to do async work will ask
            * the EventLoopGroup for an event-loop to use.
            *
            * The number of threads used depends on your use-case. IF you
            * have a maximum of less than a few hundred connections 1 thread is the ideal
            * threadCount.
            *
            * There should only be one instance of an EventLoopGroup per application and it
            * should be passed to all network clients. One exception to this is if you
            * want to peg different types of IO to different threads. In that case, you
            * may want to have one event loop group dedicated to one IO activity and another
            * dedicated to another type.
            */
            EventLoopGroup :: struct {
                m_eventLoopGroup: *aws_event_loop_group;
                m_lastError:      s32;
            }

            HostAddress :: aws_host_address;

            /**
            * Invoked upon resolution of an address. You do not own the memory pointed to in addresses, if you persist
            * the data, copy it first. If errorCode is AWS_ERROR_SUCCESS, the operation succeeded. Otherwise, the
            * operation failed.
            */
            OnHostResolved :: std.function(#type (resolver: *HostResolver, addresses: *std.vector(HostAddress), errorCode: s32) -> void #c_call);

            /**
            * Simple interface for DNS name lookup implementations
            */
            HostResolver :: struct {
                vtable: *HostResolver_VTable;
            }
            HostResolver_VTable :: struct #type_info_none {
                Destructor: (this: *HostResolver, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;
                ResolveHost: (this: *HostResolver, host: *String, onResolved: *OnHostResolved) -> bool #cpp_method;

                GetUnderlyingHandle: (this: *HostResolver) -> *aws_host_resolver #cpp_method;

                GetConfig: (this: *HostResolver) -> *aws_host_resolution_config #cpp_method;
            }

            HostResolver_Destructor :: inline (this: *HostResolver, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }
            HostResolver_ResolveHost :: inline (this: *HostResolver, host: *String, onResolved: *OnHostResolved) -> bool { return this.vtable.ResolveHost(this, host, onResolved); }

            HostResolver_GetUnderlyingHandle :: inline (this: *HostResolver) -> *aws_host_resolver { return this.vtable.GetUnderlyingHandle(this); }

            HostResolver_GetConfig :: inline (this: *HostResolver) -> *aws_host_resolution_config { return this.vtable.GetConfig(this); }

            vtable :: (obj: *HostResolver) -> *HostResolver_VTable { return obj.vtable; }


            /**
            * A wrapper around the CRT default host resolution system that uses getaddrinfo() farmed off
            * to separate threads in order to resolve names.
            */
            DefaultHostResolver :: struct {
                #as using hostresolver: HostResolver;

                m_resolver:    *aws_host_resolver;
                m_config:      aws_host_resolution_config;
                m_allocator:   *Allocator;
                m_initialized: bool;
            }

            OnClientBootstrapShutdownComplete :: std.function(#type () -> void #c_call);

            /**
            * A ClientBootstrap handles creation and setup of socket connections
            * to specific endpoints.
            *
            * Note that ClientBootstrap may not clean up all its behind-the-scenes
            * resources immediately upon destruction. If you need to know when
            * behind-the-scenes shutdown is complete, use SetShutdownCompleteCallback()
            * or EnableBlockingShutdown() (only safe on main thread).
            */
            ClientBootstrap :: struct {
                m_bootstrap:              *aws_client_bootstrap;
                m_lastError:              s32;
                ClientBootstrapCallbackData :: struct {}
                m_callbackData:           std.unique_ptr(ClientBootstrapCallbackData);
                m_shutdownFuture:         std.future(void);
                m_enableBlockingShutdown: bool;
            }

            ChannelDirection :: enum s32 {
                Read  :: 0;
                Write :: 1;
            }

            MessageType :: enum s32 {
                ApplicationData :: 0;
            }

            TaskStatus :: enum s32 {
                RunReady :: 0;
                Canceled :: 1;
            }

            /**
            * Wrapper for aws-c-io channel handlers. The semantics are identical as the functions on
            * aws_channel_handler.
            *
            * All virtual calls are made from the same thread (the channel's thread).
            */
            ChannelHandler :: struct {
                vtable: *ChannelHandler_VTable;
                m_handler:       aws_channel_handler;
                m_allocator:     *Allocator;

                m_selfReference: std.shared_ptr(ChannelHandler);
            }
            ChannelHandler_VTable :: struct #type_info_none {
                Destructor: (this: *ChannelHandler, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                ProcessReadMessage: (this: *ChannelHandler, message: *aws_io_message) -> s32 #cpp_method;

                ProcessWriteMessage: (this: *ChannelHandler, message: *aws_io_message) -> s32 #cpp_method;

                IncrementReadWindow: (this: *ChannelHandler, size: u64) -> s32 #cpp_method;

                ProcessShutdown: (this: *ChannelHandler, dir: ChannelDirection, errorCode: s32, freeScarceResourcesImmediately: bool) -> void #cpp_method;

                InitialWindowSize: (this: *ChannelHandler) -> u64 #cpp_method;

                MessageOverhead: (this: *ChannelHandler) -> u64 #cpp_method;

                ResetStatistics: (this: *ChannelHandler) -> void #cpp_method;

                GatherStatistics: (this: *ChannelHandler, unknown0: *aws_array_list) -> void #cpp_method;
            }

            ChannelHandler_Destructor :: inline (this: *ChannelHandler, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            ChannelHandler_ProcessReadMessage :: inline (this: *ChannelHandler, message: *aws_io_message) -> s32 { return this.vtable.ProcessReadMessage(this, message); }

            ChannelHandler_ProcessWriteMessage :: inline (this: *ChannelHandler, message: *aws_io_message) -> s32 { return this.vtable.ProcessWriteMessage(this, message); }

            ChannelHandler_IncrementReadWindow :: inline (this: *ChannelHandler, size: u64) -> s32 { return this.vtable.IncrementReadWindow(this, size); }

            ChannelHandler_ProcessShutdown :: inline (this: *ChannelHandler, dir: ChannelDirection, errorCode: s32, freeScarceResourcesImmediately: bool) { this.vtable.ProcessShutdown(this, dir, errorCode, freeScarceResourcesImmediately); }

            ChannelHandler_InitialWindowSize :: inline (this: *ChannelHandler) -> u64 { return this.vtable.InitialWindowSize(this); }

            ChannelHandler_MessageOverhead :: inline (this: *ChannelHandler) -> u64 { return this.vtable.MessageOverhead(this); }

            ChannelHandler_ResetStatistics :: inline (this: *ChannelHandler) { this.vtable.ResetStatistics(this); }

            ChannelHandler_GatherStatistics :: inline (this: *ChannelHandler, unknown0: *aws_array_list) { this.vtable.GatherStatistics(this, unknown0); }

            vtable :: (obj: *ChannelHandler) -> *ChannelHandler_VTable { return obj.vtable; }


            Pkcs11Lib :: struct {}

            TlsMode :: enum s32 {
                CLIENT :: 0;
                SERVER :: 1;
            }

            /**
            * Top-level tls configuration options.  These options are used to create a context from which
            * per-connection TLS contexts can be created.
            */
            TlsContextOptions :: struct {
                vtable: *TlsContextOptions_VTable;
                m_options: aws_tls_ctx_options;
                m_isInit:  bool;
            }
            TlsContextOptions_VTable :: struct #type_info_none {
                Destructor: (this: *TlsContextOptions, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;
            }
            TlsContextOptions_Destructor :: inline (this: *TlsContextOptions, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            vtable :: (obj: *TlsContextOptions) -> *TlsContextOptions_VTable { return obj.vtable; }


            /**
            * Options for TLS, when using a PKCS#11 library for private key operations.
            *
            * @see TlsContextOptions::InitClientWithMtlsPkcs11()
            */
            TlsContextPkcs11Options :: struct {
                m_pkcs11Lib:               std.shared_ptr(Pkcs11Lib);
                m_slotId:                  Optional(u64);
                m_userPin:                 Optional(String);
                m_tokenLabel:              Optional(String);
                m_privateKeyObjectLabel:   Optional(String);
                m_certificateFilePath:     Optional(String);
                m_certificateFileContents: Optional(String);
            }

            /**
            * Options specific to a single connection.
            */
            TlsConnectionOptions :: struct {
                m_tls_connection_options: aws_tls_connection_options;
                m_allocator:              *aws_allocator;
                m_lastError:              s32;
                m_isInit:                 bool;
            }

            /**
            * Stateful context for TLS with a given configuration.  Per-connection TLS "contexts"
            * (TlsConnectionOptions) are instantiated from this as needed.
            */
            TlsContext :: struct {
                m_ctx:                 std.shared_ptr(aws_tls_ctx);
                m_initializationError: s32;
            }

            NewTlsContextImplCallback :: std.function(#type (unknown0: *TlsContextOptions, unknown1: TlsMode, unknown2: *Allocator) -> *void #c_call);
            DeleteTlsContextImplCallback :: std.function(#type (unknown0: *void) -> void #c_call);
            IsTlsAlpnSupportedCallback :: std.function(#type () -> bool #c_call);

            /**
            * BYO_CRYPTO: TLS channel-handler base class.
            */
            TlsChannelHandler :: struct {
                #as using channelhandler: ChannelHandler;

                m_OnNegotiationResult: aws_tls_on_negotiation_result_fn;
                m_userData:            *void;

                m_protocolByteBuf:     aws_byte_buf;
                #place channelhandler; tlschannelhandler_vtable: *TlsChannelHandler_VTable;
            }
            TlsChannelHandler_VTable :: struct #type_info_none {
                using channelhandler: ChannelHandler_VTable;
                GetProtocol: (this: *TlsChannelHandler) -> String #cpp_method;
            }
            TlsChannelHandler_GetProtocol :: inline (this: *TlsChannelHandler) -> String { return this.tlschannelhandler_vtable.GetProtocol(this); }

            vtable :: (obj: *TlsChannelHandler) -> *TlsChannelHandler_VTable { return obj.tlschannelhandler_vtable; }


            /**
            * BYO_CRYPTO: Client TLS channel-handler base class.
            *
            * If using BYO_CRYPTO, you must define a concrete implementation
            * and set its creation callback via ApiHandle.SetBYOCryptoClientTlsCallback().
            */
            ClientTlsChannelHandler :: struct {
                #as using tlschannelhandler: TlsChannelHandler;
                #place tlschannelhandler; clienttlschannelhandler_vtable: *ClientTlsChannelHandler_VTable;
            }
            ClientTlsChannelHandler_VTable :: struct #type_info_none {
                using tlschannelhandler: TlsChannelHandler_VTable;
                StartNegotiation: (this: *ClientTlsChannelHandler) -> void #cpp_method;
            }
            ClientTlsChannelHandler_StartNegotiation :: inline (this: *ClientTlsChannelHandler) { this.clienttlschannelhandler_vtable.StartNegotiation(this); }

            vtable :: (obj: *ClientTlsChannelHandler) -> *ClientTlsChannelHandler_VTable { return obj.clienttlschannelhandler_vtable; }


            NewClientTlsHandlerCallback :: std.function(#type (slot: *aws_channel_slot, options: *aws_tls_connection_options, allocator: *Allocator) -> std.shared_ptr(ClientTlsChannelHandler) #c_call);
        }

        Mqtt :: struct {
            QOS :: aws_mqtt_qos;
            ReturnCode :: aws_mqtt_connect_return_code;
        }

        String :: std.basic_string(u8, std.char_traits(u8), StlAllocator(u8));
        StringStream :: std.basic_stringstream(u8, std.char_traits(u8), StlAllocator(u8));

        DateFormat :: enum s32 {
            RFC822     :: 0;
            ISO_8601   :: 1;
            AutoDetect :: 3;
        }

        Month :: enum s32 {
            January   :: 0;
            February  :: 1;
            March     :: 2;
            April     :: 3;
            May       :: 4;
            June      :: 5;
            July      :: 6;
            August    :: 7;
            September :: 8;
            October   :: 9;
            November  :: 10;
            December  :: 11;
        }

        DayOfWeek :: enum s32 {
            Sunday    :: 0;
            Monday    :: 1;
            Tuesday   :: 2;
            Wednesday :: 3;
            Thursday  :: 4;
            Friday    :: 5;
            Saturday  :: 6;
        }

        DateTime :: struct {
            m_date_time: aws_date_time;
            m_good:      bool;
        }

        Auth :: struct {
            /**
            * RTTI indicator for signing configuration.  We currently only support a single type (AWS), but
            * we could expand to others in the future if needed.
            */
            SigningConfigType :: enum s32 {
                Aws :: 1;
            }

            /**
            * HTTP signing callback.  The second parameter is an aws error code,  The signing was successful
            * if the error code is AWS_ERROR_SUCCESS.
            */
            OnHttpRequestSigningComplete :: std.function(#type (unknown0: *std.shared_ptr(Http.HttpRequest), unknown1: s32) -> void #c_call);

            /**
            * Base class for all different signing configurations.  Type functions as a
            * primitive RTTI for downcasting.
            */
            ISigningConfig :: struct {
                vtable: *ISigningConfig_VTable;
            }
            ISigningConfig_VTable :: struct #type_info_none {
                Destructor: (this: *ISigningConfig, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                GetType: (this: *ISigningConfig) -> SigningConfigType #cpp_method;
            }

            ISigningConfig_Destructor :: inline (this: *ISigningConfig, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            ISigningConfig_GetType :: inline (this: *ISigningConfig) -> SigningConfigType { return this.vtable.GetType(this); }

            vtable :: (obj: *ISigningConfig) -> *ISigningConfig_VTable { return obj.vtable; }


            /**
            * Abstract base for all http request signers.  Asynchronous interface.  Intended to
            * be a tight wrapper around aws-c-* signer implementations.
            */
            IHttpRequestSigner :: struct {
                vtable: *IHttpRequestSigner_VTable;
            }
            IHttpRequestSigner_VTable :: struct #type_info_none {
                Destructor: (this: *IHttpRequestSigner, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                SignRequest: (this: *IHttpRequestSigner, request: *std.shared_ptr(Http.HttpRequest), config: *ISigningConfig, completionCallback: *OnHttpRequestSigningComplete) -> bool #cpp_method;

                IsValid: (this: *IHttpRequestSigner) -> bool #cpp_method;
            }

            IHttpRequestSigner_Destructor :: inline (this: *IHttpRequestSigner, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            IHttpRequestSigner_SignRequest :: inline (this: *IHttpRequestSigner, request: *std.shared_ptr(Http.HttpRequest), config: *ISigningConfig, completionCallback: *OnHttpRequestSigningComplete) -> bool { return this.vtable.SignRequest(this, request, config, completionCallback); }

            IHttpRequestSigner_IsValid :: inline (this: *IHttpRequestSigner) -> bool { return this.vtable.IsValid(this); }

            vtable :: (obj: *IHttpRequestSigner) -> *IHttpRequestSigner_VTable { return obj.vtable; }


            Credentials :: struct {}
            ICredentialsProvider :: struct {}

            /**
            * Enumeration indicating what version of the AWS signing process we should use.
            */
            SigningAlgorithm :: enum s32 {
                _4  :: 0;

                _4A :: 1;

                SigV4  :: _4;

                SigV4A :: _4A;
            }

            /**
            * What kind of AWS signature should be computed?
            */
            SignatureType :: enum s32 {
                ViaHeaders     :: 0;

                ViaQueryParams :: 1;

                Chunk          :: 2;

                Event          :: 3;

                HttpRequestViaHeaders     :: ViaHeaders;

                HttpRequestViaQueryParams :: ViaQueryParams;

                HttpRequestChunk          :: Chunk;

                HttpRequestEvent          :: Event;
            }

            /**
            * A collection of signed body constants.  Some are specific to certain
            * signature types, while others are just there to save time (empty sha, for example).
            */
            SignedBodyValue :: struct {
                /** @deprecated to avoid issues with /DELAYLOAD on Windows. */
                UnsignedPayload: *u8;

                /** @deprecated to avoid issues with /DELAYLOAD on Windows. */
                EmptySha256: *u8;

                /** @deprecated to avoid issues with /DELAYLOAD on Windows. */
                StreamingAws4HmacSha256Payload: *u8;

                /** @deprecated to avoid issues with /DELAYLOAD on Windows. */
                StreamingAws4HmacSha256Events: *u8;
            }

            /**
            * Controls if signing adds a header containing the canonical request's body value
            */
            SignedBodyHeaderType :: enum s32 {
                None              :: 0;

                XAmzContentSha256 :: 1;
            }

            ShouldSignHeaderCb :: #type (unknown0: *ByteCursor, unknown1: *void) -> bool #c_call;

            /**
            * Wrapper around the configuration structure specific to the AWS
            * Sigv4 signing process
            */
            AwsSigningConfig :: struct {
                #as using isigningconfig: ISigningConfig;

                m_allocator:           *Allocator;
                m_credentialsProvider: std.shared_ptr(ICredentialsProvider);
                m_credentials:         std.shared_ptr(Credentials);
                m_config:              aws_signing_config_aws;
                m_signingRegion:       String;
                m_serviceName:         String;
                m_signedBodyValue:     String;
            }

            /**
            * Http request signer that performs Aws Sigv4 signing.  Expects the signing configuration to be and
            * instance of AwsSigningConfig
            */
            Sigv4HttpRequestSigner :: struct {
                #as using ihttprequestsigner: IHttpRequestSigner;

                m_allocator: *Allocator;
            }
        }

        ApiHandle :: struct {}
    }

    String :: std.basic_string(u8, std.char_traits(u8), std.allocator(u8));

    WString :: std.basic_string(s16, std.char_traits(s16), std.allocator(s16));

    StringStream :: std.basic_stringstream(u8, std.char_traits(u8), std.allocator(u8));
    IStringStream :: std.basic_istringstream(u8, std.char_traits(u8), std.allocator(u8));
    OStringStream :: std.basic_ostringstream(u8, std.char_traits(u8), std.allocator(u8));
    StringBuf :: std.basic_stringbuf(u8, std.char_traits(u8), std.allocator(u8));

    CompareStrings :: struct {
        __empty_struct_padding: u8; // C++ makes empty structs have length 1
    }

    Http :: struct {
        /**
        * Models Http methods.
        */
        HttpMethod :: enum s32 {
            GET    :: 0;
            POST   :: 1;
            DELETE :: 2;
            PUT    :: 3;
            HEAD   :: 4;
            PATCH  :: 5;

            HTTP_GET    :: GET;
            HTTP_POST   :: POST;
            HTTP_DELETE :: DELETE;
            HTTP_PUT    :: PUT;
            HTTP_HEAD   :: HEAD;
            HTTP_PATCH  :: PATCH;
        }

        /**
        * Possible default http factory vended http client implementations.
        */
        TransferLibType :: enum s32 {
            DEFAULT_CLIENT  :: 0;
            CURL_CLIENT     :: 1;
            WIN_INET_CLIENT :: 2;
            WIN_HTTP_CLIENT :: 3;
        }

        HeaderValuePair :: std.pair(String, String);
        HeaderValueCollection :: std.map(String, String);

        HttpClient :: struct {}

        /**
        * Interface and default implementation of client for Http stack
        */
        HttpClientFactory :: struct {
            vtable: *HttpClientFactory_VTable;
        }
        HttpClientFactory_VTable :: struct #type_info_none {
            Destructor: (this: *HttpClientFactory, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

            CreateHttpClient: (this: *HttpClientFactory, clientConfiguration: *Client.ClientConfiguration) -> std.shared_ptr(HttpClient) #cpp_method;

            CreateHttpRequest: (this: *HttpClientFactory, uri: *URI, method: HttpMethod, streamFactory: *IOStreamFactory) -> std.shared_ptr(HttpRequest) #cpp_method;

            CreateHttpRequest_1: (this: /*const*/ *HttpClientFactory, uri: /*const reference*/ *String, method: HttpMethod, streamFactory: /*const reference*/ *IOStreamFactory) -> std.shared_ptr(HttpRequest) #cpp_method;

            InitStaticState: (this: *HttpClientFactory) -> void #cpp_method;
            CleanupStaticState: (this: *HttpClientFactory) -> void #cpp_method;
        }

        HttpClientFactory_Destructor :: inline (this: *HttpClientFactory, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

        HttpClientFactory_CreateHttpClient :: inline (this: *HttpClientFactory, clientConfiguration: *Client.ClientConfiguration) -> std.shared_ptr(HttpClient) { return this.vtable.CreateHttpClient(this, clientConfiguration); }

        HttpClientFactory_CreateHttpRequest :: inline (this: /*const*/ *HttpClientFactory, uri: /*const reference*/ *URI, method: HttpMethod, streamFactory: /*const reference*/ *IOStreamFactory) -> std.shared_ptr(HttpRequest) { return this.vtable.CreateHttpRequest(this, uri, method, streamFactory); }

        HttpClientFactory_CreateHttpRequest_1 :: inline (this: /*const*/ *HttpClientFactory, uri: /*const reference*/ *String, method: HttpMethod, streamFactory: /*const reference*/ *IOStreamFactory) -> std.shared_ptr(HttpRequest) { return this.vtable.CreateHttpRequest_1(this, uri, method, streamFactory); }

        HttpClientFactory_InitStaticState :: inline (this: *HttpClientFactory) { this.vtable.InitStaticState(this); }
        HttpClientFactory_CleanupStaticState :: inline (this: *HttpClientFactory) { this.vtable.CleanupStaticState(this); }

        vtable :: (obj: *HttpClientFactory) -> *HttpClientFactory_VTable { return obj.vtable; }


        /**
        * Enum of Http response Codes. The integer values of the response codes correspond to the values in the RFC.
        */
        HttpResponseCode :: enum s32 {
            REQUEST_NOT_MADE                :: -1;
            CONTINUE                        :: 100;
            SWITCHING_PROTOCOLS             :: 101;
            PROCESSING                      :: 102;
            OK                              :: 200;
            CREATED                         :: 201;
            ACCEPTED                        :: 202;
            NON_AUTHORITATIVE_INFORMATION   :: 203;
            NO_CONTENT                      :: 204;
            RESET_CONTENT                   :: 205;
            PARTIAL_CONTENT                 :: 206;
            MULTI_STATUS                    :: 207;
            ALREADY_REPORTED                :: 208;
            IM_USED                         :: 226;
            MULTIPLE_CHOICES                :: 300;
            MOVED_PERMANENTLY               :: 301;
            FOUND                           :: 302;
            SEE_OTHER                       :: 303;
            NOT_MODIFIED                    :: 304;
            USE_PROXY                       :: 305;
            SWITCH_PROXY                    :: 306;
            TEMPORARY_REDIRECT              :: 307;
            PERMANENT_REDIRECT              :: 308;
            BAD_REQUEST                     :: 400;
            UNAUTHORIZED                    :: 401;
            PAYMENT_REQUIRED                :: 402;
            FORBIDDEN                       :: 403;
            NOT_FOUND                       :: 404;
            METHOD_NOT_ALLOWED              :: 405;
            NOT_ACCEPTABLE                  :: 406;
            PROXY_AUTHENTICATION_REQUIRED   :: 407;
            REQUEST_TIMEOUT                 :: 408;
            CONFLICT                        :: 409;
            GONE                            :: 410;
            LENGTH_REQUIRED                 :: 411;
            PRECONDITION_FAILED             :: 412;
            REQUEST_ENTITY_TOO_LARGE        :: 413;
            REQUEST_URI_TOO_LONG            :: 414;
            UNSUPPORTED_MEDIA_TYPE          :: 415;
            REQUESTED_RANGE_NOT_SATISFIABLE :: 416;
            EXPECTATION_FAILED              :: 417;
            IM_A_TEAPOT                     :: 418;
            AUTHENTICATION_TIMEOUT          :: 419;
            METHOD_FAILURE                  :: 420;
            UNPROC_ENTITY                   :: 422;
            LOCKED                          :: 423;
            FAILED_DEPENDENCY               :: 424;
            UPGRADE_REQUIRED                :: 426;
            PRECONDITION_REQUIRED           :: 427;
            TOO_MANY_REQUESTS               :: 429;
            REQUEST_HEADER_FIELDS_TOO_LARGE :: 431;
            LOGIN_TIMEOUT                   :: 440;
            NO_RESPONSE                     :: 444;
            RETRY_WITH                      :: 449;
            BLOCKED                         :: 450;
            REDIRECT                        :: 451;
            REQUEST_HEADER_TOO_LARGE        :: 494;
            CERT_ERROR                      :: 495;
            NO_CERT                         :: 496;
            HTTP_TO_HTTPS                   :: 497;
            CLIENT_CLOSED_TO_REQUEST        :: 499;
            INTERNAL_SERVER_ERROR           :: 500;
            NOT_IMPLEMENTED                 :: 501;
            BAD_GATEWAY                     :: 502;
            SERVICE_UNAVAILABLE             :: 503;
            GATEWAY_TIMEOUT                 :: 504;
            HTTP_VERSION_NOT_SUPPORTED      :: 505;
            VARIANT_ALSO_NEGOTIATES         :: 506;
            INSUFFICIENT_STORAGE            :: 507;
            LOOP_DETECTED                   :: 508;
            BANDWIDTH_LIMIT_EXCEEDED        :: 509;
            NOT_EXTENDED                    :: 510;
            NETWORK_AUTHENTICATION_REQUIRED :: 511;
            NETWORK_READ_TIMEOUT            :: 598;
            NETWORK_CONNECT_TIMEOUT         :: 599;
        }

        /**
        * Enum representing URI scheme.
        */
        Scheme :: enum s32 {
            P  :: 0;
            PS :: 1;

            HTTP  :: P;
            HTTPS :: PS;
        }

        /**
        * Enum to represent version of the http protocol to use
        */
        Version :: enum s32 {
            NONE               :: 0;
            _1_0               :: 1;
            _1_1               :: 2;
            _2_0               :: 3;
            _2TLS              :: 4;
            _2_PRIOR_KNOWLEDGE :: 5;
            _3                 :: 6;
            _3ONLY             :: 7;

            HTTP_VERSION_NONE              :: NONE;
            HTTP_VERSION_1_0               :: _1_0;
            HTTP_VERSION_1_1               :: _1_1;
            HTTP_VERSION_2_0               :: _2_0;
            HTTP_VERSION_2TLS              :: _2TLS;
            HTTP_VERSION_2_PRIOR_KNOWLEDGE :: _2_PRIOR_KNOWLEDGE;
            HTTP_VERSION_3                 :: _3;
            HTTP_VERSION_3ONLY             :: _3ONLY;
        }

        SEPARATOR: *u8;
        HTTP_DEFAULT_PORT: u16 : 80;
        HTTPS_DEFAULT_PORT: u16 : 443;

        s_compliantRfc3986Encoding: bool;

        s_preservePathSeparators: bool;

        //per https://tools.ietf.org/html/rfc3986#section-3.4 there is nothing preventing servers from allowing
        //multiple values for the same key. So use a multimap instead of a map.
        QueryStringParameterCollection :: std.multimap(String, String);

        /**
        * class modeling universal resource identifier, but implemented for http
        */
        URI :: struct {
            /**
            * Gets the domain portion of the uri
            */
            GetAuthority :: (this: *URI) -> *String #cpp_method #foreign aws_cpp_sdk_s3 "?GetAuthority@URI@Http@Aws@@QEBAAEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@XZ";

            m_scheme:               Scheme = .P;
            m_authority:            String;
            m_port:                 u16 = HTTP_DEFAULT_PORT;
            m_pathSegments:         std.vector(String);
            m_pathHasTrailingSlash  := false;
            m_useRfcEncoding        := false;
            m_queryString:          String;
        }

        DATE_HEADER: *u8;
        AWS_DATE_HEADER: *u8;
        AWS_SECURITY_TOKEN: *u8;
        ACCEPT_HEADER: *u8;
        ACCEPT_CHAR_SET_HEADER: *u8;
        ACCEPT_ENCODING_HEADER: *u8;
        AUTHORIZATION_HEADER: *u8;
        AWS_AUTHORIZATION_HEADER: *u8;
        COOKIE_HEADER: *u8;
        DECODED_CONTENT_LENGTH_HEADER: *u8;
        CONTENT_LENGTH_HEADER: *u8;
        CONTENT_TYPE_HEADER: *u8;
        CONTENT_ENCODING_HEADER: *u8;
        TRANSFER_ENCODING_HEADER: *u8;
        USER_AGENT_HEADER: *u8;
        VIA_HEADER: *u8;
        HOST_HEADER: *u8;
        AMZ_TARGET_HEADER: *u8;
        X_AMZ_EXPIRES_HEADER: *u8;
        CONTENT_MD5_HEADER: *u8;
        API_VERSION_HEADER: *u8;
        AWS_TRAILER_HEADER: *u8;
        SDK_INVOCATION_ID_HEADER: *u8;
        SDK_REQUEST_HEADER: *u8;
        X_AMZN_TRACE_ID_HEADER: *u8;
        CHUNKED_VALUE: *u8;
        AWS_CHUNKED_VALUE: *u8;
        X_AMZN_ERROR_TYPE: *u8;

        /**
        * closure type for receiving notifications that data has been received.
        */
        DataReceivedEventHandler :: std.function(#type (unknown0: *HttpRequest, unknown1: *HttpResponse, unknown2: s64) -> void #c_call);

        /**
        * closure type for receiving notifications that data has been sent.
        */
        DataSentEventHandler :: std.function(#type (unknown0: *HttpRequest, unknown1: s64) -> void #c_call);

        /**
        * Closure type for handling whether or not a request should be canceled.
        */
        ContinueRequestHandler :: std.function(#type (unknown0: *HttpRequest) -> bool #c_call);

        /**
        * A "grab bag" of anything that requests can dynamically attach to a
        * request to be used later in the call flow.
        */
        ServiceSpecificParameters :: struct {
            parameterMap: std.map(String, String);
        }

        /**
        * Abstract class for representing an HttpRequest.
        */
        HttpRequest :: struct {
            vtable: *HttpRequest_VTable;
            /**
            * Adds a query string parameter to the underlying URI by key and value.
            */
            AddQueryStringParameter :: (this: *HttpRequest, key: *u8, value: *String) -> void #cpp_method #foreign aws_cpp_sdk_s3 "?AddQueryStringParameter@HttpRequest@Http@Aws@@QEAAXPEBDAEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@@Z";
            AddQueryStringParameter :: (this: *HttpRequest, key: *u8, value: String) #no_context {
                AddQueryStringParameter(this, key, *value);
            }

            GetServiceSpecificParameters :: (this: *HttpRequest) -> std.shared_ptr(ServiceSpecificParameters) #cpp_method #foreign aws_cpp_sdk_s3 "?GetServiceSpecificParameters@HttpRequest@Http@Aws@@QEAA?AV?$shared_ptr@UServiceSpecificParameters@Http@Aws@@@std@@XZ";

            m_uri:                       URI;
            m_method:                    HttpMethod;
            m_isEvenStreamRequest:       bool;
            m_onDataReceived:            DataReceivedEventHandler;
            m_onDataSent:                DataSentEventHandler;
            m_continueRequest:           ContinueRequestHandler;
            m_signingRegion:             String;
            m_signingAccessKey:          String;
            m_resolvedRemoteHost:        String;
            m_httpRequestMetrics:        Monitoring.HttpClientMetricsCollection;
            m_requestHash:               std.pair(String, std.shared_ptr(Utils.Crypto.Hash));
            m_responseValidationHashes:  std.vector(std.pair(String, std.shared_ptr(Utils.Crypto.Hash)));
            m_serviceSpecificParameters: std.shared_ptr(ServiceSpecificParameters);
        }
        HttpRequest_VTable :: struct #type_info_none {
            Destructor: (this: *HttpRequest, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

            GetHeaders: (this: *HttpRequest) -> HeaderValueCollection #cpp_method;

            GetHeaderValue: (this: *HttpRequest, headerName: *u8) -> *String #cpp_method;

            SetHeaderValue: (this: *HttpRequest, headerName: *String, headerValue: *String) -> void #cpp_method;

            SetHeaderValue_1: (this: *HttpRequest, headerName: /*const*/ *u8, headerValue: /*const reference*/ *String) -> void #cpp_method;

            DeleteHeader: (this: *HttpRequest, headerName: *u8) -> void #cpp_method;

            AddContentBody: (this: *HttpRequest, strContent: *std.shared_ptr(IOStream)) -> void #cpp_method;

            GetContentBody: (this: *HttpRequest) -> *std.shared_ptr(IOStream) #cpp_method;

            HasHeader: (this: *HttpRequest, name: *u8) -> bool #cpp_method;

            GetSize: (this: *HttpRequest) -> s64 #cpp_method;

            GetResponseStreamFactory: (this: *HttpRequest) -> *IOStreamFactory #cpp_method;

            SetResponseStreamFactory: (this: *HttpRequest, factory: *IOStreamFactory) -> void #cpp_method;

            AddRequestMetric: (this: *HttpRequest, key: *String, value: s64) -> void #cpp_method;

            SetRequestMetrics: (this: *HttpRequest, collection: *Monitoring.HttpClientMetricsCollection) -> void #cpp_method;

            GetRequestMetrics: (this: *HttpRequest) -> *Monitoring.HttpClientMetricsCollection #cpp_method;

            ToCrtHttpRequest: (this: *HttpRequest) -> std.shared_ptr(Crt.Http.HttpRequest) #cpp_method;
        }

        HttpRequest_Destructor :: inline (this: *HttpRequest, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

        HttpRequest_GetHeaders :: inline (this: *HttpRequest) -> HeaderValueCollection { return this.vtable.GetHeaders(this); }

        HttpRequest_GetHeaderValue :: inline (this: *HttpRequest, headerName: *u8) -> *String { return this.vtable.GetHeaderValue(this, headerName); }

        HttpRequest_SetHeaderValue :: inline (this: *HttpRequest, headerName: /*const reference*/ *String, headerValue: /*const reference*/ *String) { this.vtable.SetHeaderValue(this, headerName, headerValue); }

        HttpRequest_SetHeaderValue_1 :: inline (this: *HttpRequest, headerName: /*const*/ *u8, headerValue: /*const reference*/ *String) { this.vtable.SetHeaderValue_1(this, headerName, headerValue); }

        HttpRequest_DeleteHeader :: inline (this: *HttpRequest, headerName: *u8) { this.vtable.DeleteHeader(this, headerName); }

        HttpRequest_AddContentBody :: inline (this: *HttpRequest, strContent: *std.shared_ptr(IOStream)) { this.vtable.AddContentBody(this, strContent); }

        HttpRequest_GetContentBody :: inline (this: *HttpRequest) -> *std.shared_ptr(IOStream) { return this.vtable.GetContentBody(this); }

        HttpRequest_HasHeader :: inline (this: *HttpRequest, name: *u8) -> bool { return this.vtable.HasHeader(this, name); }

        HttpRequest_GetSize :: inline (this: *HttpRequest) -> s64 { return this.vtable.GetSize(this); }

        HttpRequest_GetResponseStreamFactory :: inline (this: *HttpRequest) -> *IOStreamFactory { return this.vtable.GetResponseStreamFactory(this); }

        HttpRequest_SetResponseStreamFactory :: inline (this: *HttpRequest, factory: *IOStreamFactory) { this.vtable.SetResponseStreamFactory(this, factory); }

        HttpRequest_AddRequestMetric :: inline (this: *HttpRequest, key: *String, value: s64) { this.vtable.AddRequestMetric(this, key, value); }

        HttpRequest_SetRequestMetrics :: inline (this: *HttpRequest, collection: *Monitoring.HttpClientMetricsCollection) { this.vtable.SetRequestMetrics(this, collection); }

        HttpRequest_GetRequestMetrics :: inline (this: *HttpRequest) -> *Monitoring.HttpClientMetricsCollection { return this.vtable.GetRequestMetrics(this); }

        HttpRequest_ToCrtHttpRequest :: inline (this: *HttpRequest) -> std.shared_ptr(Crt.Http.HttpRequest) { return this.vtable.ToCrtHttpRequest(this); }

        vtable :: (obj: *HttpRequest) -> *HttpRequest_VTable { return obj.vtable; }


        /**
        * Abstract class for representing an Http Response.
        */
        HttpResponse :: struct {
            vtable: *HttpResponse_VTable;
            m_httpRequest:        std.shared_ptr(HttpRequest);
            m_responseCode:       HttpResponseCode;

            // Error generated by http client, SDK or users, indicating non service error during http request
            m_hasClientError:     bool;
            m_clientErrorType:    Client.CoreErrors;
            m_clientErrorMessage: String;
        }
        HttpResponse_VTable :: struct #type_info_none {
            Destructor: (this: *HttpResponse, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

            GetOriginatingRequest: (this: *HttpResponse) -> *HttpRequest #cpp_method;

            SetOriginatingRequest: (this: *HttpResponse, httpRequest: *std.shared_ptr(HttpRequest)) -> void #cpp_method;

            GetHeaders: (this: *HttpResponse) -> HeaderValueCollection #cpp_method;

            HasHeader: (this: *HttpResponse, headerName: *u8) -> bool #cpp_method;

            GetHeader: (this: *HttpResponse, headerName: *String) -> *String #cpp_method;

            GetResponseCode: (this: *HttpResponse) -> HttpResponseCode #cpp_method;

            SetResponseCode: (this: *HttpResponse, httpResponseCode: HttpResponseCode) -> void #cpp_method;

            GetContentType: (this: *HttpResponse) -> *String #cpp_method;

            GetResponseBody: (this: *HttpResponse) -> *IOStream #cpp_method;

            AddHeader: (this: *HttpResponse, unknown0: *String, unknown1: *String) -> void #cpp_method;

            SetContentType: (this: *HttpResponse, contentType: *String) -> void #cpp_method;
        }

        HttpResponse_Destructor :: inline (this: *HttpResponse, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

        HttpResponse_GetOriginatingRequest :: inline (this: *HttpResponse) -> *HttpRequest { return this.vtable.GetOriginatingRequest(this); }

        HttpResponse_SetOriginatingRequest :: inline (this: *HttpResponse, httpRequest: *std.shared_ptr(HttpRequest)) { this.vtable.SetOriginatingRequest(this, httpRequest); }

        HttpResponse_GetHeaders :: inline (this: *HttpResponse) -> HeaderValueCollection { return this.vtable.GetHeaders(this); }

        HttpResponse_HasHeader :: inline (this: *HttpResponse, headerName: *u8) -> bool { return this.vtable.HasHeader(this, headerName); }

        HttpResponse_GetHeader :: inline (this: *HttpResponse, headerName: *String) -> *String { return this.vtable.GetHeader(this, headerName); }

        HttpResponse_GetResponseCode :: inline (this: *HttpResponse) -> HttpResponseCode { return this.vtable.GetResponseCode(this); }

        HttpResponse_SetResponseCode :: inline (this: *HttpResponse, httpResponseCode: HttpResponseCode) { this.vtable.SetResponseCode(this, httpResponseCode); }

        HttpResponse_GetContentType :: inline (this: *HttpResponse) -> *String { return this.vtable.GetContentType(this); }

        HttpResponse_GetResponseBody :: inline (this: *HttpResponse) -> *IOStream { return this.vtable.GetResponseBody(this); }

        HttpResponse_AddHeader :: inline (this: *HttpResponse, unknown0: *String, unknown1: *String) { this.vtable.AddHeader(this, unknown0, unknown1); }

        HttpResponse_SetContentType :: inline (this: *HttpResponse, contentType: *String) { this.vtable.SetContentType(this, contentType); }

        vtable :: (obj: *HttpResponse) -> *HttpResponse_VTable { return obj.vtable; }

    }

    // Serves no purpose other than to help my conversion process
    IFStream :: std.basic_ifstream(u8, std.char_traits(u8));
    OFStream :: std.basic_ofstream(u8, std.char_traits(u8));
    FStream :: std.basic_fstream(u8, std.char_traits(u8));
    IStream :: basic_istream(u8, std.char_traits(u8));
    OStream :: basic_ostream(u8, std.char_traits(u8));
    IOStream :: basic_iostream(u8, std.char_traits(u8));
    IStreamBufIterator :: std.istreambuf_iterator(u8, std.char_traits(u8));

    IOStreamFactory :: std.function(#type () -> *IOStream #c_call);

    Client :: struct {
        CoreErrors :: enum s32 {
            INCOMPLETE_SIGNATURE          :: 0;
            INTERNAL_FAILURE              :: 1;
            INVALID_ACTION                :: 2;
            INVALID_CLIENT_TOKEN_ID       :: 3;
            INVALID_PARAMETER_COMBINATION :: 4;
            INVALID_QUERY_PARAMETER       :: 5;
            INVALID_PARAMETER_VALUE       :: 6;
            MISSING_ACTION                :: 7;
            MISSING_AUTHENTICATION_TOKEN  :: 8;
            MISSING_PARAMETER             :: 9;
            OPT_IN_REQUIRED               :: 10;
            REQUEST_EXPIRED               :: 11;
            SERVICE_UNAVAILABLE           :: 12;
            THROTTLING                    :: 13;
            VALIDATION                    :: 14;
            ACCESS_DENIED                 :: 15;
            RESOURCE_NOT_FOUND            :: 16;
            UNRECOGNIZED_CLIENT           :: 17;
            MALFORMED_QUERY_STRING        :: 18;
            SLOW_DOWN                     :: 19;
            REQUEST_TIME_TOO_SKEWED       :: 20;
            INVALID_SIGNATURE             :: 21;
            SIGNATURE_DOES_NOT_MATCH      :: 22;
            INVALID_ACCESS_KEY_ID         :: 23;
            REQUEST_TIMEOUT               :: 24;
            NOT_INITIALIZED               :: 25;

            NETWORK_CONNECTION            :: 99;

            UNKNOWN                       :: 100;
            CLIENT_SIGNING_FAILURE        :: 101;
            USER_CANCELLED                :: 102;
            ENDPOINT_RESOLUTION_FAILURE   :: 103;
            SERVICE_EXTENSION_START_RANGE :: 128;
            OK                            :: -1;
        }

        RetryStrategy :: struct {}

        /**
        * Sets the behaviors of the underlying HTTP clients handling response with 30x status code.
        * By default, HTTP clients will always redirect the 30x response automatically, except when
        * specifying aws-global as the client region, then SDK will handle 30x response and redirect
        * the request manually.
        */
        FollowRedirectsPolicy :: enum s32 {
            DEFAULT :: 0;
            ALWAYS  :: 1;
            NEVER   :: 2;
        }

        /**
        * This setting is an enumeration, not a boolean, to allow for future expansion.
        */
        UseRequestCompression :: enum s32 {
            DISABLE :: 0;
            ENABLE  :: 1;
        }

        RequestCompressionConfig :: struct {
            useRequestCompression:          UseRequestCompression = .ENABLE;
            requestMinCompressionSizeBytes: u64 = 10240;
        }

        /**
        * This structure is used to provide initial configuration values to the default ClientConfiguration constructor for the following parameter(s):
        * - disableIMDS
        */
        ClientConfigurationInitValues :: struct {
            shouldDisableIMDS  := false;
        }

        /**
        * This mutable structure is used to configure any of the AWS clients.
        * Default values can only be overwritten prior to passing to the client constructors.
        */
        ClientConfiguration :: struct {
            vtable: *ClientConfiguration_VTable;
            /**
            * User Agent string user for http calls. This is filled in for you in the constructor. Don't override this unless you have a really good reason.
            */
            userAgent:                 String;

            /**
            * Http scheme to use. E.g. Http or Https. Default HTTPS
            */
            scheme:                    Http.Scheme;

            /**
            * AWS Region to use in signing requests. Default US_EAST_1
            */
            region:                    String;

            /**
            * Use dual stack endpoint in the endpoint calculation. It is your responsibility to verify that the service supports ipv6 in the region you select.
            */
            useDualStack               := false;

            /**
            * Use FIPS endpoint in the endpoint calculation. Please check first that the service supports FIPS in a selected region.
            */
            useFIPS                    := false;

            /**
            * Max concurrent tcp connections for a single http client to use. Default 25.
            */
            maxConnections:            u32 = 25;

            /**
            * This is currently only applicable for Curl to set the http request level timeout, including possible dns lookup time, connection establish time, ssl handshake time and actual data transmission time.
            * the corresponding Curl option is CURLOPT_TIMEOUT_MS
            * defaults to 0, no http request level timeout.
            */
            httpRequestTimeoutMs:      s32 = 0;

            /**
            * Socket read timeouts for HTTP clients on Windows. Default 3000 ms. This should be more than adequate for most services. However, if you are transferring large amounts of data
            * or are worried about higher latencies, you should set to something that makes more sense for your use case.
            * For Curl, it's the low speed time, which contains the time in number milliseconds that transfer speed should be below "lowSpeedLimit" for the library to consider it too slow and abort.
            * Note that for Curl this config is converted to seconds by rounding down to the nearest whole second except when the value is greater than 0 and less than 1000. In this case it is set to one second. When it's 0, low speed limit check will be disabled.
            * Note that for Windows when this config is 0, the behavior is not specified by Windows.
            */
            requestTimeoutMs:          s32 = 0;

            /**
            * Socket connect timeout. Default 1000 ms. Unless you are very far away from your the data center you are talking to, 1000ms is more than sufficient.
            */
            connectTimeoutMs:          s32 = 1000;

            /**
            * Enable TCP keep-alive. Default true;
            * No-op for WinHTTP, WinINet and IXMLHTTPRequest2 client.
            */
            enableTcpKeepAlive         := true;

            /**
            * Interval to send a keep-alive packet over the connection. Default 30 seconds. Minimum 15 seconds.
            * WinHTTP & libcurl support this option. Note that for Curl, this value will be rounded to an integer with second granularity.
            * No-op for WinINet and IXMLHTTPRequest2 client.
            */
            tcpKeepAliveIntervalMs:    u32 = 30000;

            /**
            * Average transfer speed in bytes per second that the transfer should be below during the request timeout interval for it to be considered too slow and abort.
            * Default 1 byte/second. Only for CURL client currently.
            */
            lowSpeedLimit:             u32 = 1;

            /**
            * Strategy to use in case of failed requests. Default is DefaultRetryStrategy (i.e. exponential backoff)
            */
            retryStrategy:             std.shared_ptr(RetryStrategy);

            /**
            * Override the http endpoint used to talk to a service.
            */
            endpointOverride:          String;

            /**
            * Allow HTTP client to discover system proxy setting. Off by default for legacy reasons.
            */
            allowSystemProxy           := false;

            /**
            * If you have users going through a proxy, set the proxy scheme here. Default HTTP
            */
            proxyScheme:               Http.Scheme;

            /**
            * If you have users going through a proxy, set the host here.
            */
            proxyHost:                 String;

            /**
            * If you have users going through a proxy, set the port here.
            */
            proxyPort:                 u32 = 0;

            /**
            * If you have users going through a proxy, set the username here.
            */
            proxyUserName:             String;

            /**
            * If you have users going through a proxy, set the password here.
            */
            proxyPassword:             String;

            /**
            * SSL Certificate file to use for connecting to an HTTPS proxy.
            * Used to set CURLOPT_PROXY_SSLCERT in libcurl. Example: client.pem
            */
            proxySSLCertPath:          String;

            /**
            * Type of proxy client SSL certificate.
            * Used to set CURLOPT_PROXY_SSLCERTTYPE in libcurl. Example: PEM
            */
            proxySSLCertType:          String;

            /**
            * Private key file to use for connecting to an HTTPS proxy.
            * Used to set CURLOPT_PROXY_SSLKEY in libcurl. Example: key.pem
            */
            proxySSLKeyPath:           String;

            /**
            * Type of private key file used to connect to an HTTPS proxy.
            * Used to set CURLOPT_PROXY_SSLKEYTYPE in libcurl. Example: PEM
            */
            proxySSLKeyType:           String;

            /**
            * Passphrase to the private key file used to connect to an HTTPS proxy.
            * Used to set CURLOPT_PROXY_KEYPASSWD in libcurl. Example: password1
            */
            proxySSLKeyPassword:       String;

            /**
            * Calls to hosts in this vector will not use proxy configuration
            */
            nonProxyHosts:             Utils.Array(String);

            /**
            * Threading Executor implementation. Default uses std::thread::detach()
            */
            executor:                  std.shared_ptr(Utils.Threading.Executor);

            /**
            * If you need to test and want to get around TLS validation errors, do that here.
            * You probably shouldn't use this flag in a production scenario.
            */
            verifySSL                  := true;

            /**
            * If your Certificate Authority path is different from the default, you can tell
            * clients that aren't using the default trust store where to find your CA trust store.
            * If you are on windows or apple, you likely don't want this.
            */
            caPath:                    String;

            /**
            * Same as caPath, but used when verifying an HTTPS proxy.
            * Used to set CURLOPT_PROXY_CAPATH in libcurl and proxy tls
            * settings in crt HTTP client.
            * Does nothing on windows.
            */
            proxyCaPath:               String;

            /**
            * If you certificate file is different from the default, you can tell clients that
            * aren't using the default trust store where to find your ca file.
            * If you are on windows or apple, you likely don't want this.
            */
            caFile:                    String;

            /**
            * Same as caFile, but used when verifying an HTTPS proxy.
            * Used to set CURLOPT_PROXY_CAINFO in libcurl and proxy tls
            * settings in crt HTTP client.
            * Does nothing on windows.
            */
            proxyCaFile:               String;

            /**
            * Rate Limiter implementation for outgoing bandwidth. Default is wide-open.
            */
            writeRateLimiter:          std.shared_ptr(Utils.RateLimits.RateLimiterInterface);

            /**
            * Rate Limiter implementation for incoming bandwidth. Default is wide-open.
            */
            readRateLimiter:           std.shared_ptr(Utils.RateLimits.RateLimiterInterface);

            /**
            * Override the http implementation the default factory returns.
            */
            httpLibOverride:           Http.TransferLibType;

            /**
            * Sets the behavior how http stack handles 30x redirect codes.
            */
            followRedirects:           FollowRedirectsPolicy;

            /**
            * Only works for Curl http client.
            * Curl will by default add "Expect: 100-Continue" header in a Http request so as to avoid sending http
            * payload to wire if server respond error immediately after receiving the header.
            * Set this option to true will tell Curl to send http request header and body together.
            * This can save one round-trip time and especially useful when the payload is small and network latency is more important.
            * But be careful when Http request has large payload such S3 PutObject. You don't want to spend long time sending a large payload just getting a error response for server.
            * The default value will be false.
            */
            disableExpectHeader        := false;

            /**
            * If set to true clock skew will be adjusted after each http attempt, default to true.
            */
            enableClockSkewAdjustment  := true;

            /**
            * Enable host prefix injection.
            * For services whose endpoint is injectable. e.g. servicediscovery, you can modify the http host's prefix so as to add "data-" prefix for DiscoverInstances request.
            * Default to true, enabled. You can disable it for testing purpose.
            *
            * Deprecated in API v. 1.10. Please set in service-specific client configuration.
            */
            enableHostPrefixInjection  := true;

            /**
            * Enable endpoint discovery
            * For some services to dynamically set up their endpoints for different requests.
            * By default, service clients will decide if endpoint discovery is enabled or not.
            * If disabled, regional or overridden endpoint will be used instead.
            * If a request requires endpoint discovery but you disabled it. The request will never succeed.
            * A boolean value is either true of false, use Optional here to have an instance does not contain a value,
            * such that SDK will decide the default behavior as stated before, if no value specified.
            *
            * Deprecated in API v. 1.10. Please set in service-specific client configuration.
            */
            enableEndpointDiscovery:   Crt.Optional(bool);

            /**
            * Enable http client (WinHTTP or CURL) traces.
            * Defaults to false, it's an optional feature.
            */
            enableHttpClientTrace      := false;

            /**
            * profileName in config file that will be used by this object to resolve more configurations.
            */
            profileName:               String;

            /**
            * Request compression configuration
            * To use this feature, the service needs to provide the support, and the compression
            * algorithms needs to be available at SDK build time.
            */
            requestCompressionConfig:  RequestCompressionConfig;

            /**
            * Disable all internal IMDS Calls
            */
            disableIMDS                := false;

            /**
            * Request HTTP client to use specific http version. Currently supported for
            * only Curl. More or less is a one to one conversion of the CURLOPT_HTTP_VERSION
            * configuration option.
            *
            * Default to Version 2 TLS which is the default after curl version 7.62.0. Will
            * fall back to 1.1 if compiled against a earlier version of curl.
            */
            version:                   Http.Version = ._2TLS;

            /**
            * Disable all internal IMDSV1 Calls
            */
            disableImdsV1              := false;

            /**
            * A wrapper for interfacing with telemetry functionality.
            */
            telemetryProvider:         std.shared_ptr(smithy.components.tracing.TelemetryProvider);

            // Virtual functions:
            // Normally you should call them via the vtable.
            // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
            // or need to create a vtable yourself.

            /**
            * Add virtual method to allow use of dynamic_cast under inheritance.
            */
            virtual_Destructor :: (this: *ClientConfiguration, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign aws_cpp_sdk_s3 "??1ClientConfiguration@Client@Aws@@UEAA@XZ";
        }
        ClientConfiguration_VTable :: struct #type_info_none {
            Destructor: (this: *ClientConfiguration, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;
        }
        ClientConfiguration_Destructor :: inline (this: *ClientConfiguration, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

        vtable :: (obj: *ClientConfiguration) -> *ClientConfiguration_VTable { return obj.vtable; }


        CompressionAlgorithm :: enum s32 {
            NONE :: 0;
            GZIP :: 1;
        }

        /**
        * Request compression API
        */
        RequestCompression :: struct {
            __empty_struct_padding: u8; // C++ makes empty structs have length 1
        }

        /**
        * Auth Signer interface. Takes a generic AWS request and applies crypto tamper resistent signatures on the request.
        */
        AWSAuthSigner :: struct {
            vtable: *AWSAuthSigner_VTable;
            m_clockSkew: std.atomic(std.chrono.milliseconds);

            // Virtual functions:
            // Normally you should call them via the vtable.
            // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
            // or need to create a vtable yourself.

            /**
            * Signs a single event message in an event stream.
            * The input message buffer is copied and signed. The message's input buffer will be deallocated and a new
            * buffer will be assigned. The new buffer encodes the original message with its headers as the payload of
            * the new message. The signature of the original message will be added as a header to the new message.
            *
            * A Hex encoded signature of the previous event (or of the HTTP request headers in case of the first event)
            * is provided as the 'priorSignature' parameter. 'priorSignature' will contain the value of the new
            * signature after this call returns successfully.
            *
            * The function returns true if the message is successfully signed.
            */
            virtual_SignEventMessage :: (this: *AWSAuthSigner, unknown0: *Utils.Event.Message, unknown1: *String) -> bool #cpp_method #foreign aws_cpp_sdk_s3 "?SignEventMessage@AWSAuthSigner@Client@Aws@@UEBA_NAEAVMessage@Event@Utils@3@AEAV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@@Z";

            /**
            * This handles detection of clock skew between clients and the server and adjusts the clock so that the next request will not
            * fail on the timestamp check.
            */
            virtual_SetClockSkew :: (this: *AWSAuthSigner, clockSkew: *std.chrono.milliseconds) -> void #cpp_method #foreign aws_cpp_sdk_s3 "?SetClockSkew@AWSAuthSigner@Client@Aws@@UEAAXAEBV?$duration@_JU?$ratio@$00$0DOI@@std@@@chrono@std@@@Z";

            /**
            * Gets the timestamp being used by the signer. This may include a clock skew if a clock skew has been detected.
            */
            virtual_GetSigningTimestamp :: (this: *AWSAuthSigner) -> Utils.DateTime #cpp_method #cpp_return_type_is_non_pod #foreign aws_cpp_sdk_s3 "?GetSigningTimestamp@AWSAuthSigner@Client@Aws@@UEBA?AVDateTime@Utils@3@XZ";

            virtual_GetClockSkewOffset :: (this: *AWSAuthSigner) -> std.chrono.milliseconds #cpp_method #foreign aws_cpp_sdk_s3 "?GetClockSkewOffset@AWSAuthSigner@Client@Aws@@MEBA?AV?$duration@_JU?$ratio@$00$0DOI@@std@@@chrono@std@@XZ";
        }
        AWSAuthSigner_VTable :: struct #type_info_none {
            Destructor: (this: *AWSAuthSigner, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

            SignRequest: (this: *AWSAuthSigner, request: *Http.HttpRequest, region: *u8, serviceName: *u8, signBody: bool) -> bool #cpp_method;

            SignRequest_1: (this: /*const*/ *AWSAuthSigner, request: /*reference*/ *Http.HttpRequest, region: /*const*/ *u8, signBody: bool) -> bool #cpp_method;

            SignRequest_2: (this: /*const*/ *AWSAuthSigner, request: /*reference*/ *Http.HttpRequest, signBody: bool) -> bool #cpp_method;

            SignRequest_3: (this: /*const*/ *AWSAuthSigner, request: /*reference*/ *Http.HttpRequest) -> bool #cpp_method;

            SignEventMessage: (this: *AWSAuthSigner, unknown0: *Utils.Event.Message, unknown1: *String) -> bool #cpp_method;

            PresignRequest: (this: *AWSAuthSigner, request: *Http.HttpRequest, region: *u8, serviceName: *u8, expirationInSeconds: s64 = 0) -> bool #cpp_method;

            PresignRequest_1: (this: /*const*/ *AWSAuthSigner, request: /*reference*/ *Http.HttpRequest, region: /*const*/ *u8, expirationInSeconds: s64 = 0) -> bool #cpp_method;

            PresignRequest_2: (this: /*const*/ *AWSAuthSigner, request: /*reference*/ *Http.HttpRequest, expirationInSeconds: s64) -> bool #cpp_method;

            GetName: (this: *AWSAuthSigner) -> *u8 #cpp_method;

            SetClockSkew: (this: *AWSAuthSigner, clockSkew: *std.chrono.milliseconds) -> void #cpp_method;

            GetSigningTimestamp: (this: *AWSAuthSigner) -> Utils.DateTime #cpp_method #cpp_return_type_is_non_pod;

            GetClockSkewOffset: (this: *AWSAuthSigner) -> std.chrono.milliseconds #cpp_method;
        }

        AWSAuthSigner_Destructor :: inline (this: *AWSAuthSigner, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

        AWSAuthSigner_SignRequest :: inline (this: /*const*/ *AWSAuthSigner, request: /*reference*/ *Http.HttpRequest, region: /*const*/ *u8, serviceName: /*const*/ *u8, signBody: bool) -> bool { return this.vtable.SignRequest(this, request, region, serviceName, signBody); }

        AWSAuthSigner_SignRequest_1 :: inline (this: /*const*/ *AWSAuthSigner, request: /*reference*/ *Http.HttpRequest, region: /*const*/ *u8, signBody: bool) -> bool { return this.vtable.SignRequest_1(this, request, region, signBody); }

        AWSAuthSigner_SignRequest_2 :: inline (this: /*const*/ *AWSAuthSigner, request: /*reference*/ *Http.HttpRequest, signBody: bool) -> bool { return this.vtable.SignRequest_2(this, request, signBody); }

        AWSAuthSigner_SignRequest_3 :: inline (this: /*const*/ *AWSAuthSigner, request: /*reference*/ *Http.HttpRequest) -> bool { return this.vtable.SignRequest_3(this, request); }

        AWSAuthSigner_SignEventMessage :: inline (this: *AWSAuthSigner, unknown0: *Utils.Event.Message, unknown1: *String) -> bool { return this.vtable.SignEventMessage(this, unknown0, unknown1); }

        AWSAuthSigner_PresignRequest :: inline (this: /*const*/ *AWSAuthSigner, request: /*reference*/ *Http.HttpRequest, region: /*const*/ *u8, serviceName: /*const*/ *u8, expirationInSeconds: s64 = 0) -> bool { return this.vtable.PresignRequest(this, request, region, serviceName, expirationInSeconds); }

        AWSAuthSigner_PresignRequest_1 :: inline (this: /*const*/ *AWSAuthSigner, request: /*reference*/ *Http.HttpRequest, region: /*const*/ *u8, expirationInSeconds: s64 = 0) -> bool { return this.vtable.PresignRequest_1(this, request, region, expirationInSeconds); }

        AWSAuthSigner_PresignRequest_2 :: inline (this: /*const*/ *AWSAuthSigner, request: /*reference*/ *Http.HttpRequest, expirationInSeconds: s64) -> bool { return this.vtable.PresignRequest_2(this, request, expirationInSeconds); }

        AWSAuthSigner_GetName :: inline (this: *AWSAuthSigner) -> *u8 { return this.vtable.GetName(this); }

        AWSAuthSigner_SetClockSkew :: inline (this: *AWSAuthSigner, clockSkew: *std.chrono.milliseconds) { this.vtable.SetClockSkew(this, clockSkew); }

        AWSAuthSigner_GetSigningTimestamp :: inline (this: *AWSAuthSigner) -> Utils.DateTime { return this.vtable.GetSigningTimestamp(this); }

        AWSAuthSigner_GetClockSkewOffset :: inline (this: *AWSAuthSigner) -> std.chrono.milliseconds { return this.vtable.GetClockSkewOffset(this); }

        vtable :: (obj: *AWSAuthSigner) -> *AWSAuthSigner_VTable { return obj.vtable; }


        XmlErrorMarshaller :: struct {}
        JsonErrorMarshaller :: struct {}

        ErrorPayloadType :: enum s32 {
            NOT_SET :: 0;
            XML     :: 1;
            JSON    :: 2;
        }

        RetryableType :: enum s32 {
            NOT_RETRYABLE        :: 0;
            RETRYABLE            :: 1;
            RETRYABLE_THROTTLING :: 2;
        }

        /**
        * Container for Error enumerations with additional exception information. Name, message, retryable etc....
        */
        AWSError :: struct(ERROR_TYPE: Type) {
            m_errorType:           ERROR_TYPE;
            m_exceptionName:       String;
            m_message:             String;
            m_remoteHostIpAddress: String;
            m_requestId:           String;
            m_responseHeaders:     Http.HeaderValueCollection;
            m_responseCode:        Http.HttpResponseCode = .REQUEST_NOT_MADE;

            m_errorPayloadType:    ErrorPayloadType = .NOT_SET;
            m_xmlPayload:          Utils.Xml.XmlDocument;
            m_jsonPayload:         Utils.Json.JsonValue;
            m_retryableType:       RetryableType;
        }

        /**
        * AWS Auth v4 Signer implementation of the AWSAuthSigner interface. More information on AWS Auth v4 Can be found here:
        * http://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html
        */
        AWSAuthV4Signer :: struct {
            #as using awsauthsigner: AWSAuthSigner;

            /**
            * Even though different payload signing polices, HTTP will force payload signing to be on.
            */
            PayloadSigningPolicy :: enum s32 {
                RequestDependent :: 0;

                Always           :: 1;

                Never            :: 2;
            }

            m_includeSha256HashHeader: bool;

            m_signingAlgorithm:        Auth.AWSSigningAlgorithm;
            m_credentialsProvider:     std.shared_ptr(Auth.AWSCredentialsProvider);
            m_serviceName:             String;
            m_region:                  String;
            m_hash:                    std.unique_ptr(Utils.Crypto.Sha256);
            m_HMAC:                    std.unique_ptr(Utils.Crypto.Sha256HMAC);

            m_unsignedHeaders:         std.set(String);

            //these next four fields are ONLY for caching purposes and do not change
            //the logical state of the signer. They are marked mutable so the
            //interface can remain const.
            m_partialSignature:        Utils.ByteBuffer;
            m_currentDateStr:          String;
            m_currentSecretKey:        String;
            m_partialSignatureLock:    Utils.Threading.ReaderWriterLock;
            m_payloadSigningPolicy:    PayloadSigningPolicy;
            m_urlEscapePath:           bool;
            #place awsauthsigner; awsauthv4signer_vtable: *AWSAuthV4Signer_VTable;

            // Virtual functions:
            // Normally you should call them via the vtable.
            // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
            // or need to create a vtable yourself.

            /**
            * Signs the request itself based on info in the request and uri.
            * Uses AWS Auth V4 signing method with SHA256 HMAC algorithm.
            */
            virtual_SignRequest :: (this: *AWSAuthV4Signer, request: *Http.HttpRequest) -> bool #cpp_method #foreign aws_cpp_sdk_s3 "?SignRequest@AWSAuthV4Signer@Client@Aws@@UEBA_NAEAVHttpRequest@Http@3@@Z";

            /**
            * Signs the request itself based on info in the request and uri.
            * Uses AWS Auth V4 signing method with SHA256 HMAC algorithm. If signBody is false
            * and https is being used then the body of the payload will not be signed.
            */
            virtual_SignRequest :: (this: *AWSAuthV4Signer, request: *Http.HttpRequest, signBody: bool) -> bool #cpp_method #foreign aws_cpp_sdk_s3 "?SignRequest@AWSAuthV4Signer@Client@Aws@@UEBA_NAEAVHttpRequest@Http@3@_N@Z";

            /**
            * Uses AWS Auth V4 signing method with SHA256 HMAC algorithm. If signBody is false
            * and https is being used then the body of the payload will not be signed.
            * Using m_region by default if parameter region is nullptr.
            */
            virtual_SignRequest :: (this: *AWSAuthV4Signer, request: *Http.HttpRequest, region: *u8, signBody: bool) -> bool #cpp_method #foreign aws_cpp_sdk_s3 "?SignRequest@AWSAuthV4Signer@Client@Aws@@UEBA_NAEAVHttpRequest@Http@3@PEBD_N@Z";
        }
        AWSAuthV4Signer_VTable :: struct #type_info_none {
            using awsauthsigner: AWSAuthSigner_VTable;
            GetCredentials: (this: *AWSAuthV4Signer, serviceSpecificParameters: *std.shared_ptr(Http.ServiceSpecificParameters)) -> Auth.AWSCredentials #cpp_method;

            ServiceRequireUnsignedPayload: (this: *AWSAuthV4Signer, serviceName: *String) -> bool #cpp_method;
        }

        AWSAuthV4Signer_GetCredentials :: inline (this: *AWSAuthV4Signer, serviceSpecificParameters: *std.shared_ptr(Http.ServiceSpecificParameters)) -> Auth.AWSCredentials { return this.awsauthv4signer_vtable.GetCredentials(this, serviceSpecificParameters); }

        AWSAuthV4Signer_ServiceRequireUnsignedPayload :: inline (this: *AWSAuthV4Signer, serviceName: *String) -> bool { return this.awsauthv4signer_vtable.ServiceRequireUnsignedPayload(this, serviceName); }

        vtable :: (obj: *AWSAuthV4Signer) -> *AWSAuthV4Signer_VTable { return obj.awsauthv4signer_vtable; }


        /**
        * AWS Auth EventStream v4 Signer implementation of the AWSAuthSigner interface.
        */
        AWSAuthEventStreamV4Signer :: struct {
            #as using awsauthsigner: AWSAuthSigner;

            m_serviceName:         String;
            m_region:              String;
            m_hash:                Utils.Crypto.Sha256;
            m_HMAC:                Utils.Crypto.Sha256HMAC;
            m_derivedKeyLock:      Utils.Threading.ReaderWriterLock;
            m_derivedKey:          Utils.ByteBuffer;
            m_currentDateStr:      String;
            m_currentSecretKey:    String;
            m_unsignedHeaders:     std.vector(String);
            m_credentialsProvider: std.shared_ptr(Auth.AWSCredentialsProvider);
        }

        /**
        * A no-op implementation of the AWSAuthSigner interface
        */
        AWSNullSigner :: struct {
            #as using awsauthsigner: AWSAuthSigner;
        }

        /**
        * Helper class to generate pre-signed AWS URLs.
        */
        AWSUrlPresigner :: struct {
            vtable: *AWSUrlPresigner_VTable;
            m_awsClient: *AWSClient;
        }
        AWSUrlPresigner_VTable :: struct #type_info_none {
            Destructor: (this: *AWSUrlPresigner, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;
        }
        AWSUrlPresigner_Destructor :: inline (this: *AWSUrlPresigner, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

        vtable :: (obj: *AWSUrlPresigner) -> *AWSUrlPresigner_VTable { return obj.vtable; }


        AWSErrorMarshaller :: struct {}

        HttpResponseOutcome :: Utils.Outcome(std.shared_ptr(Http.HttpResponse), AWSError(CoreErrors));
        StreamOutcome :: Utils.Outcome(AmazonWebServiceResult(Utils.Stream.ResponseStream), AWSError(CoreErrors));

        /**
        * Abstract AWS Client. Contains most of the functionality necessary to build an http request, get it signed, and send it across the wire.
        */
        AWSClient :: struct {
            vtable: *AWSClient_VTable;
            GetCredentialsProvider :: (this: *AWSClient) -> std.shared_ptr(Auth.AWSCredentialsProvider) #cpp_method #foreign aws_cpp_sdk_s3 "?GetCredentialsProvider@AWSClient@Client@Aws@@IEBA?AV?$shared_ptr@VAWSCredentialsProvider@Auth@Aws@@@std@@XZ";

            m_region:                    String;

            m_telemetryProvider:         std.shared_ptr(smithy.components.tracing.TelemetryProvider);
            m_signerProvider:            std.shared_ptr(Auth.AWSAuthSignerProvider);

            m_httpClient:                std.shared_ptr(Http.HttpClient);
            m_errorMarshaller:           std.shared_ptr(AWSErrorMarshaller);
            m_retryStrategy:             std.shared_ptr(RetryStrategy);
            m_writeRateLimiter:          std.shared_ptr(Utils.RateLimits.RateLimiterInterface);
            m_readRateLimiter:           std.shared_ptr(Utils.RateLimits.RateLimiterInterface);
            m_userAgent:                 String;
            m_hash:                      std.shared_ptr(Utils.Crypto.Hash);
            m_requestTimeoutMs:          s32;
            m_enableClockSkewAdjustment: bool;
            m_serviceName:               String = "AWSBaseClient";
            m_requestCompressionConfig:  RequestCompressionConfig;

            // Virtual functions:
            // Normally you should call them via the vtable.
            // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
            // or need to create a vtable yourself.

            virtual_Destructor :: (this: *AWSClient, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign aws_cpp_sdk_s3 "??1AWSClient@Client@Aws@@UEAA@XZ";

            virtual_GetServiceClientName :: (this: *AWSClient) -> *u8 #cpp_method #foreign aws_cpp_sdk_s3 "?GetServiceClientName@AWSClient@Client@Aws@@UEBAPEBDXZ";
        }
        AWSClient_VTable :: struct #type_info_none {
            Destructor: (this: *AWSClient, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

            GetServiceClientName: (this: *AWSClient) -> *u8 #cpp_method;

            SetServiceClientName: (this: *AWSClient, name: *String) -> void #cpp_method;

            BuildAWSError: (this: *AWSClient, response: *std.shared_ptr(Http.HttpResponse)) -> AWSError(CoreErrors) #cpp_method;

            BuildHttpRequest: (this: *AWSClient, request: *AmazonWebServiceRequest, httpRequest: *std.shared_ptr(Http.HttpRequest)) -> void #cpp_method;
        }

        AWSClient_Destructor :: inline (this: *AWSClient, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

        AWSClient_GetServiceClientName :: inline (this: *AWSClient) -> *u8 { return this.vtable.GetServiceClientName(this); }

        AWSClient_SetServiceClientName :: inline (this: *AWSClient, name: *String) { this.vtable.SetServiceClientName(this, name); }

        AWSClient_BuildAWSError :: inline (this: *AWSClient, response: *std.shared_ptr(Http.HttpResponse)) -> AWSError(CoreErrors) { return this.vtable.BuildAWSError(this, response); }

        AWSClient_BuildHttpRequest :: inline (this: *AWSClient, request: *AmazonWebServiceRequest, httpRequest: *std.shared_ptr(Http.HttpRequest)) { this.vtable.BuildHttpRequest(this, request, httpRequest); }

        vtable :: (obj: *AWSClient) -> *AWSClient_VTable { return obj.vtable; }


        JsonOutcome :: Utils.Outcome(AmazonWebServiceResult(Utils.Json.JsonValue), AWSError(CoreErrors));

        /**
        *  AWSClient that handles marshalling json response bodies. You would inherit from this class
        *  to create a client that uses Json as its payload format.
        */
        AWSJsonClient :: struct {
            #as using awsclient: AWSClient;

            BASECLASS :: AWSClient;
        }

        XmlOutcome :: Utils.Outcome(AmazonWebServiceResult(Utils.Xml.XmlDocument), AWSError(CoreErrors));

        /**
        *  AWSClient that handles marshalling xml response bodies. You would inherit from this class
        *  to create a client that uses Xml as its payload format.
        */
        AWSXMLClient :: struct {
            #as using awsclient: AWSClient;

            BASECLASS :: AWSClient;

            // Virtual functions:
            // Normally you should call them via the vtable.
            // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
            // or need to create a vtable yourself.

            virtual_Destructor :: (this: *AWSXMLClient, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign aws_cpp_sdk_s3 "??1AWSXMLClient@Client@Aws@@UEAA@XZ";
        }
    }

    /**
    * AWS Regions
    */
    Region :: struct {
        // AWS_GLOBAL is a pseudo region that can be used to tell SDK to use the service global endpoint if there is any.
        // You can specify this region to corresponding environment variable, config file item and in your code.
        // For services without global region, the request will be directed to us-east-1
        AWS_GLOBAL: [11] u8;
        US_EAST_1: [10] u8; // US East (N. Virginia)
        US_EAST_2: [10] u8; // US East (Ohio)
        US_WEST_1: [10] u8; // US West (N. California)
        US_WEST_2: [10] u8; // US West (Oregon)
        EU_WEST_1: [10] u8; // EU (Ireland)
        EU_WEST_2: [10] u8; // EU (London)
        EU_WEST_3: [10] u8; // EU (Paris)
        EU_CENTRAL_1: [13] u8; // EU (Frankfurt)
        EU_CENTRAL_2: [13] u8; // EU (Zurich)
        EU_NORTH_1: [11] u8; // EU (Stockholm)
        EU_SOUTH_1: [11] u8; // EU (Milan)
        EU_SOUTH_2: [11] u8; // EU (Spain)
        AP_EAST_1: [10] u8; // Asia Pacific (Hong Kong)
        AP_SOUTH_1: [11] u8; // Asia Pacific (Mumbai)
        AP_SOUTH_2: [11] u8; // Asia Pacific (Hyderabad)
        AP_SOUTHEAST_1: [15] u8; // Asia Pacific (Singapore)
        AP_SOUTHEAST_2: [15] u8; // Asia Pacific (Sydney)
        AP_SOUTHEAST_3: [15] u8; // Asia Pacific (Jakarta)
        AP_NORTHEAST_1: [15] u8; // Asia Pacific (Tokyo)
        AP_NORTHEAST_2: [15] u8; // Asia Pacific (Seoul)
        AP_NORTHEAST_3: [15] u8; // Asia Pacific (Osaka)
        AP_NORTHEAST_4: [15] u8; // Asia Pacific (Melbourne)
        SA_EAST_1: [10] u8; // South America (Sao Paulo)
        CN_NORTH_1: [11] u8; // China (Beijing)
        CN_NORTHWEST_1: [15] u8; // China (Ningxia)
        CA_CENTRAL_1: [13] u8; // Canada (Central)
        ME_SOUTH_1: [11] u8; // Middle East (Bahrain)
        ME_CENTRAL_1: [13] u8; // Middle East (UAE)
        AF_SOUTH_1: [11] u8; // Africa (Cape Town)
        US_GOV_WEST_1: [14] u8; // AWS GovCloud (US-West)
        US_GOV_EAST_1: [14] u8; // AWS GovCloud (US-East)
        US_ISO_EAST_1: [14] u8; // US ISO East
        US_ISOB_EAST_1: [15] u8; // US ISOB East (Ohio)
        US_ISO_WEST_1: [14] u8; // US ISO West
    }

    Auth :: struct {
        SIGNATURE: *u8;

        AWSCredentials :: struct {}
        AWSCredentialsProvider :: struct {}

        AWSSigningAlgorithm :: enum s32 {
            SIGV4            :: 0;
            ASYMMETRIC_SIGV4 :: 1;
        }

        SIGV4_SIGNER: *u8;
        ASYMMETRIC_SIGV4_SIGNER: *u8;

        EVENTSTREAM_SIGV4_SIGNER: *u8;

        NULL_SIGNER: *u8;

        DefaultAWSCredentialsProviderChain :: struct {}

        AWSAuthSignerProvider :: struct {
            vtable: *AWSAuthSignerProvider_VTable;

            // Virtual functions:
            // Normally you should call them via the vtable.
            // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
            // or need to create a vtable yourself.
            virtual_Destructor :: (this: *AWSAuthSignerProvider, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign aws_cpp_sdk_s3 "??1AWSAuthSignerProvider@Auth@Aws@@UEAA@XZ";
        }
        AWSAuthSignerProvider_VTable :: struct #type_info_none {
            GetSigner: (this: *AWSAuthSignerProvider, signerName: *String) -> std.shared_ptr(Client.AWSAuthSigner) #cpp_method;
            AddSigner: (this: *AWSAuthSignerProvider, signer: *std.shared_ptr(Client.AWSAuthSigner)) -> void #cpp_method;
            GetCredentialsProvider: (this: *AWSAuthSignerProvider) -> std.shared_ptr(AWSCredentialsProvider) #cpp_method;
            Destructor: (this: *AWSAuthSignerProvider, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;
        }

        AWSAuthSignerProvider_GetSigner :: inline (this: *AWSAuthSignerProvider, signerName: *String) -> std.shared_ptr(Client.AWSAuthSigner) { return this.vtable.GetSigner(this, signerName); }
        AWSAuthSignerProvider_AddSigner :: inline (this: *AWSAuthSignerProvider, signer: *std.shared_ptr(Client.AWSAuthSigner)) { this.vtable.AddSigner(this, signer); }
        AWSAuthSignerProvider_GetCredentialsProvider :: inline (this: *AWSAuthSignerProvider) -> std.shared_ptr(AWSCredentialsProvider) { return this.vtable.GetCredentialsProvider(this); }
        AWSAuthSignerProvider_Destructor :: inline (this: *AWSAuthSignerProvider, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

        vtable :: (obj: *AWSAuthSignerProvider) -> *AWSAuthSignerProvider_VTable { return obj.vtable; }


        DefaultAuthSignerProvider :: struct {
            #as using awsauthsignerprovider: AWSAuthSignerProvider;

            m_signers:             std.vector(std.shared_ptr(Client.AWSAuthSigner));
            m_credentialsProvider: std.shared_ptr(AWSCredentialsProvider);

            // Virtual functions:
            // Normally you should call them via the vtable.
            // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
            // or need to create a vtable yourself.

            virtual_GetCredentialsProvider :: (this: *DefaultAuthSignerProvider) -> std.shared_ptr(AWSCredentialsProvider) #cpp_method #foreign aws_cpp_sdk_s3 "?GetCredentialsProvider@DefaultAuthSignerProvider@Auth@Aws@@UEBA?AV?$shared_ptr@VAWSCredentialsProvider@Auth@Aws@@@std@@XZ";
        }

        SIGV4_SIGNER: *u8;
        NULL_SIGNER: *u8;
    }

    Monitoring :: struct {
        /**
        * Metrics definitions optional from HttpClient module inside AWS Sdk core.
        */
        HttpClientMetricsType :: enum s32 {
            DestinationIp            :: 0;

            AcquireConnectionLatency :: 1;

            ConnectionReused         :: 2;

            ConnectLatency           :: 3;

            RequestLatency           :: 4;

            DnsLatency               :: 5;

            TcpLatency               :: 6;

            SslLatency               :: 7;

            DownloadSpeed            :: 8;
            Throughput               :: 9;

            UploadSpeed              :: 10;

            Unknown                  :: 11;
        }

        HttpClientMetricsCollection :: std.map(String, s64);

        /**
        * Metrics collected from AWS SDK Core include Http Client Metrics and other types of metrics.
        */
        CoreMetricsCollection :: struct {
            /**
            * Metrics collected from underlying http client during execution of a request
            */
            httpClientMetrics: HttpClientMetricsCollection;
        }

        MonitoringFactory :: struct {}

        MonitoringFactoryCreateFunction :: std.function(#type () -> std.unique_ptr(MonitoringFactory) #c_call);
    }

    External :: struct {
        tinyxml2 :: struct {
            XMLNode :: struct {}

            XMLDocument :: struct {}
        }
    }

    Internal :: struct {
        Endpoint :: struct {
            EndpointAuthScheme :: struct {
                vtable: *EndpointAuthScheme_VTable;
                m_name:                  String;

                m_signingName:           Crt.Optional(String);
                m_signingRegion:         Crt.Optional(String);
                m_signingRegionSet:      Crt.Optional(String);
                m_disableDoubleEncoding: Crt.Optional(bool);

                // Virtual functions:
                // Normally you should call them via the vtable.
                // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
                // or need to create a vtable yourself.

                virtual_Destructor :: (this: *EndpointAuthScheme, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign aws_cpp_sdk_s3 "??1EndpointAuthScheme@Endpoint@Internal@Aws@@UEAA@XZ";
            }
            EndpointAuthScheme_VTable :: struct #type_info_none {
                Destructor: (this: *EndpointAuthScheme, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;
            }
            EndpointAuthScheme_Destructor :: inline (this: *EndpointAuthScheme, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            vtable :: (obj: *EndpointAuthScheme) -> *EndpointAuthScheme_VTable { return obj.vtable; }


            /**
            * A grab bag property map of endpoint attributes. The values here are considered unstable.
            * C++ SDK supports only endpoint attributes "AuthScheme" and "Bucket Type".
            */
            EndpointAttributes :: struct {
                authScheme:       EndpointAuthScheme;
                backend:          String;
                useS3ExpressAuth: bool;
            }
        }
    }

    Endpoint :: struct {
        EndpointParameter :: struct {
            ParameterType :: enum s32 {
                BOOLEAN :: 0;
                STRING  :: 1;
            }

            ParameterOrigin :: enum s32 {
                STATIC_CONTEXT    :: 0;
                OPERATION_CONTEXT :: 1;
                CLIENT_CONTEXT    :: 2;
                BUILT_IN          :: 3;
                NOT_SET           :: -1;
            }

            Constructor :: (this: *EndpointParameter, name: String, initialValue: bool, parameterOrigin: ParameterOrigin = .NOT_SET) -> void #cpp_method #foreign aws_cpp_sdk_s3 "??0EndpointParameter@Endpoint@Aws@@QEAA@V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@_NW4ParameterOrigin@012@@Z";

            Constructor :: (this: *EndpointParameter, name: String, initialValue: String, parameterOrigin: ParameterOrigin = .NOT_SET) -> void #cpp_method #foreign aws_cpp_sdk_s3 "??0EndpointParameter@Endpoint@Aws@@QEAA@V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@0W4ParameterOrigin@012@@Z";

            CopyConstructor :: (this: *EndpointParameter, unknown0: *EndpointParameter) -> void #cpp_method #foreign aws_cpp_sdk_s3 "??0EndpointParameter@Endpoint@Aws@@QEAA@AEBV012@@Z";
            CopyConstructor :: (this: *EndpointParameter, unknown0: EndpointParameter) #no_context {
                CopyConstructor(this, *unknown0);
            }

            GetSetResult :: enum s32 {
                SUCCESS          :: 0;
                ERROR_WRONG_TYPE :: 1;
            }

            m_storedType:      ParameterType;
            m_parameterOrigin: ParameterOrigin;
            m_name:            String;

            m_boolValue        := false;
            m_stringValue:     String;
        }

        EndpointParameters :: std.vector(EndpointParameter);

        /**
        * A public type that encapsulates the information about an endpoint
        */
        AWSEndpoint :: struct {
            vtable: *AWSEndpoint_VTable;
            EndpointAttributes :: Internal.Endpoint.EndpointAttributes;

            OptionalError :: Crt.Optional(Client.AWSError(Client.CoreErrors));

            // A URI containing at minimum the scheme and host. May optionally include a port and a path.
            m_uri:              Http.URI;

            // A grab bag property map of endpoint attributes. The values here are considered unstable.
            m_attributes:       Crt.Optional(EndpointAttributes);

            // A map of additional headers to be set when calling the endpoint.
            // Note: the values in these maps are Lists to support multi-value headers.
            m_headers:          std.unordered_map(String, String);

            // Virtual functions:
            // Normally you should call them via the vtable.
            // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
            // or need to create a vtable yourself.

            virtual_Destructor :: (this: *AWSEndpoint, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign aws_cpp_sdk_s3 "??1AWSEndpoint@Endpoint@Aws@@UEAA@XZ";
        }
        AWSEndpoint_VTable :: struct #type_info_none {
            Destructor: (this: *AWSEndpoint, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;
        }
        AWSEndpoint_Destructor :: inline (this: *AWSEndpoint, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

        vtable :: (obj: *AWSEndpoint) -> *AWSEndpoint_VTable { return obj.vtable; }

    }

    /**
    * Closure definition for handling a retry notification. This is only for if you want to be notified that a particular request is being retried.
    */
    RequestRetryHandler :: std.function(#type (unknown0: *AmazonWebServiceRequest) -> void #c_call);
    RequestSignedHandler :: std.function(#type (unknown0: *Http.HttpRequest) -> void #c_call);

    /**
    * Base level abstraction for all modeled AWS requests
    */
    AmazonWebServiceRequest :: struct {
        vtable: *AmazonWebServiceRequest_VTable;
        /**
        * Set the response stream factory.
        */
        SetResponseStreamFactory :: (this: *AmazonWebServiceRequest, factory: *IOStreamFactory) -> void #cpp_method #foreign aws_cpp_sdk_s3 "?SetResponseStreamFactory@AmazonWebServiceRequest@Aws@@QEAAXAEBV?$function@$$A6APEAV?$basic_iostream@DU?$char_traits@D@std@@@std@@XZ@std@@@Z";
        SetResponseStreamFactory :: (this: *AmazonWebServiceRequest, factory: IOStreamFactory) #no_context {
            SetResponseStreamFactory(this, *factory);
        }

        EndpointParameters :: std.vector(Endpoint.EndpointParameter);

        m_additionalCustomHeaders:   Http.HeaderValueCollection;

        m_responseStreamFactory:     IOStreamFactory;

        m_onDataReceived:            Http.DataReceivedEventHandler;
        m_onDataSent:                Http.DataSentEventHandler;
        m_continueRequest:           Http.ContinueRequestHandler;
        m_onRequestSigned:           RequestSignedHandler;
        m_requestRetryHandler:       RequestRetryHandler;
        m_serviceSpecificParameters: std.shared_ptr(Http.ServiceSpecificParameters);

        // Virtual functions:
        // Normally you should call them via the vtable.
        // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
        // or need to create a vtable yourself.

        virtual_Destructor :: (this: *AmazonWebServiceRequest, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign aws_cpp_sdk_s3 "??1AmazonWebServiceRequest@Aws@@UEAA@XZ";

        /**
        * Do nothing virtual, override this to add query strings to the request
        */
        virtual_AddQueryStringParameters :: (this: *AmazonWebServiceRequest, uri: *Http.URI) -> void #cpp_method #foreign aws_cpp_sdk_s3 "?AddQueryStringParameters@AmazonWebServiceRequest@Aws@@UEBAXAEAVURI@Http@2@@Z";

        /**
        * Put the request to a url for later presigning. This will push the body to the url and
        * then adds the existing query string parameters as normal.
        */
        virtual_PutToPresignedUrl :: (this: *AmazonWebServiceRequest, uri: *Http.URI) -> void #cpp_method #foreign aws_cpp_sdk_s3 "?PutToPresignedUrl@AmazonWebServiceRequest@Aws@@UEBAXAEAVURI@Http@2@@Z";

        /**
        * Defaults to false, if this is set to true, it's a streaming request, which means the payload is not well structured bits.
        */
        virtual_IsStreaming :: (this: *AmazonWebServiceRequest) -> bool #cpp_method #foreign aws_cpp_sdk_s3 "?IsStreaming@AmazonWebServiceRequest@Aws@@UEBA_NXZ";

        /**
        * Defaults to false, if this is set to true in derived class, it's an event stream request, which means the payload is consisted by multiple structured events.
        */
        virtual_IsEventStreamRequest :: (this: *AmazonWebServiceRequest) -> bool #cpp_method #foreign aws_cpp_sdk_s3 "?IsEventStreamRequest@AmazonWebServiceRequest@Aws@@UEBA_NXZ";

        /**
        * Defaults to true, if this is set to false, then signers, if they support body signing, will not do so
        */
        virtual_SignBody :: (this: *AmazonWebServiceRequest) -> bool #cpp_method #foreign aws_cpp_sdk_s3 "?SignBody@AmazonWebServiceRequest@Aws@@UEBA_NXZ";

        /**
        * Defaults to false, if a derived class returns true it indicates that the body has an embedded error.
        */
        virtual_HasEmbeddedError :: (this: *AmazonWebServiceRequest, body: *IOStream, header: *Http.HeaderValueCollection) -> bool #cpp_method #foreign aws_cpp_sdk_s3 "?HasEmbeddedError@AmazonWebServiceRequest@Aws@@UEBA_NAEAV?$basic_iostream@DU?$char_traits@D@std@@@std@@AEBV?$map@V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@V12@U?$less@V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@@2@V?$allocator@U?$pair@$$CBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@V12@@std@@@2@@4@@Z";

        /**
        * Defaults to false, if this is set to true, it supports chunked transfer encoding.
        */
        virtual_IsChunked :: (this: *AmazonWebServiceRequest) -> bool #cpp_method #foreign aws_cpp_sdk_s3 "?IsChunked@AmazonWebServiceRequest@Aws@@UEBA_NXZ";

        /**
        * Register closure for request signed event.
        */
        virtual_SetRequestSignedHandler :: (this: *AmazonWebServiceRequest, handler: *RequestSignedHandler) -> void #cpp_method #foreign aws_cpp_sdk_s3 "?SetRequestSignedHandler@AmazonWebServiceRequest@Aws@@UEAAXAEBV?$function@$$A6AXAEBVHttpRequest@Http@Aws@@@Z@std@@@Z";

        /**
        * Get closure for request signed event.
        */
        virtual_GetRequestSignedHandler :: (this: *AmazonWebServiceRequest) -> *RequestSignedHandler #cpp_method #foreign aws_cpp_sdk_s3 "?GetRequestSignedHandler@AmazonWebServiceRequest@Aws@@UEBAAEBV?$function@$$A6AXAEBVHttpRequest@Http@Aws@@@Z@std@@XZ";

        /**
        * Register closure for data received event.
        */
        virtual_SetDataReceivedEventHandler :: (this: *AmazonWebServiceRequest, dataReceivedEventHandler: *Http.DataReceivedEventHandler) -> void #cpp_method #foreign aws_cpp_sdk_s3 "?SetDataReceivedEventHandler@AmazonWebServiceRequest@Aws@@UEAAXAEBV?$function@$$A6AXPEBVHttpRequest@Http@Aws@@PEAVHttpResponse@23@_J@Z@std@@@Z";

        /**
        * register closure for data sent event
        */
        virtual_SetDataSentEventHandler :: (this: *AmazonWebServiceRequest, dataSentEventHandler: *Http.DataSentEventHandler) -> void #cpp_method #foreign aws_cpp_sdk_s3 "?SetDataSentEventHandler@AmazonWebServiceRequest@Aws@@UEAAXAEBV?$function@$$A6AXPEBVHttpRequest@Http@Aws@@_J@Z@std@@@Z";

        /**
        * Register closure for  handling whether or not to continue a request.
        */
        virtual_SetContinueRequestHandler :: (this: *AmazonWebServiceRequest, continueRequestHandler: *Http.ContinueRequestHandler) -> void #cpp_method #foreign aws_cpp_sdk_s3 "?SetContinueRequestHandler@AmazonWebServiceRequest@Aws@@UEAAXAEBV?$function@$$A6A_NPEBVHttpRequest@Http@Aws@@@Z@std@@@Z";

        /**
        * Register closure for notification that a request is being retried
        */
        virtual_SetRequestRetryHandler :: (this: *AmazonWebServiceRequest, handler: *RequestRetryHandler) -> void #cpp_method #foreign aws_cpp_sdk_s3 "?SetRequestRetryHandler@AmazonWebServiceRequest@Aws@@UEAAXAEBV?$function@$$A6AXAEBVAmazonWebServiceRequest@Aws@@@Z@std@@@Z";

        /**
        * get closure for data received event.
        */
        virtual_GetDataReceivedEventHandler :: (this: *AmazonWebServiceRequest) -> *Http.DataReceivedEventHandler #cpp_method #foreign aws_cpp_sdk_s3 "?GetDataReceivedEventHandler@AmazonWebServiceRequest@Aws@@UEBAAEBV?$function@$$A6AXPEBVHttpRequest@Http@Aws@@PEAVHttpResponse@23@_J@Z@std@@XZ";

        /**
        * get closure for data sent event
        */
        virtual_GetDataSentEventHandler :: (this: *AmazonWebServiceRequest) -> *Http.DataSentEventHandler #cpp_method #foreign aws_cpp_sdk_s3 "?GetDataSentEventHandler@AmazonWebServiceRequest@Aws@@UEBAAEBV?$function@$$A6AXPEBVHttpRequest@Http@Aws@@_J@Z@std@@XZ";

        /**
        * get closure for handling whether or not to cancel a request.
        */
        virtual_GetContinueRequestHandler :: (this: *AmazonWebServiceRequest) -> *Http.ContinueRequestHandler #cpp_method #foreign aws_cpp_sdk_s3 "?GetContinueRequestHandler@AmazonWebServiceRequest@Aws@@UEBAAEBV?$function@$$A6A_NPEBVHttpRequest@Http@Aws@@@Z@std@@XZ";

        /**
        * get closure for notification that a request is being retried
        */
        virtual_GetRequestRetryHandler :: (this: *AmazonWebServiceRequest) -> *RequestRetryHandler #cpp_method #foreign aws_cpp_sdk_s3 "?GetRequestRetryHandler@AmazonWebServiceRequest@Aws@@UEBAAEBV?$function@$$A6AXAEBVAmazonWebServiceRequest@Aws@@@Z@std@@XZ";

        /**
        * If this is set to true, content-md5 needs to be computed and set on the request
        */
        virtual_ShouldComputeContentMd5 :: (this: *AmazonWebServiceRequest) -> bool #cpp_method #foreign aws_cpp_sdk_s3 "?ShouldComputeContentMd5@AmazonWebServiceRequest@Aws@@UEBA_NXZ";

        virtual_ShouldValidateResponseChecksum :: (this: *AmazonWebServiceRequest) -> bool #cpp_method #foreign aws_cpp_sdk_s3 "?ShouldValidateResponseChecksum@AmazonWebServiceRequest@Aws@@UEBA_NXZ";

        virtual_GetResponseChecksumAlgorithmNames :: (this: *AmazonWebServiceRequest) -> std.vector(String) #cpp_method #foreign aws_cpp_sdk_s3 "?GetResponseChecksumAlgorithmNames@AmazonWebServiceRequest@Aws@@UEBA?AV?$vector@V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@V?$allocator@V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@@2@@std@@XZ";

        virtual_GetChecksumAlgorithmName :: (this: *AmazonWebServiceRequest) -> String #cpp_method #foreign aws_cpp_sdk_s3 "?GetChecksumAlgorithmName@AmazonWebServiceRequest@Aws@@UEBA?AV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@XZ";

        virtual_SetServiceSpecificParameters :: (this: *AmazonWebServiceRequest, serviceSpecificParameters: *std.shared_ptr(Http.ServiceSpecificParameters)) -> void #cpp_method #foreign aws_cpp_sdk_s3 "?SetServiceSpecificParameters@AmazonWebServiceRequest@Aws@@UEBAXAEBV?$shared_ptr@UServiceSpecificParameters@Http@Aws@@@std@@@Z";

        virtual_GetServiceSpecificParameters :: (this: *AmazonWebServiceRequest) -> std.shared_ptr(Http.ServiceSpecificParameters) #cpp_method #foreign aws_cpp_sdk_s3 "?GetServiceSpecificParameters@AmazonWebServiceRequest@Aws@@UEBA?AV?$shared_ptr@UServiceSpecificParameters@Http@Aws@@@std@@XZ";

        virtual_GetSelectedCompressionAlgorithm :: (this: *AmazonWebServiceRequest, unknown0: Client.RequestCompressionConfig) -> Client.CompressionAlgorithm #cpp_method #foreign aws_cpp_sdk_s3 "?GetSelectedCompressionAlgorithm@AmazonWebServiceRequest@Aws@@UEBA?AW4CompressionAlgorithm@Client@2@URequestCompressionConfig@42@@Z";

        /**
        * Default does nothing. Override this to convert what would otherwise be the payload of the
        *  request to a query string format.
        */
        virtual_DumpBodyToUrl :: (this: *AmazonWebServiceRequest, uri: *Http.URI) -> void #cpp_method #foreign aws_cpp_sdk_s3 "?DumpBodyToUrl@AmazonWebServiceRequest@Aws@@MEBAXAEAVURI@Http@2@@Z";
    }
    AmazonWebServiceRequest_VTable :: struct #type_info_none {
        Destructor: (this: *AmazonWebServiceRequest, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

        GetBody: (this: *AmazonWebServiceRequest) -> std.shared_ptr(IOStream) #cpp_method;

        GetHeaders: (this: *AmazonWebServiceRequest) -> Http.HeaderValueCollection #cpp_method;

        GetAdditionalCustomHeaders: (this: *AmazonWebServiceRequest) -> *Http.HeaderValueCollection #cpp_method;

        SetAdditionalCustomHeaderValue: (this: *AmazonWebServiceRequest, headerName: *String, headerValue: *String) -> void #cpp_method;

        AddQueryStringParameters: (this: *AmazonWebServiceRequest, uri: *Http.URI) -> void #cpp_method;

        PutToPresignedUrl: (this: *AmazonWebServiceRequest, uri: *Http.URI) -> void #cpp_method;

        IsStreaming: (this: *AmazonWebServiceRequest) -> bool #cpp_method;

        IsEventStreamRequest: (this: *AmazonWebServiceRequest) -> bool #cpp_method;

        SignBody: (this: *AmazonWebServiceRequest) -> bool #cpp_method;

        HasEmbeddedError: (this: *AmazonWebServiceRequest, body: *IOStream, header: *Http.HeaderValueCollection) -> bool #cpp_method;

        IsChunked: (this: *AmazonWebServiceRequest) -> bool #cpp_method;

        SetRequestSignedHandler: (this: *AmazonWebServiceRequest, handler: *RequestSignedHandler) -> void #cpp_method;

        GetRequestSignedHandler: (this: *AmazonWebServiceRequest) -> *RequestSignedHandler #cpp_method;

        SetDataReceivedEventHandler: (this: *AmazonWebServiceRequest, dataReceivedEventHandler: *Http.DataReceivedEventHandler) -> void #cpp_method;

        SetDataSentEventHandler: (this: *AmazonWebServiceRequest, dataSentEventHandler: *Http.DataSentEventHandler) -> void #cpp_method;

        SetContinueRequestHandler: (this: *AmazonWebServiceRequest, continueRequestHandler: *Http.ContinueRequestHandler) -> void #cpp_method;

        SetRequestRetryHandler: (this: *AmazonWebServiceRequest, handler: *RequestRetryHandler) -> void #cpp_method;

        GetDataReceivedEventHandler: (this: *AmazonWebServiceRequest) -> *Http.DataReceivedEventHandler #cpp_method;

        GetDataSentEventHandler: (this: *AmazonWebServiceRequest) -> *Http.DataSentEventHandler #cpp_method;

        GetContinueRequestHandler: (this: *AmazonWebServiceRequest) -> *Http.ContinueRequestHandler #cpp_method;

        GetRequestRetryHandler: (this: *AmazonWebServiceRequest) -> *RequestRetryHandler #cpp_method;

        ShouldComputeContentMd5: (this: *AmazonWebServiceRequest) -> bool #cpp_method;

        ShouldValidateResponseChecksum: (this: *AmazonWebServiceRequest) -> bool #cpp_method;

        GetResponseChecksumAlgorithmNames: (this: *AmazonWebServiceRequest) -> std.vector(String) #cpp_method;

        GetChecksumAlgorithmName: (this: *AmazonWebServiceRequest) -> String #cpp_method;

        GetServiceRequestName: (this: *AmazonWebServiceRequest) -> *u8 #cpp_method;

        SetServiceSpecificParameters: (this: *AmazonWebServiceRequest, serviceSpecificParameters: *std.shared_ptr(Http.ServiceSpecificParameters)) -> void #cpp_method;

        GetServiceSpecificParameters: (this: *AmazonWebServiceRequest) -> std.shared_ptr(Http.ServiceSpecificParameters) #cpp_method;

        GetEndpointContextParams: (this: *AmazonWebServiceRequest) -> AmazonWebServiceRequest.EndpointParameters #cpp_method;

        GetSelectedCompressionAlgorithm: (this: *AmazonWebServiceRequest, unknown0: Client.RequestCompressionConfig) -> Client.CompressionAlgorithm #cpp_method;

        DumpBodyToUrl: (this: *AmazonWebServiceRequest, uri: *Http.URI) -> void #cpp_method;
    }

    AmazonWebServiceRequest_Destructor :: inline (this: *AmazonWebServiceRequest, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

    AmazonWebServiceRequest_GetBody :: inline (this: *AmazonWebServiceRequest) -> std.shared_ptr(IOStream) { return this.vtable.GetBody(this); }

    AmazonWebServiceRequest_GetHeaders :: inline (this: *AmazonWebServiceRequest) -> Http.HeaderValueCollection { return this.vtable.GetHeaders(this); }

    AmazonWebServiceRequest_GetAdditionalCustomHeaders :: inline (this: *AmazonWebServiceRequest) -> *Http.HeaderValueCollection { return this.vtable.GetAdditionalCustomHeaders(this); }

    AmazonWebServiceRequest_SetAdditionalCustomHeaderValue :: inline (this: *AmazonWebServiceRequest, headerName: *String, headerValue: *String) { this.vtable.SetAdditionalCustomHeaderValue(this, headerName, headerValue); }

    AmazonWebServiceRequest_AddQueryStringParameters :: inline (this: *AmazonWebServiceRequest, uri: *Http.URI) { this.vtable.AddQueryStringParameters(this, uri); }

    AmazonWebServiceRequest_PutToPresignedUrl :: inline (this: *AmazonWebServiceRequest, uri: *Http.URI) { this.vtable.PutToPresignedUrl(this, uri); }

    AmazonWebServiceRequest_IsStreaming :: inline (this: *AmazonWebServiceRequest) -> bool { return this.vtable.IsStreaming(this); }

    AmazonWebServiceRequest_IsEventStreamRequest :: inline (this: *AmazonWebServiceRequest) -> bool { return this.vtable.IsEventStreamRequest(this); }

    AmazonWebServiceRequest_SignBody :: inline (this: *AmazonWebServiceRequest) -> bool { return this.vtable.SignBody(this); }

    AmazonWebServiceRequest_HasEmbeddedError :: inline (this: *AmazonWebServiceRequest, body: *IOStream, header: *Http.HeaderValueCollection) -> bool { return this.vtable.HasEmbeddedError(this, body, header); }

    AmazonWebServiceRequest_IsChunked :: inline (this: *AmazonWebServiceRequest) -> bool { return this.vtable.IsChunked(this); }

    AmazonWebServiceRequest_SetRequestSignedHandler :: inline (this: *AmazonWebServiceRequest, handler: *RequestSignedHandler) { this.vtable.SetRequestSignedHandler(this, handler); }

    AmazonWebServiceRequest_GetRequestSignedHandler :: inline (this: *AmazonWebServiceRequest) -> *RequestSignedHandler { return this.vtable.GetRequestSignedHandler(this); }

    AmazonWebServiceRequest_SetDataReceivedEventHandler :: inline (this: *AmazonWebServiceRequest, dataReceivedEventHandler: *Http.DataReceivedEventHandler) { this.vtable.SetDataReceivedEventHandler(this, dataReceivedEventHandler); }

    AmazonWebServiceRequest_SetDataSentEventHandler :: inline (this: *AmazonWebServiceRequest, dataSentEventHandler: *Http.DataSentEventHandler) { this.vtable.SetDataSentEventHandler(this, dataSentEventHandler); }

    AmazonWebServiceRequest_SetContinueRequestHandler :: inline (this: *AmazonWebServiceRequest, continueRequestHandler: *Http.ContinueRequestHandler) { this.vtable.SetContinueRequestHandler(this, continueRequestHandler); }

    AmazonWebServiceRequest_SetRequestRetryHandler :: inline (this: *AmazonWebServiceRequest, handler: *RequestRetryHandler) { this.vtable.SetRequestRetryHandler(this, handler); }

    AmazonWebServiceRequest_GetDataReceivedEventHandler :: inline (this: *AmazonWebServiceRequest) -> *Http.DataReceivedEventHandler { return this.vtable.GetDataReceivedEventHandler(this); }

    AmazonWebServiceRequest_GetDataSentEventHandler :: inline (this: *AmazonWebServiceRequest) -> *Http.DataSentEventHandler { return this.vtable.GetDataSentEventHandler(this); }

    AmazonWebServiceRequest_GetContinueRequestHandler :: inline (this: *AmazonWebServiceRequest) -> *Http.ContinueRequestHandler { return this.vtable.GetContinueRequestHandler(this); }

    AmazonWebServiceRequest_GetRequestRetryHandler :: inline (this: *AmazonWebServiceRequest) -> *RequestRetryHandler { return this.vtable.GetRequestRetryHandler(this); }

    AmazonWebServiceRequest_ShouldComputeContentMd5 :: inline (this: *AmazonWebServiceRequest) -> bool { return this.vtable.ShouldComputeContentMd5(this); }

    AmazonWebServiceRequest_ShouldValidateResponseChecksum :: inline (this: *AmazonWebServiceRequest) -> bool { return this.vtable.ShouldValidateResponseChecksum(this); }

    AmazonWebServiceRequest_GetResponseChecksumAlgorithmNames :: inline (this: *AmazonWebServiceRequest) -> std.vector(String) { return this.vtable.GetResponseChecksumAlgorithmNames(this); }

    AmazonWebServiceRequest_GetChecksumAlgorithmName :: inline (this: *AmazonWebServiceRequest) -> String { return this.vtable.GetChecksumAlgorithmName(this); }

    AmazonWebServiceRequest_GetServiceRequestName :: inline (this: *AmazonWebServiceRequest) -> *u8 { return this.vtable.GetServiceRequestName(this); }

    AmazonWebServiceRequest_SetServiceSpecificParameters :: inline (this: *AmazonWebServiceRequest, serviceSpecificParameters: *std.shared_ptr(Http.ServiceSpecificParameters)) { this.vtable.SetServiceSpecificParameters(this, serviceSpecificParameters); }

    AmazonWebServiceRequest_GetServiceSpecificParameters :: inline (this: *AmazonWebServiceRequest) -> std.shared_ptr(Http.ServiceSpecificParameters) { return this.vtable.GetServiceSpecificParameters(this); }

    AmazonWebServiceRequest_GetEndpointContextParams :: inline (this: *AmazonWebServiceRequest) -> AmazonWebServiceRequest.EndpointParameters { return this.vtable.GetEndpointContextParams(this); }

    AmazonWebServiceRequest_GetSelectedCompressionAlgorithm :: inline (this: *AmazonWebServiceRequest, unknown0: Client.RequestCompressionConfig) -> Client.CompressionAlgorithm { return this.vtable.GetSelectedCompressionAlgorithm(this, unknown0); }

    AmazonWebServiceRequest_DumpBodyToUrl :: inline (this: *AmazonWebServiceRequest, uri: *Http.URI) { this.vtable.DumpBodyToUrl(this, uri); }

    vtable :: (obj: *AmazonWebServiceRequest) -> *AmazonWebServiceRequest_VTable { return obj.vtable; }


    /**
    * Container for web response to an AWS Request.
    */
    AmazonWebServiceResult :: struct(PAYLOAD_TYPE: Type) {
        m_payload:         PAYLOAD_TYPE;
        m_responseHeaders: Http.HeaderValueCollection;
        m_responseCode:    Http.HttpResponseCode;
    }

    DEFAULT_LOG_PREFIX: *u8 = "aws_sdk_";

    /**
    * SDK wide options for logging
    */
    LoggingOptions :: struct {
        /**
        * Defaults to Off, if this is set to something else, then logging will be turned on and logLevel will be passed to the logger
        */
        logLevel:             Utils.Logging.LogLevel;

        /**
        * Defaults to aws_sdk_. This will only be used if the default logger is used.
        */
        defaultLogPrefix:     *u8;

        /**
        * Defaults to empty, if logLevel has been set and this field is empty, then the default log system will be used.
        * otherwise, we will call this closure to create a logger
        */
        logger_create_fn:     std.function(#type () -> std.shared_ptr(Utils.Logging.LogSystemInterface) #c_call);

        /**
        * Defaults to empty, if logLevel has been set and this field is empty, then the default CRT log system will be used.
        * The default CRT log system will redirect all logs from common runtime libraries (CRT) to C++ SDK with the same log level and formatting.
        */
        crt_logger_create_fn: std.function(#type () -> std.shared_ptr(Utils.Logging.CRTLogSystemInterface) #c_call);
    }

    /**
    * SDK wide options for memory management
    */
    MemoryManagementOptions :: struct {
        /**
        * Defaults to nullptr. If custom memory management is being used and this hasn't been set then the default memory
        * manager will be used. If this has been set and custom memory management has been turned on, then this will be installed
        * at startup time.
        */
        memoryManager: *Utils.Memory.MemorySystemInterface;
    }

    /**
    * SDK wide options for I/O: client bootstrap and TLS connection options
    */
    IoOptions :: struct {
        clientBootstrap_create_fn:      std.function(#type () -> std.shared_ptr(Crt.Io.ClientBootstrap) #c_call);
        tlsConnectionOptions_create_fn: std.function(#type () -> std.shared_ptr(Crt.Io.TlsConnectionOptions) #c_call);
    }

    /**
    * SDK wide options for http
    */
    HttpOptions :: struct {
        /**
        * Defaults to empty, if this is set, then the result of your closure will be installed and used instead of the system defaults
        */
        httpClientFactory_create_fn: std.function(#type () -> std.shared_ptr(Http.HttpClientFactory) #c_call);

        /**
        * libCurl infects everything with its global state. If it is being used then we automatically initialize and clean it up.
        * If this is a problem for you, set this to false. If you manually initialize libcurl please add the option CURL_GLOBAL_ALL to your init call.
        */
        initAndCleanupCurl:          bool;

        /**
        * Installs a global SIGPIPE handler that logs the error and prevents it from terminating the current process.
        * This can be used on operating systems on which CURL is being used. In some situations CURL cannot avoid
        * triggering a SIGPIPE.
        * For more information see: https://curl.haxx.se/libcurl/c/CURLOPT_NOSIGNAL.html
        * NOTE: CURLOPT_NOSIGNAL is already being set.
        */
        installSigPipeHandler:       bool;

        /**
        * Disable legacy URL encoding that leaves `$&,:@=` unescaped for legacy purposes.
        */
        compliantRfc3986Encoding:    bool;

        /**
        * When constructing Path segments in a URI preserve path separators instead of collapsing
        * slashes. This is useful for aligning with other SDKs and tools on key path for S3 objects
        * as currently the C++ SDK sanitizes the path.
        *
        * TODO: In the next major release, this will become the default to align better with other SDKs.
        */
        preservePathSeparators       := false;
    }

    /**
    * SDK wide options for crypto
    */
    CryptoOptions :: struct {
        /**
        * If set, this closure will be used to create and install the factory.
        */
        md5Factory_create_fn:          std.function(#type () -> std.shared_ptr(Utils.Crypto.HashFactory) #c_call);

        /**
        * If set, this closure will be used to create and install the factory.
        */
        sha1Factory_create_fn:         std.function(#type () -> std.shared_ptr(Utils.Crypto.HashFactory) #c_call);

        /**
        * If set, this closure will be used to create and install the factory.
        */
        sha256Factory_create_fn:       std.function(#type () -> std.shared_ptr(Utils.Crypto.HashFactory) #c_call);

        /**
        * If set, this closure will be used to create and install the factory.
        */
        sha256HMACFactory_create_fn:   std.function(#type () -> std.shared_ptr(Utils.Crypto.HMACFactory) #c_call);

        /**
        * If set, this closure will be used to create and install the factory.
        */
        aes_CBCFactory_create_fn:      std.function(#type () -> std.shared_ptr(Utils.Crypto.SymmetricCipherFactory) #c_call);

        /**
        * If set, this closure will be used to create and install the factory.
        */
        aes_CTRFactory_create_fn:      std.function(#type () -> std.shared_ptr(Utils.Crypto.SymmetricCipherFactory) #c_call);

        /**
        * If set, this closure will be used to create and install the factory.
        */
        aes_GCMFactory_create_fn:      std.function(#type () -> std.shared_ptr(Utils.Crypto.SymmetricCipherFactory) #c_call);

        /**
        * If set, this closure will be used to create and install the factory.
        */
        aes_KeyWrapFactory_create_fn:  std.function(#type () -> std.shared_ptr(Utils.Crypto.SymmetricCipherFactory) #c_call);

        /**
        * If set, this closure will be used to create and install the factory.
        */
        secureRandomFactory_create_fn: std.function(#type () -> std.shared_ptr(Utils.Crypto.SecureRandomFactory) #c_call);

        /**
        * OpenSSL infects everything with its global state. If it is being used then we automatically initialize and clean it up.
        * If this is a problem for you, set this to false. Be aware that if you don't use our init and cleanup and you are using
        * crypto functionality, you are responsible for installing thread locking, and loading strings and error messages.
        */
        initAndCleanupOpenSSL:         bool;
    }

    /**
    * MonitoringOptions is used to set up monitoring functionalities globally and(or) for users to customize monitoring listeners.
    */
    MonitoringOptions :: struct {
        /**
        * These factory functions will be used to try to create customized monitoring listener factories, then be used to create monitoring listener instances.
        * Based on functions and factory's implementation, it may fail to create an instance.
        * If a function failed to create factory or a created factory failed to create an instance, SDK just ignore it.
        * By default, SDK will try to create a default Client Side Monitoring Listener.
        */
        customizedMonitoringFactory_create_fn: std.vector(Monitoring.MonitoringFactoryCreateFunction);
    }

    /**
    * You may notice that instead of taking pointers directly to your factories, we take a closure. This is because
    * if you have installed custom memory management, the allocation for your factories needs to happen after
    * the memory system has been initialized and shutdown needs to happen prior to the memory management being shutdown.
    *
    * Common Recipes:
    *
    * Just use defaults:
    *
    * SDKOptions options;
    * Aws::InitAPI(options);
    * .....
    * Aws::ShutdownAPI(options);
    *
    * Turn logging on using the default logger:
    *
    * SDKOptions options;
    * options.loggingOptions.logLevel = Aws::Utils::Logging::LogLevel::Info;
    * Aws::InitAPI(options);
    * .....
    * Aws::ShutdownAPI(options);
    *
    * Install custom memory manager:
    *
    * MyMemoryManager memoryManager;
    *
    * SDKOptions options;
    * options.memoryManagementOptions.memoryManager = &memoryManager;
    * Aws::InitAPI(options);
    * .....
    * Aws::ShutdownAPI(options);
    *
    * Override default http client factory
    *
    * SDKOptions options;
    * options.httpOptions.httpClientFactory_create_fn = [](){ return Aws::MakeShared<MyCustomHttpClientFactory>("ALLOC_TAG", arg1); };
    * Aws::InitAPI(options);
    * .....
    * Aws::ShutdownAPI(options);
    */
    SDKOptions :: struct {
        /**
        * SDK wide options for I/O: client bootstrap and TLS connection options
        */
        ioOptions:               IoOptions;

        /**
        * SDK wide options for logging
        */
        loggingOptions:          LoggingOptions;

        /**
        * SDK wide options for memory management
        */
        memoryManagementOptions: MemoryManagementOptions;

        /**
        * SDK wide options for http
        */
        httpOptions:             HttpOptions;

        /**
        * SDK wide options for crypto
        */
        cryptoOptions:           CryptoOptions;

        /**
        * Options used to set up customized monitoring implementations
        * Put your monitoring factory in a closure (a create factory function) and put all closures in a vector.
        * Basic usage can be found in aws-cpp-sdk-core-tests/monitoring/MonitoringTest.cpp
        */
        monitoringOptions:       MonitoringOptions;

        SDKVersion :: struct {
            major: u8 = 1;
            minor: u8 = 11;
            patch: u16 = 326;
        }

        sdkVersion:              SDKVersion;
    }

    JSON_CONTENT_TYPE: [17] u8;
    AMZN_JSON_CONTENT_TYPE_1_0: [27] u8;
    AMZN_JSON_CONTENT_TYPE_1_1: [27] u8;
    FORM_CONTENT_TYPE: [34] u8;
    AMZN_XML_CONTENT_TYPE: [16] u8;
    AMZN_EVENTSTREAM_CONTENT_TYPE: [35] u8;

    /**
    * High-level abstraction over AWS requests. GetBody() calls SerializePayload() and uses a stringbuf under the hood.
    * This is for payloads such as query, xml, or json
    */
    AmazonSerializableWebServiceRequest :: struct {
        #as using amazonwebservicerequest: AmazonWebServiceRequest;

        Constructor :: (this: *AmazonSerializableWebServiceRequest) -> void #cpp_method #foreign aws_cpp_sdk_s3 "??0AmazonSerializableWebServiceRequest@Aws@@QEAA@XZ";
        #place amazonwebservicerequest; amazonserializablewebservicerequest_vtable: *AmazonSerializableWebServiceRequest_VTable;

        // Virtual functions:
        // Normally you should call them via the vtable.
        // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
        // or need to create a vtable yourself.

        virtual_Destructor :: (this: *AmazonSerializableWebServiceRequest, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign aws_cpp_sdk_s3 "??1AmazonSerializableWebServiceRequest@Aws@@UEAA@XZ";
    }
    AmazonSerializableWebServiceRequest_VTable :: struct #type_info_none {
        using amazonwebservicerequest: AmazonWebServiceRequest_VTable;
        SerializePayload: (this: *AmazonSerializableWebServiceRequest) -> String #cpp_method;
    }
    AmazonSerializableWebServiceRequest_SerializePayload :: inline (this: *AmazonSerializableWebServiceRequest) -> String { return this.amazonserializablewebservicerequest_vtable.SerializePayload(this); }

    vtable :: (obj: *AmazonSerializableWebServiceRequest) -> *AmazonSerializableWebServiceRequest_VTable { return obj.amazonserializablewebservicerequest_vtable; }


    DEFAULT_CONTENT_TYPE: *u8 = "binary/octet-stream";

    /**
    * High-level abstraction over AWS requests that don't have well formed payloads. GetBody() uses an underlying stream that has been set by a call to SetBody()
    * Also supports request specific headers such as in rest protocols.
    */
    AmazonStreamingWebServiceRequest :: struct {
        #as using amazonwebservicerequest: AmazonWebServiceRequest;

        /**
        * Initializes members to defaults
        */
        Constructor :: (this: *AmazonStreamingWebServiceRequest) -> void #cpp_method #foreign aws_cpp_sdk_s3 "??0AmazonStreamingWebServiceRequest@Aws@@QEAA@XZ";

        /**
        * Get the user set contentType. Defaults to binary/octet-stream
        */
        GetContentType :: (this: *AmazonStreamingWebServiceRequest) -> *String #cpp_method #foreign aws_cpp_sdk_s3 "?GetContentType@AmazonStreamingWebServiceRequest@Aws@@QEBAAEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@XZ";

        m_bodyStream:  std.shared_ptr(IOStream);
        m_contentType: String;
        #place amazonwebservicerequest; amazonstreamingwebservicerequest_vtable: *AmazonStreamingWebServiceRequest_VTable;

        // Virtual functions:
        // Normally you should call them via the vtable.
        // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
        // or need to create a vtable yourself.

        /**
        * Get the user set stream
        */
        virtual_GetBody :: (this: *AmazonStreamingWebServiceRequest) -> std.shared_ptr(IOStream) #cpp_method #foreign aws_cpp_sdk_s3 "?GetBody@AmazonStreamingWebServiceRequest@Aws@@UEBA?AV?$shared_ptr@V?$basic_iostream@DU?$char_traits@D@std@@@std@@@std@@XZ";

        /**
        * Gets all headers that will be needed in the request. Calls GetRequestSpecificHeaders(), which is the chance for subclasses to add
        * headers from their modeled data.
        */
        virtual_GetHeaders :: (this: *AmazonStreamingWebServiceRequest) -> Http.HeaderValueCollection #cpp_method #foreign aws_cpp_sdk_s3 "?GetHeaders@AmazonStreamingWebServiceRequest@Aws@@UEBA?AV?$map@V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@V12@U?$less@V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@@2@V?$allocator@U?$pair@$$CBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@V12@@std@@@2@@std@@XZ";

        /**
        * AmazonStreamingWebServiceRequest always returns true.
        */
        virtual_IsStreaming :: (this: *AmazonStreamingWebServiceRequest) -> bool #cpp_method #foreign aws_cpp_sdk_s3 "?IsStreaming@AmazonStreamingWebServiceRequest@Aws@@UEBA_NXZ";

        /**
        * Override this method to put data members from a subclass into the headers collection.
        */
        virtual_GetRequestSpecificHeaders :: (this: *AmazonStreamingWebServiceRequest) -> Http.HeaderValueCollection #cpp_method #foreign aws_cpp_sdk_s3 "?GetRequestSpecificHeaders@AmazonStreamingWebServiceRequest@Aws@@MEBA?AV?$map@V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@V12@U?$less@V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@@2@V?$allocator@U?$pair@$$CBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@V12@@std@@@2@@std@@XZ";
    }
    AmazonStreamingWebServiceRequest_VTable :: struct #type_info_none {
        using amazonwebservicerequest: AmazonWebServiceRequest_VTable;
        GetRequestSpecificHeaders: (this: *AmazonStreamingWebServiceRequest) -> Http.HeaderValueCollection #cpp_method;
    }
    AmazonStreamingWebServiceRequest_GetRequestSpecificHeaders :: inline (this: *AmazonStreamingWebServiceRequest) -> Http.HeaderValueCollection { return this.amazonstreamingwebservicerequest_vtable.GetRequestSpecificHeaders(this); }

    vtable :: (obj: *AmazonStreamingWebServiceRequest) -> *AmazonStreamingWebServiceRequest_VTable { return obj.amazonstreamingwebservicerequest_vtable; }

}

static_assertion_at_line_60 :: [1] u8;
static_assertion_at_line_61 :: [1] u8;
static_assertion_at_line_62 :: [1] u8;

anon_enum_1 :: enum s32 {
    AWS_CACHE_LINE :: 64;
}

/**
* @deprecated Use int64_t instead for offsets in public APIs.
*/
aws_off_t :: s64;

/* Allocator structure. An instance of this will be passed around for anything needing memory allocation */
aws_allocator :: struct {
    mem_acquire: #type (allocator: *aws_allocator, size: u64) -> *void #c_call;
    mem_release: #type (allocator: *aws_allocator, ptr: *void) -> void #c_call;

    /* Optional method; if not supported, this pointer must be NULL */
    mem_realloc: #type (allocator: *aws_allocator, oldptr: *void, oldsize: u64, newsize: u64) -> *void #c_call;

    /* Optional method; if not supported, this pointer must be NULL */
    mem_calloc:  #type (allocator: *aws_allocator, num: u64, size: u64) -> *void #c_call;
    impl:        *void;
}

/*
* Maintainer note: The above function doesn't return the pointer (as with
* standard C realloc) as this pattern becomes error-prone when OOMs occur.
* In particular, we want to avoid losing the old pointer when an OOM condition
* occurs, so we prefer to take the old pointer as an in/out reference argument
* that we can leave unchanged on failure.
*/
aws_mem_trace_level :: enum s32 {
    NONE   :: 0;
    BYTES  :: 1;
    STACKS :: 2;

    AWS_MEMTRACE_NONE   :: NONE;
    AWS_MEMTRACE_BYTES  :: BYTES;
    AWS_MEMTRACE_STACKS :: STACKS;
}

aws_error_info :: struct {
    error_code:     s32;
    literal_name:   *u8;
    error_str:      *u8;
    lib_name:       *u8;
    formatted_name: *u8;
}

aws_error_info_list :: struct {
    error_list: *aws_error_info;
    count:      u16;
}

aws_error_handler_fn :: #type (err: s32, ctx: *void) -> void #c_call;

aws_common_error :: enum s32 {
    SUCCESS                             :: 0;
    OOM                                 :: 1;
    NO_SPACE                            :: 2;
    UNKNOWN                             :: 3;
    SHORT_BUFFER                        :: 4;
    OVERFLOW_DETECTED                   :: 5;
    UNSUPPORTED_OPERATION               :: 6;
    INVALID_BUFFER_SIZE                 :: 7;
    INVALID_HEX_STR                     :: 8;
    INVALID_BASE64_STR                  :: 9;
    INVALID_INDEX                       :: 10;
    THREAD_INVALID_SETTINGS             :: 11;
    THREAD_INSUFFICIENT_RESOURCE        :: 12;
    THREAD_NO_PERMISSIONS               :: 13;
    THREAD_NOT_JOINABLE                 :: 14;
    THREAD_NO_SUCH_THREAD_ID            :: 15;
    THREAD_DEADLOCK_DETECTED            :: 16;
    MUTEX_NOT_INIT                      :: 17;
    MUTEX_TIMEOUT                       :: 18;
    MUTEX_CALLER_NOT_OWNER              :: 19;
    MUTEX_FAILED                        :: 20;
    COND_VARIABLE_INIT_FAILED           :: 21;
    COND_VARIABLE_TIMED_OUT             :: 22;
    COND_VARIABLE_ERROR_UNKNOWN         :: 23;
    CLOCK_FAILURE                       :: 24;
    LIST_EMPTY                          :: 25;
    DEST_COPY_TOO_SMALL                 :: 26;
    LIST_EXCEEDS_MAX_SIZE               :: 27;
    LIST_STATIC_MODE_CANT_SHRINK        :: 28;
    PRIORITY_QUEUE_FULL                 :: 29;
    PRIORITY_QUEUE_EMPTY                :: 30;
    PRIORITY_QUEUE_BAD_NODE             :: 31;
    HASHTBL_ITEM_NOT_FOUND              :: 32;
    INVALID_DATE_STR                    :: 33;
    INVALID_ARGUMENT                    :: 34;
    RANDOM_GEN_FAILED                   :: 35;
    MALFORMED_INPUT_STRING              :: 36;
    UNIMPLEMENTED                       :: 37;
    INVALID_STATE                       :: 38;
    ENVIRONMENT_GET                     :: 39;
    ENVIRONMENT_SET                     :: 40;
    ENVIRONMENT_UNSET                   :: 41;
    STREAM_UNSEEKABLE                   :: 42;
    NO_PERMISSION                       :: 43;
    FILE_INVALID_PATH                   :: 44;
    MAX_FDS_EXCEEDED                    :: 45;
    SYS_CALL_FAILURE                    :: 46;
    C_STRING_BUFFER_NOT_NULL_TERMINATED :: 47;
    STRING_MATCH_NOT_FOUND              :: 48;
    DIVIDE_BY_ZERO                      :: 49;
    INVALID_FILE_HANDLE                 :: 50;
    OPERATION_INTERUPTED                :: 51;
    DIRECTORY_NOT_EMPTY                 :: 52;
    PLATFORM_NOT_SUPPORTED              :: 53;
    INVALID_UTF8                        :: 54;
    GET_HOME_DIRECTORY_FAILED           :: 55;
    INVALID_XML                         :: 56;
    FILE_OPEN_FAILURE                   :: 57;
    FILE_READ_FAILURE                   :: 58;
    FILE_WRITE_FAILURE                  :: 59;
    END_COMMON_RANGE                    :: 1023;

    AWS_ERROR_SUCCESS                             :: SUCCESS;
    AWS_ERROR_OOM                                 :: OOM;
    AWS_ERROR_NO_SPACE                            :: NO_SPACE;
    AWS_ERROR_UNKNOWN                             :: UNKNOWN;
    AWS_ERROR_SHORT_BUFFER                        :: SHORT_BUFFER;
    AWS_ERROR_OVERFLOW_DETECTED                   :: OVERFLOW_DETECTED;
    AWS_ERROR_UNSUPPORTED_OPERATION               :: UNSUPPORTED_OPERATION;
    AWS_ERROR_INVALID_BUFFER_SIZE                 :: INVALID_BUFFER_SIZE;
    AWS_ERROR_INVALID_HEX_STR                     :: INVALID_HEX_STR;
    AWS_ERROR_INVALID_BASE64_STR                  :: INVALID_BASE64_STR;
    AWS_ERROR_INVALID_INDEX                       :: INVALID_INDEX;
    AWS_ERROR_THREAD_INVALID_SETTINGS             :: THREAD_INVALID_SETTINGS;
    AWS_ERROR_THREAD_INSUFFICIENT_RESOURCE        :: THREAD_INSUFFICIENT_RESOURCE;
    AWS_ERROR_THREAD_NO_PERMISSIONS               :: THREAD_NO_PERMISSIONS;
    AWS_ERROR_THREAD_NOT_JOINABLE                 :: THREAD_NOT_JOINABLE;
    AWS_ERROR_THREAD_NO_SUCH_THREAD_ID            :: THREAD_NO_SUCH_THREAD_ID;
    AWS_ERROR_THREAD_DEADLOCK_DETECTED            :: THREAD_DEADLOCK_DETECTED;
    AWS_ERROR_MUTEX_NOT_INIT                      :: MUTEX_NOT_INIT;
    AWS_ERROR_MUTEX_TIMEOUT                       :: MUTEX_TIMEOUT;
    AWS_ERROR_MUTEX_CALLER_NOT_OWNER              :: MUTEX_CALLER_NOT_OWNER;
    AWS_ERROR_MUTEX_FAILED                        :: MUTEX_FAILED;
    AWS_ERROR_COND_VARIABLE_INIT_FAILED           :: COND_VARIABLE_INIT_FAILED;
    AWS_ERROR_COND_VARIABLE_TIMED_OUT             :: COND_VARIABLE_TIMED_OUT;
    AWS_ERROR_COND_VARIABLE_ERROR_UNKNOWN         :: COND_VARIABLE_ERROR_UNKNOWN;
    AWS_ERROR_CLOCK_FAILURE                       :: CLOCK_FAILURE;
    AWS_ERROR_LIST_EMPTY                          :: LIST_EMPTY;
    AWS_ERROR_DEST_COPY_TOO_SMALL                 :: DEST_COPY_TOO_SMALL;
    AWS_ERROR_LIST_EXCEEDS_MAX_SIZE               :: LIST_EXCEEDS_MAX_SIZE;
    AWS_ERROR_LIST_STATIC_MODE_CANT_SHRINK        :: LIST_STATIC_MODE_CANT_SHRINK;
    AWS_ERROR_PRIORITY_QUEUE_FULL                 :: PRIORITY_QUEUE_FULL;
    AWS_ERROR_PRIORITY_QUEUE_EMPTY                :: PRIORITY_QUEUE_EMPTY;
    AWS_ERROR_PRIORITY_QUEUE_BAD_NODE             :: PRIORITY_QUEUE_BAD_NODE;
    AWS_ERROR_HASHTBL_ITEM_NOT_FOUND              :: HASHTBL_ITEM_NOT_FOUND;
    AWS_ERROR_INVALID_DATE_STR                    :: INVALID_DATE_STR;
    AWS_ERROR_INVALID_ARGUMENT                    :: INVALID_ARGUMENT;
    AWS_ERROR_RANDOM_GEN_FAILED                   :: RANDOM_GEN_FAILED;
    AWS_ERROR_MALFORMED_INPUT_STRING              :: MALFORMED_INPUT_STRING;
    AWS_ERROR_UNIMPLEMENTED                       :: UNIMPLEMENTED;
    AWS_ERROR_INVALID_STATE                       :: INVALID_STATE;
    AWS_ERROR_ENVIRONMENT_GET                     :: ENVIRONMENT_GET;
    AWS_ERROR_ENVIRONMENT_SET                     :: ENVIRONMENT_SET;
    AWS_ERROR_ENVIRONMENT_UNSET                   :: ENVIRONMENT_UNSET;
    AWS_ERROR_STREAM_UNSEEKABLE                   :: STREAM_UNSEEKABLE;
    AWS_ERROR_NO_PERMISSION                       :: NO_PERMISSION;
    AWS_ERROR_FILE_INVALID_PATH                   :: FILE_INVALID_PATH;
    AWS_ERROR_MAX_FDS_EXCEEDED                    :: MAX_FDS_EXCEEDED;
    AWS_ERROR_SYS_CALL_FAILURE                    :: SYS_CALL_FAILURE;
    AWS_ERROR_C_STRING_BUFFER_NOT_NULL_TERMINATED :: C_STRING_BUFFER_NOT_NULL_TERMINATED;
    AWS_ERROR_STRING_MATCH_NOT_FOUND              :: STRING_MATCH_NOT_FOUND;
    AWS_ERROR_DIVIDE_BY_ZERO                      :: DIVIDE_BY_ZERO;
    AWS_ERROR_INVALID_FILE_HANDLE                 :: INVALID_FILE_HANDLE;
    AWS_ERROR_OPERATION_INTERUPTED                :: OPERATION_INTERUPTED;
    AWS_ERROR_DIRECTORY_NOT_EMPTY                 :: DIRECTORY_NOT_EMPTY;
    AWS_ERROR_PLATFORM_NOT_SUPPORTED              :: PLATFORM_NOT_SUPPORTED;
    AWS_ERROR_INVALID_UTF8                        :: INVALID_UTF8;
    AWS_ERROR_GET_HOME_DIRECTORY_FAILED           :: GET_HOME_DIRECTORY_FAILED;
    AWS_ERROR_INVALID_XML                         :: INVALID_XML;
    AWS_ERROR_FILE_OPEN_FAILURE                   :: FILE_OPEN_FAILURE;
    AWS_ERROR_FILE_READ_FAILURE                   :: FILE_READ_FAILURE;
    AWS_ERROR_FILE_WRITE_FAILURE                  :: FILE_WRITE_FAILURE;
    AWS_ERROR_END_COMMON_RANGE                    :: END_COMMON_RANGE;
}

/**
* struct aws_atomic_var represents an atomic variable - a value which can hold an integer or pointer
* that can be manipulated atomically. struct aws_atomic_vars should normally only be manipulated
* with atomics methods defined in this header.
*/
aws_atomic_var :: struct {
    value: *void;
}

/*
* This enumeration specifies the memory ordering properties requested for a particular
* atomic operation. The atomic operation may provide stricter ordering than requested.
* Note that, within a single thread, all operations are still sequenced (that is, a thread
* sees its own atomic writes and reads happening in program order, but other threads may
* disagree on this ordering).
*
* The behavior of these memory orderings are the same as in the C11 atomics API; however,
* we only implement a subset that can be portably implemented on the compilers we target.
*/
aws_memory_order :: enum s32 {
    relaxed :: 0;

    acquire :: 2;

    release :: 3;

    acq_rel :: 4;

    seq_cst :: 5;

    aws_memory_order_relaxed :: relaxed;

    aws_memory_order_acquire :: acquire;

    aws_memory_order_release :: release;

    aws_memory_order_acq_rel :: acq_rel;

    aws_memory_order_seq_cst :: seq_cst;
}

aws_atomic_impl_int_t :: u64;

aws_cpu_feature_name :: enum s32 {
    CLMUL      :: 0;
    SSE_4_1    :: 1;
    SSE_4_2    :: 2;
    AVX2       :: 3;
    AVX512     :: 4;
    ARM_CRC    :: 5;
    BMI2       :: 6;
    VPCLMULQDQ :: 7;
    ARM_PMULL  :: 8;
    ARM_CRYPTO :: 9;
    COUNT      :: 10;

    AWS_CPU_FEATURE_CLMUL      :: CLMUL;
    AWS_CPU_FEATURE_SSE_4_1    :: SSE_4_1;
    AWS_CPU_FEATURE_SSE_4_2    :: SSE_4_2;
    AWS_CPU_FEATURE_AVX2       :: AVX2;
    AWS_CPU_FEATURE_AVX512     :: AVX512;
    AWS_CPU_FEATURE_ARM_CRC    :: ARM_CRC;
    AWS_CPU_FEATURE_BMI2       :: BMI2;
    AWS_CPU_FEATURE_VPCLMULQDQ :: VPCLMULQDQ;
    AWS_CPU_FEATURE_ARM_PMULL  :: ARM_PMULL;
    AWS_CPU_FEATURE_ARM_CRYPTO :: ARM_CRYPTO;
    AWS_CPU_FEATURE_COUNT      :: COUNT;
}

s_mul_u32_saturating_fn_ptr: #type (a: u32, b: u32) -> u32 #c_call = null;

s_mul_u32_checked_fn_ptr: #type (a: u32, b: u32, r: *u32) -> s32 #c_call = null;

anon_enum_8 :: enum s32 {
    AWS_ARRAY_LIST_DEBUG_FILL :: 221;
}

aws_array_list :: struct {
    alloc:        *aws_allocator;
    current_size: u64;
    length:       u64;
    item_size:    u64;
    data:         *void;
}

/**
* Prototype for a comparator function for sorting elements.
*
* a and b should be cast to pointers to the element type held in the list
* before being dereferenced. The function should compare the elements and
* return a positive number if a > b, zero if a = b, and a negative number
* if a < b.
*/
aws_array_list_comparator_fn :: #type (a: *void, b: *void) -> s32 #c_call;

/**
* Represents a length-delimited binary string or buffer. If byte buffer points
* to constant memory or memory that should otherwise not be freed by this
* struct, set allocator to NULL and free function will be a no-op.
*
* This structure used to define the output for all functions that write to a buffer.
*
* Note that this structure allocates memory at the buffer pointer only. The
* struct itself does not get dynamically allocated and must be either
* maintained or copied to avoid losing access to the memory.
*/
aws_byte_buf :: struct {
    /* do not reorder this, this struct lines up nicely with windows buffer structures--saving us allocations.*/
    len:       u64;
    buffer:    *u8;
    capacity:  u64;
    allocator: *aws_allocator;
}

/**
* Represents a movable pointer within a larger binary string or buffer.
*
* This structure is used to define buffers for reading.
*/
aws_byte_cursor :: struct {
    /* do not reorder this, this struct lines up nicely with windows buffer structures--saving us allocations */
    len: u64;
    ptr: *u8;
}

/**
* Signature for function argument to trim APIs
*/
aws_byte_predicate_fn :: #type (value: u8) -> bool #c_call;

aws_string :: struct {
    allocator: *aws_allocator;

    /* size in bytes of `bytes` minus any null terminator.
    * NOTE: This is not the number of characters in the string. */
    len:       u64;

    /* give this a storage specifier for C++ purposes. It will likely be larger after init. */
    bytes:     [1] u8;
}

aws_wstring :: struct {
    allocator: *aws_allocator;

    /* number of characters in the string not including the null terminator. */
    len:       u64;

    /* give this a storage specifier for C++ purposes. It will likely be larger after init. */
    bytes:     [1] s16;
}

aws_thread_detach_state :: enum s32 {
    NOT_CREATED    :: 1;
    JOINABLE       :: 2;
    JOIN_COMPLETED :: 3;
    MANAGED        :: 4;

    AWS_THREAD_NOT_CREATED    :: NOT_CREATED;
    AWS_THREAD_JOINABLE       :: JOINABLE;
    AWS_THREAD_JOIN_COMPLETED :: JOIN_COMPLETED;
    AWS_THREAD_MANAGED        :: MANAGED;
}

/**
* Specifies the join strategy used on an aws_thread, which in turn controls whether or not a thread participates
* in the managed thread system.  The managed thread system provides logic to guarantee a join on all participating
* threads at the cost of laziness (the user cannot control when joins happen).
*
* Manual - thread does not participate in the managed thread system; any joins must be done by the user.  This
* is the default.  The user must call aws_thread_clean_up(), but only after any desired join operation has completed.
* Not doing so will cause the windows handle to leak.
*
* Managed - the managed thread system will automatically perform a join some time after the thread's run function
* has completed.  It is an error to call aws_thread_join on a thread configured with the managed join strategy.  The
* managed thread system will call aws_thread_clean_up() on the thread after the background join has completed.
*
* Additionally, an API exists, aws_thread_join_all_managed(), which blocks and returns when all outstanding threads
* with the managed strategy have fully joined.  This API is useful for tests (rather than waiting for many individual
* signals) and program shutdown or DLL unload.  This API is automatically invoked by the common library clean up
* function.  If the common library clean up is called from a managed thread, this will cause deadlock.
*
* Lazy thread joining is done only when threads finish their run function or when the user calls
* aws_thread_join_all_managed().  This means it may be a long time between thread function completion and the join
* being applied, but the queue of unjoined threads is always one or fewer so there is no critical resource
* backlog.
*
* Currently, only event loop group async cleanup and host resolver threads participate in the managed thread system.
* Additionally, event loop threads will increment and decrement the pending join count (they are manually joined
* internally) in order to have an accurate view of internal thread usage and also to prevent failure to release
* an event loop group fully from allowing aws_thread_join_all_managed() from running to completion when its
* intent is such that it should block instead.
*/
aws_thread_join_strategy :: enum s32 {
    MANUAL  :: 0;
    MANAGED :: 1;

    AWS_TJS_MANUAL  :: MANUAL;
    AWS_TJS_MANAGED :: MANAGED;
}

aws_thread_options :: struct {
    stack_size:    u64;

    /* default is -1. If you set this to anything >= 0, and the platform supports it, the thread will be pinned to
    * that cpu. Also, we assume you're doing this for memory throughput purposes. On unix systems,
    * If libnuma.so is available, upon the thread launching, the memory policy for that thread will be set to
    * allocate on the numa node that cpu-core is on.
    *
    * On windows, this will cause the thread affinity to be set, but currently we don't do anything to tell the OS
    * how to allocate memory on a node.
    *
    * On Apple and Android platforms, this setting doesn't do anything at all.
    */
    cpu_id:        s32;

    join_strategy: aws_thread_join_strategy;

    /**
    * Thread name, for debugging purpose.
    * The length should not exceed AWS_THREAD_NAME_RECOMMENDED_STRLEN(15)
    * if you want it to display properly on all platforms.
    */
    name:          aws_byte_cursor;
}

aws_thread_once :: union {
    ptr: *void;
}

aws_thread_id_t :: u32;

aws_thread :: struct {
    allocator:     *aws_allocator;
    detach_state:  aws_thread_detach_state;

    thread_handle: *void;

    thread_id:     aws_thread_id_t;
}

aws_thread_atexit_fn :: #type (user_data: *void) -> void #c_call;

/**
* Controls what log calls pass through the logger and what log calls get filtered out.
* If a log level has a value of X, then all log calls using a level <= X will appear, while
* those using a value > X will not occur.
*
* You can filter both dynamically (by setting the log level on the logger object) or statically
* (by defining AWS_STATIC_LOG_LEVEL to be an appropriate integer module-wide).  Statically filtered
* log calls will be completely compiled out but require a rebuild if you want to get more detail
* about what's happening.
*/
aws_log_level :: enum s32 {
    NONE  :: 0;
    FATAL :: 1;
    ERROR :: 2;
    WARN  :: 3;
    INFO  :: 4;
    DEBUG :: 5;
    TRACE :: 6;

    COUNT :: 7;

    AWS_LL_NONE  :: NONE;
    AWS_LL_FATAL :: FATAL;
    AWS_LL_ERROR :: ERROR;
    AWS_LL_WARN  :: WARN;
    AWS_LL_INFO  :: INFO;
    AWS_LL_DEBUG :: DEBUG;
    AWS_LL_TRACE :: TRACE;

    AWS_LL_COUNT :: COUNT;
}

/**
* Log subject is a way of designating the topic of logging.
*
* The general idea is to support a finer-grained approach to log level control.  The primary use case
* is for situations that require more detailed logging within a specific domain, where enabling that detail
* globally leads to an untenable flood of information.
*
* For example, enable TRACE logging for tls-related log statements (handshake binary payloads), but
* only WARN logging everywhere else (because http payloads would blow up the log files).
*
* Log subject is an enum similar to aws error: each library has its own value-space and someone is
* responsible for registering the value <-> string connections.
*/
aws_log_subject_t :: u32;

/* Each library gets space for 2^^10 log subject entries */
anon_enum_9 :: enum s32 {
    AWS_LOG_SUBJECT_STRIDE_BITS :: 10;
}

aws_log_subject_info :: struct {
    subject_id:          aws_log_subject_t;
    subject_name:        *u8;
    subject_description: *u8;
}

aws_log_subject_info_list :: struct {
    subject_list: *aws_log_subject_info;
    count:        u64;
}

aws_common_log_subject :: enum s32 {
    GENERAL        :: 0;
    TASK_SCHEDULER :: 1;
    THREAD         :: 2;
    MEMTRACE       :: 3;
    XML_PARSER     :: 4;
    IO             :: 5;
    BUS            :: 6;
    TEST           :: 7;
    JSON_PARSER    :: 8;

    LAST           :: 1023;

    AWS_LS_COMMON_GENERAL        :: GENERAL;
    AWS_LS_COMMON_TASK_SCHEDULER :: TASK_SCHEDULER;
    AWS_LS_COMMON_THREAD         :: THREAD;
    AWS_LS_COMMON_MEMTRACE       :: MEMTRACE;
    AWS_LS_COMMON_XML_PARSER     :: XML_PARSER;
    AWS_LS_COMMON_IO             :: IO;
    AWS_LS_COMMON_BUS            :: BUS;
    AWS_LS_COMMON_TEST           :: TEST;
    AWS_LS_COMMON_JSON_PARSER    :: JSON_PARSER;

    AWS_LS_COMMON_LAST           :: LAST;
}

aws_log_formatter :: struct {}
aws_log_channel :: struct {}
aws_log_writer :: struct {}

/**
* We separate the log level function from the log call itself so that we can do the filter check in the macros (see
* below)
*
* By doing so, we make it so that the variadic format arguments are not even evaluated if the filter check does not
* succeed.
*/
aws_logger_vtable :: struct {
    log:           #type (logger: *aws_logger, log_level: aws_log_level, subject: aws_log_subject_t, format: *u8, __args: ..Any) -> s32 #c_call;

    get_log_level: #type (logger: *aws_logger, subject: aws_log_subject_t) -> aws_log_level #c_call;
    clean_up:      #type (logger: *aws_logger) -> void #c_call;
    set_log_level: #type (logger: *aws_logger, unknown0: aws_log_level) -> s32 #c_call;
}

aws_logger :: struct {
    vtable:    *aws_logger_vtable;
    allocator: *aws_allocator;
    p_impl:    *void;
}

/*
* Standard logger implementation composing three sub-components:
*
* The formatter takes var args input from the user and produces a formatted log line
* The writer takes a formatted log line and outputs it somewhere
* The channel is the transport between the two
*/
aws_logger_pipeline :: struct {
    formatter: *aws_log_formatter;
    channel:   *aws_log_channel;
    writer:    *aws_log_writer;
    allocator: *aws_allocator;
    level:     aws_atomic_var;
}

/**
* Options for aws_logger_init_standard().
* Set `filename` to open a file for logging and close it when the logger cleans up.
* Set `file` to use a file that is already open, such as `stderr` or `stdout`.
*/
aws_logger_standard_options :: struct {
    level:    aws_log_level;
    filename: *u8;
    file:     *FILE;
}

/*
* Pipeline logger vtable for custom configurations
*/
g_pipeline_logger_owned_vtable: aws_logger_vtable;

smithy :: struct {
    components :: struct {
        tracing :: struct {
            /**
            * Status of the span.
            */
            TraceSpanStatus :: enum s32 {
                UNSET :: 0;
                OK    :: 1;
                FAULT :: 2;
            }

            /**
            * The basic unit of a "Trace". Represents a time period during which events
            * occur. Child spans and events can take place within trace. It is a hierarchy
            * and ledger of timing and events during a operation.
            */
            TraceSpan :: struct {
                vtable: *TraceSpan_VTable;
                m_name: Aws.String;
            }
            TraceSpan_VTable :: struct #type_info_none {
                Destructor: (this: *TraceSpan, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                emitEvent: (this: *TraceSpan, name: Aws.String, attributes: *std.map(Aws.String, Aws.String)) -> void #cpp_method;

                setAttribute: (this: *TraceSpan, key: Aws.String, value: Aws.String) -> void #cpp_method;

                setStatus: (this: *TraceSpan, status: TraceSpanStatus) -> void #cpp_method;

                end: (this: *TraceSpan) -> void #cpp_method;
            }

            TraceSpan_Destructor :: inline (this: *TraceSpan, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            TraceSpan_emitEvent :: inline (this: *TraceSpan, name: Aws.String, attributes: *std.map(Aws.String, Aws.String)) { this.vtable.emitEvent(this, name, attributes); }

            TraceSpan_setAttribute :: inline (this: *TraceSpan, key: Aws.String, value: Aws.String) { this.vtable.setAttribute(this, key, value); }

            TraceSpan_setStatus :: inline (this: *TraceSpan, status: TraceSpanStatus) { this.vtable.setStatus(this, status); }

            TraceSpan_end :: inline (this: *TraceSpan) { this.vtable.end(this); }

            vtable :: (obj: *TraceSpan) -> *TraceSpan_VTable { return obj.vtable; }


            /**
            * The kind of span being created.
            */
            SpanKind :: enum s32 {
                INTERNAL :: 0;
                CLIENT   :: 1;
                SERVER   :: 2;
            }

            /**
            * Entry point for creating a Span. Any new spans will
            * be created from this.
            */
            Tracer :: struct {
                vtable: *Tracer_VTable;
            }
            Tracer_VTable :: struct #type_info_none {
                Destructor: (this: *Tracer, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                CreateSpan: (this: *Tracer, name: Aws.String, attributes: *std.map(Aws.String, Aws.String), spanKind: SpanKind) -> std.shared_ptr(TraceSpan) #cpp_method;
            }

            Tracer_Destructor :: inline (this: *Tracer, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            Tracer_CreateSpan :: inline (this: *Tracer, name: Aws.String, attributes: *std.map(Aws.String, Aws.String), spanKind: SpanKind) -> std.shared_ptr(TraceSpan) { return this.vtable.CreateSpan(this, name, attributes, spanKind); }

            vtable :: (obj: *Tracer) -> *Tracer_VTable { return obj.vtable; }


            /**
            * Entry point for creating Tracer instances.
            */
            TracerProvider :: struct {
                vtable: *TracerProvider_VTable;
            }
            TracerProvider_VTable :: struct #type_info_none {
                Destructor: (this: *TracerProvider, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                GetTracer: (this: *TracerProvider, scope: Aws.String, attributes: *std.map(Aws.String, Aws.String)) -> std.shared_ptr(Tracer) #cpp_method;
            }

            TracerProvider_Destructor :: inline (this: *TracerProvider, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            TracerProvider_GetTracer :: inline (this: *TracerProvider, scope: Aws.String, attributes: *std.map(Aws.String, Aws.String)) -> std.shared_ptr(Tracer) { return this.vtable.GetTracer(this, scope, attributes); }

            vtable :: (obj: *TracerProvider) -> *TracerProvider_VTable { return obj.vtable; }


            /**
            * A container that starts a async measurement
            * that has virtual function to stop it.
            */
            GaugeHandle :: struct {
                vtable: *GaugeHandle_VTable;
            }
            GaugeHandle_VTable :: struct #type_info_none {
                Destructor: (this: *GaugeHandle, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                Stop: (this: *GaugeHandle) -> void #cpp_method;
            }

            GaugeHandle_Destructor :: inline (this: *GaugeHandle, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            GaugeHandle_Stop :: inline (this: *GaugeHandle) { this.vtable.Stop(this); }

            vtable :: (obj: *GaugeHandle) -> *GaugeHandle_VTable { return obj.vtable; }


            /**
            * Measures the current instantaneous value. Is used in
            * the implementation of a gauge handle to take an actual
            * measurement.
            */
            AsyncMeasurement :: struct {
                vtable: *AsyncMeasurement_VTable;
            }
            AsyncMeasurement_VTable :: struct #type_info_none {
                Destructor: (this: *AsyncMeasurement, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                Record: (this: *AsyncMeasurement, value: float64, attributes: *std.map(Aws.String, Aws.String)) -> void #cpp_method;
            }

            AsyncMeasurement_Destructor :: inline (this: *AsyncMeasurement, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            AsyncMeasurement_Record :: inline (this: *AsyncMeasurement, value: float64, attributes: *std.map(Aws.String, Aws.String)) { this.vtable.Record(this, value, attributes); }

            vtable :: (obj: *AsyncMeasurement) -> *AsyncMeasurement_VTable { return obj.vtable; }


            /**
            * Measures a value that only ever increases.
            */
            MonotonicCounter :: struct {
                vtable: *MonotonicCounter_VTable;
            }
            MonotonicCounter_VTable :: struct #type_info_none {
                Destructor: (this: *MonotonicCounter, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                add: (this: *MonotonicCounter, value: s32, attributes: std.map(Aws.String, Aws.String)) -> void #cpp_method;
            }

            MonotonicCounter_Destructor :: inline (this: *MonotonicCounter, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            MonotonicCounter_add :: inline (this: *MonotonicCounter, value: s32, attributes: std.map(Aws.String, Aws.String)) { this.vtable.add(this, value, attributes); }

            vtable :: (obj: *MonotonicCounter) -> *MonotonicCounter_VTable { return obj.vtable; }


            /**
            * Measures a value that goes up or down.
            */
            UpDownCounter :: struct {
                vtable: *UpDownCounter_VTable;
            }
            UpDownCounter_VTable :: struct #type_info_none {
                Destructor: (this: *UpDownCounter, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                add: (this: *UpDownCounter, value: s32, attributes: std.map(Aws.String, Aws.String)) -> void #cpp_method;
            }

            UpDownCounter_Destructor :: inline (this: *UpDownCounter, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            UpDownCounter_add :: inline (this: *UpDownCounter, value: s32, attributes: std.map(Aws.String, Aws.String)) { this.vtable.add(this, value, attributes); }

            vtable :: (obj: *UpDownCounter) -> *UpDownCounter_VTable { return obj.vtable; }


            /**
            * Measures a value where the statistics are likely meaningful.
            */
            Histogram :: struct {
                vtable: *Histogram_VTable;
            }
            Histogram_VTable :: struct #type_info_none {
                Destructor: (this: *Histogram, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                record: (this: *Histogram, value: float64, attributes: std.map(Aws.String, Aws.String)) -> void #cpp_method;
            }

            Histogram_Destructor :: inline (this: *Histogram, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            Histogram_record :: inline (this: *Histogram, value: float64, attributes: std.map(Aws.String, Aws.String)) { this.vtable.record(this, value, attributes); }

            vtable :: (obj: *Histogram) -> *Histogram_VTable { return obj.vtable; }


            /**
            * Entry point to creating instruments. An Instrument is responsible for taking measurements.
            * The returned entities will be responsible for taking measurements directly in code.
            */
            Meter :: struct {
                vtable: *Meter_VTable;
            }
            Meter_VTable :: struct #type_info_none {
                Destructor: (this: *Meter, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                CreateGauge: (this: *Meter, name: Aws.String, callback: std.function(#type (unknown0: std.unique_ptr(AsyncMeasurement)) -> void #c_call), units: Aws.String, description: Aws.String) -> std.unique_ptr(GaugeHandle) #cpp_method;

                CreateUpDownCounter: (this: *Meter, name: Aws.String, units: Aws.String, description: Aws.String) -> std.unique_ptr(UpDownCounter) #cpp_method;

                CreateCounter: (this: *Meter, name: Aws.String, units: Aws.String, description: Aws.String) -> std.unique_ptr(MonotonicCounter) #cpp_method;

                CreateHistogram: (this: *Meter, name: Aws.String, units: Aws.String, description: Aws.String) -> std.unique_ptr(Histogram) #cpp_method;
            }

            Meter_Destructor :: inline (this: *Meter, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            Meter_CreateGauge :: inline (this: *Meter, name: Aws.String, callback: std.function(#type (unknown0: std.unique_ptr(AsyncMeasurement)) -> void #c_call), units: Aws.String, description: Aws.String) -> std.unique_ptr(GaugeHandle) { return this.vtable.CreateGauge(this, name, callback, units, description); }

            Meter_CreateUpDownCounter :: inline (this: *Meter, name: Aws.String, units: Aws.String, description: Aws.String) -> std.unique_ptr(UpDownCounter) { return this.vtable.CreateUpDownCounter(this, name, units, description); }

            Meter_CreateCounter :: inline (this: *Meter, name: Aws.String, units: Aws.String, description: Aws.String) -> std.unique_ptr(MonotonicCounter) { return this.vtable.CreateCounter(this, name, units, description); }

            Meter_CreateHistogram :: inline (this: *Meter, name: Aws.String, units: Aws.String, description: Aws.String) -> std.unique_ptr(Histogram) { return this.vtable.CreateHistogram(this, name, units, description); }

            vtable :: (obj: *Meter) -> *Meter_VTable { return obj.vtable; }


            /**
            * Entry point for metrics emission API. Will return a meter which in turn
            * can provide specific metric taking instruments.
            */
            MeterProvider :: struct {
                vtable: *MeterProvider_VTable;
            }
            MeterProvider_VTable :: struct #type_info_none {
                Destructor: (this: *MeterProvider, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

                GetMeter: (this: *MeterProvider, scope: Aws.String, attributes: std.map(Aws.String, Aws.String)) -> std.shared_ptr(Meter) #cpp_method;
            }

            MeterProvider_Destructor :: inline (this: *MeterProvider, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            MeterProvider_GetMeter :: inline (this: *MeterProvider, scope: Aws.String, attributes: std.map(Aws.String, Aws.String)) -> std.shared_ptr(Meter) { return this.vtable.GetMeter(this, scope, attributes); }

            vtable :: (obj: *MeterProvider) -> *MeterProvider_VTable { return obj.vtable; }


            /**
            * A Utility holder class that manages the creation and
            * management of telemetry related operations.
            */
            TelemetryProvider :: struct {
                vtable: *TelemetryProvider_VTable;
                /**
                * Returns a reference to a Tracer used to create spans.
                *
                * @param scope The scope of the Tracer that is being used.
                * @param attributes the attributes or dimensions associate with this measurement.
                * @return A reference to a Tracer instance.
                */
                getTracer :: (this: *TelemetryProvider, scope: Aws.String, attributes: *std.map(Aws.String, Aws.String)) -> std.shared_ptr(Tracer) #cpp_method #foreign aws_cpp_sdk_s3 "?getTracer@TelemetryProvider@tracing@components@smithy@@QEAA?AV?$shared_ptr@VTracer@tracing@components@smithy@@@std@@V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@6@AEBV?$map@V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@V12@U?$less@V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@@2@V?$allocator@U?$pair@$$CBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@V12@@std@@@2@@6@@Z";
                getTracer :: (this: *TelemetryProvider, scope: Aws.String, attributes: std.map(Aws.String, Aws.String)) -> std.shared_ptr(Tracer) #no_context {
                    return getTracer(this, scope, *attributes);
                }

                /**
                * Returns a reference to a Meter used to create metrics.
                *
                * @param scope The scope of the Meter that is being used.
                * @param attributes the attributes or dimensions associate with this measurement.
                * @return A reference to a Meter instance.
                */
                getMeter :: (this: *TelemetryProvider, scope: Aws.String, attributes: *std.map(Aws.String, Aws.String)) -> std.shared_ptr(Meter) #cpp_method #foreign aws_cpp_sdk_s3 "?getMeter@TelemetryProvider@tracing@components@smithy@@QEAA?AV?$shared_ptr@VMeter@tracing@components@smithy@@@std@@V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@6@AEBV?$map@V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@V12@U?$less@V?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@@2@V?$allocator@U?$pair@$$CBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@V12@@std@@@2@@6@@Z";
                getMeter :: (this: *TelemetryProvider, scope: Aws.String, attributes: std.map(Aws.String, Aws.String)) -> std.shared_ptr(Meter) #no_context {
                    return getMeter(this, scope, *attributes);
                }

                m_initFlag:       std.once_flag;
                m_shutdownFlag:   std.once_flag;
                m_tracerProvider: std.unique_ptr(TracerProvider);
                m_meterProvider:  std.unique_ptr(MeterProvider);
                m_init:           std.function(#type () -> void #c_call);
                m_shutdown:       std.function(#type () -> void #c_call);
            }
            TelemetryProvider_VTable :: struct #type_info_none {
                Destructor: (this: *TelemetryProvider, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;
            }
            TelemetryProvider_Destructor :: inline (this: *TelemetryProvider, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

            vtable :: (obj: *TelemetryProvider) -> *TelemetryProvider_VTable { return obj.vtable; }


            /**
            * A no-op implementation of TraceSpan that is pass through.
            */
            NoopTracerSpan :: struct {
                #as using tracespan: TraceSpan;
            }

            /**
            * A no-op implementation of Tracer that is pass through.
            */
            NoopTracer :: struct {
                #as using tracer: Tracer;
            }

            /**
            * A no-op implementation of NoopTracerProvider that is pass through.
            */
            NoopTracerProvider :: struct {
                #as using tracerprovider: TracerProvider;

                m_tracer: std.shared_ptr(NoopTracer);
            }

            /**
            * A no-op implementation of the Gauge handle that
            * is simply pass though
            */
            NoopGaugeHandle :: struct {
                #as using gaugehandle: GaugeHandle;
            }

            /**
            * A no-op implementation of the UpDownCounter that
            * is simply pass though
            */
            NoopUpDownCounter :: struct {
                #as using updowncounter: UpDownCounter;
            }

            /**
            * A no-op implementation of the MonotonicCounter that
            * is simply pass though
            */
            NoopMonotonicCounter :: struct {
                #as using monotoniccounter: MonotonicCounter;
            }

            /**
            * A no-op implementation of the Histogram that
            * is simply pass though
            */
            NoopHistogram :: struct {
                #as using histogram: Histogram;
            }

            /**
            * A no-op implementation of the Meter that
            * is simply pass though
            */
            NoopMeter :: struct {
                #as using meter: Meter;
            }

            /**
            * A no-op implementation of the MeterProvider that
            * is simply pass though
            */
            NoopMeterProvider :: struct {
                #as using meterprovider: MeterProvider;
            }

            /**
            * A no-op implementation of TelemetryProvider that
            * is simply pass though container of telemetry functionality
            */
            NoopTelemetryProvider :: struct {
                __empty_struct_padding: u8; // C++ makes empty structs have length 1
            }
        }
    }
}

iostream_outcome :: Aws.Utils.Outcome(std.shared_ptr(Aws.IOStream), bool);

/* The cJSON structure: */
cJSON :: struct {
    /* next/prev allow you to walk array/object chains. Alternatively, use GetArraySize/GetArrayItem/GetObjectItem */
    next:        *cJSON;
    prev:        *cJSON;

    /* An array or object item will have a child pointer pointing to a chain of the items in the array/object. */
    child:       *cJSON;

    /* The type of the item, as above. */
    type:        s32;

    /* The item's string, if type==cJSON_AS4CPP_String  and type == cJSON_AS4CPP_Raw */
    valuestring: *u8;

    /* writing to valueint is DEPRECATED, use cJSON_AS4CPP_SetNumberValue instead */
    valueint:    s32;

    /* The item's number, if type==cJSON_AS4CPP_Number */
    valuedouble: float64;

    /* The item's name string, if this item is the child of, or is in the list of subitems of an object. */
    _string:     *u8;
}

cJSON_AS4CPP_Hooks :: struct {
    /* malloc/free are CDECL on Windows regardless of the default calling convention of the compiler, so ensure the hooks allow passing those functions directly. */
    malloc_fn: #type (sz: u64) -> *void #c_call;
    free_fn:   #type (ptr: *void) -> void #c_call;
}

cJSON_AS4CPP_bool :: s32;

aws_linked_list_node :: struct {
    next: *aws_linked_list_node;
    prev: *aws_linked_list_node;
}

aws_linked_list :: struct {
    head: aws_linked_list_node;
    tail: aws_linked_list_node;
}

aws_io_handle :: struct {
    data:            union {
        fd:     s32;
        handle: *void;
    };

    additional_data: *void;
}

aws_io_message_type :: enum s32 {
    AWS_IO_MESSAGE_APPLICATION_DATA :: 0;
}

aws_channel :: struct {}

aws_channel_on_message_write_completed_fn :: #type (channel: *aws_channel, message: *aws_io_message, err_code: s32, user_data: *void) -> void #c_call;

aws_io_message :: struct {
    /**
    * Allocator used for the message and message data. If this is null, the message belongs to a pool or some other
    * message manager.
    */
    allocator:       *aws_allocator;

    /**
    * Buffer containing the data for message
    */
    message_data:    aws_byte_buf;

    /**
    * type of the message. This is used for framework control messages. Currently the only type is
    * AWS_IO_MESSAGE_APPLICATION_DATA
    */
    message_type:    aws_io_message_type;

    /**
    * Conveys information about the contents of message_data (e.g. cast the ptr to some type). If 0, it's just opaque
    * data.
    */
    message_tag:     s32;

    /**
    * In order to avoid excess allocations/copies, on a partial read or write, the copy mark is set to indicate how
    * much of this message has already been processed or copied.
    */
    copy_mark:       u64;

    /**
    * The channel that the message is bound to.
    */
    owning_channel:  *aws_channel;

    /**
    * Invoked by the channel once the entire message has been written to the data sink.
    */
    on_completion:   aws_channel_on_message_write_completed_fn;

    /**
    * arbitrary user data for the on_completion callback
    */
    user_data:       *void;

    /** it's incredibly likely something is going to need to queue this,
    * go ahead and make sure the list info is part of the original allocation.
    */
    queueing_handle: aws_linked_list_node;
}

aws_io_clock_fn :: #type (timestamp: *u64) -> s32 #c_call;

aws_io_errors :: enum s32 {
    AWS_IO_CHANNEL_ERROR_ERROR_CANT_ACCEPT_INPUT          :: 1024;
    AWS_IO_CHANNEL_UNKNOWN_MESSAGE_TYPE                   :: 1025;
    AWS_IO_CHANNEL_READ_WOULD_EXCEED_WINDOW               :: 1026;
    AWS_IO_EVENT_LOOP_ALREADY_ASSIGNED                    :: 1027;
    AWS_IO_EVENT_LOOP_SHUTDOWN                            :: 1028;
    AWS_IO_TLS_ERROR_NEGOTIATION_FAILURE                  :: 1029;
    AWS_IO_TLS_ERROR_NOT_NEGOTIATED                       :: 1030;
    AWS_IO_TLS_ERROR_WRITE_FAILURE                        :: 1031;
    AWS_IO_TLS_ERROR_ALERT_RECEIVED                       :: 1032;
    AWS_IO_TLS_CTX_ERROR                                  :: 1033;
    AWS_IO_TLS_VERSION_UNSUPPORTED                        :: 1034;
    AWS_IO_TLS_CIPHER_PREF_UNSUPPORTED                    :: 1035;
    AWS_IO_MISSING_ALPN_MESSAGE                           :: 1036;
    AWS_IO_UNHANDLED_ALPN_PROTOCOL_MESSAGE                :: 1037;
    AWS_IO_FILE_VALIDATION_FAILURE                        :: 1038;
    AWS_ERROR_IO_EVENT_LOOP_THREAD_ONLY                   :: 1039;
    AWS_ERROR_IO_ALREADY_SUBSCRIBED                       :: 1040;
    AWS_ERROR_IO_NOT_SUBSCRIBED                           :: 1041;
    AWS_ERROR_IO_OPERATION_CANCELLED                      :: 1042;
    AWS_IO_READ_WOULD_BLOCK                               :: 1043;
    AWS_IO_BROKEN_PIPE                                    :: 1044;
    AWS_IO_SOCKET_UNSUPPORTED_ADDRESS_FAMILY              :: 1045;
    AWS_IO_SOCKET_INVALID_OPERATION_FOR_TYPE              :: 1046;
    AWS_IO_SOCKET_CONNECTION_REFUSED                      :: 1047;
    AWS_IO_SOCKET_TIMEOUT                                 :: 1048;
    AWS_IO_SOCKET_NO_ROUTE_TO_HOST                        :: 1049;
    AWS_IO_SOCKET_NETWORK_DOWN                            :: 1050;
    AWS_IO_SOCKET_CLOSED                                  :: 1051;
    AWS_IO_SOCKET_NOT_CONNECTED                           :: 1052;
    AWS_IO_SOCKET_INVALID_OPTIONS                         :: 1053;
    AWS_IO_SOCKET_ADDRESS_IN_USE                          :: 1054;
    AWS_IO_SOCKET_INVALID_ADDRESS                         :: 1055;
    AWS_IO_SOCKET_ILLEGAL_OPERATION_FOR_STATE             :: 1056;
    AWS_IO_SOCKET_CONNECT_ABORTED                         :: 1057;
    AWS_IO_DNS_QUERY_FAILED                               :: 1058;
    AWS_IO_DNS_INVALID_NAME                               :: 1059;
    AWS_IO_DNS_NO_ADDRESS_FOR_HOST                        :: 1060;
    AWS_IO_DNS_HOST_REMOVED_FROM_CACHE                    :: 1061;
    AWS_IO_STREAM_INVALID_SEEK_POSITION                   :: 1062;
    AWS_IO_STREAM_READ_FAILED                             :: 1063;
    DEPRECATED_AWS_IO_INVALID_FILE_HANDLE                 :: 1064;
    AWS_IO_SHARED_LIBRARY_LOAD_FAILURE                    :: 1065;
    AWS_IO_SHARED_LIBRARY_FIND_SYMBOL_FAILURE             :: 1066;
    AWS_IO_TLS_NEGOTIATION_TIMEOUT                        :: 1067;
    AWS_IO_TLS_ALERT_NOT_GRACEFUL                         :: 1068;
    AWS_IO_MAX_RETRIES_EXCEEDED                           :: 1069;
    AWS_IO_RETRY_PERMISSION_DENIED                        :: 1070;
    AWS_IO_TLS_DIGEST_ALGORITHM_UNSUPPORTED               :: 1071;
    AWS_IO_TLS_SIGNATURE_ALGORITHM_UNSUPPORTED            :: 1072;

    AWS_ERROR_PKCS11_VERSION_UNSUPPORTED                  :: 1073;
    AWS_ERROR_PKCS11_TOKEN_NOT_FOUND                      :: 1074;
    AWS_ERROR_PKCS11_KEY_NOT_FOUND                        :: 1075;
    AWS_ERROR_PKCS11_KEY_TYPE_UNSUPPORTED                 :: 1076;
    AWS_ERROR_PKCS11_UNKNOWN_CRYPTOKI_RETURN_VALUE        :: 1077;

    AWS_ERROR_PKCS11_CKR_CANCEL                           :: 1078;
    AWS_ERROR_PKCS11_CKR_HOST_MEMORY                      :: 1079;
    AWS_ERROR_PKCS11_CKR_SLOT_ID_INVALID                  :: 1080;
    AWS_ERROR_PKCS11_CKR_GENERAL_ERROR                    :: 1081;
    AWS_ERROR_PKCS11_CKR_FUNCTION_FAILED                  :: 1082;
    AWS_ERROR_PKCS11_CKR_ARGUMENTS_BAD                    :: 1083;
    AWS_ERROR_PKCS11_CKR_NO_EVENT                         :: 1084;
    AWS_ERROR_PKCS11_CKR_NEED_TO_CREATE_THREADS           :: 1085;
    AWS_ERROR_PKCS11_CKR_CANT_LOCK                        :: 1086;
    AWS_ERROR_PKCS11_CKR_ATTRIBUTE_READ_ONLY              :: 1087;
    AWS_ERROR_PKCS11_CKR_ATTRIBUTE_SENSITIVE              :: 1088;
    AWS_ERROR_PKCS11_CKR_ATTRIBUTE_TYPE_INVALID           :: 1089;
    AWS_ERROR_PKCS11_CKR_ATTRIBUTE_VALUE_INVALID          :: 1090;
    AWS_ERROR_PKCS11_CKR_ACTION_PROHIBITED                :: 1091;
    AWS_ERROR_PKCS11_CKR_DATA_INVALID                     :: 1092;
    AWS_ERROR_PKCS11_CKR_DATA_LEN_RANGE                   :: 1093;
    AWS_ERROR_PKCS11_CKR_DEVICE_ERROR                     :: 1094;
    AWS_ERROR_PKCS11_CKR_DEVICE_MEMORY                    :: 1095;
    AWS_ERROR_PKCS11_CKR_DEVICE_REMOVED                   :: 1096;
    AWS_ERROR_PKCS11_CKR_ENCRYPTED_DATA_INVALID           :: 1097;
    AWS_ERROR_PKCS11_CKR_ENCRYPTED_DATA_LEN_RANGE         :: 1098;
    AWS_ERROR_PKCS11_CKR_FUNCTION_CANCELED                :: 1099;
    AWS_ERROR_PKCS11_CKR_FUNCTION_NOT_PARALLEL            :: 1100;
    AWS_ERROR_PKCS11_CKR_FUNCTION_NOT_SUPPORTED           :: 1101;
    AWS_ERROR_PKCS11_CKR_KEY_HANDLE_INVALID               :: 1102;
    AWS_ERROR_PKCS11_CKR_KEY_SIZE_RANGE                   :: 1103;
    AWS_ERROR_PKCS11_CKR_KEY_TYPE_INCONSISTENT            :: 1104;
    AWS_ERROR_PKCS11_CKR_KEY_NOT_NEEDED                   :: 1105;
    AWS_ERROR_PKCS11_CKR_KEY_CHANGED                      :: 1106;
    AWS_ERROR_PKCS11_CKR_KEY_NEEDED                       :: 1107;
    AWS_ERROR_PKCS11_CKR_KEY_INDIGESTIBLE                 :: 1108;
    AWS_ERROR_PKCS11_CKR_KEY_FUNCTION_NOT_PERMITTED       :: 1109;
    AWS_ERROR_PKCS11_CKR_KEY_NOT_WRAPPABLE                :: 1110;
    AWS_ERROR_PKCS11_CKR_KEY_UNEXTRACTABLE                :: 1111;
    AWS_ERROR_PKCS11_CKR_MECHANISM_INVALID                :: 1112;
    AWS_ERROR_PKCS11_CKR_MECHANISM_PARAM_INVALID          :: 1113;
    AWS_ERROR_PKCS11_CKR_OBJECT_HANDLE_INVALID            :: 1114;
    AWS_ERROR_PKCS11_CKR_OPERATION_ACTIVE                 :: 1115;
    AWS_ERROR_PKCS11_CKR_OPERATION_NOT_INITIALIZED        :: 1116;
    AWS_ERROR_PKCS11_CKR_PIN_INCORRECT                    :: 1117;
    AWS_ERROR_PKCS11_CKR_PIN_INVALID                      :: 1118;
    AWS_ERROR_PKCS11_CKR_PIN_LEN_RANGE                    :: 1119;
    AWS_ERROR_PKCS11_CKR_PIN_EXPIRED                      :: 1120;
    AWS_ERROR_PKCS11_CKR_PIN_LOCKED                       :: 1121;
    AWS_ERROR_PKCS11_CKR_SESSION_CLOSED                   :: 1122;
    AWS_ERROR_PKCS11_CKR_SESSION_COUNT                    :: 1123;
    AWS_ERROR_PKCS11_CKR_SESSION_HANDLE_INVALID           :: 1124;
    AWS_ERROR_PKCS11_CKR_SESSION_PARALLEL_NOT_SUPPORTED   :: 1125;
    AWS_ERROR_PKCS11_CKR_SESSION_READ_ONLY                :: 1126;
    AWS_ERROR_PKCS11_CKR_SESSION_EXISTS                   :: 1127;
    AWS_ERROR_PKCS11_CKR_SESSION_READ_ONLY_EXISTS         :: 1128;
    AWS_ERROR_PKCS11_CKR_SESSION_READ_WRITE_SO_EXISTS     :: 1129;
    AWS_ERROR_PKCS11_CKR_SIGNATURE_INVALID                :: 1130;
    AWS_ERROR_PKCS11_CKR_SIGNATURE_LEN_RANGE              :: 1131;
    AWS_ERROR_PKCS11_CKR_TEMPLATE_INCOMPLETE              :: 1132;
    AWS_ERROR_PKCS11_CKR_TEMPLATE_INCONSISTENT            :: 1133;
    AWS_ERROR_PKCS11_CKR_TOKEN_NOT_PRESENT                :: 1134;
    AWS_ERROR_PKCS11_CKR_TOKEN_NOT_RECOGNIZED             :: 1135;
    AWS_ERROR_PKCS11_CKR_TOKEN_WRITE_PROTECTED            :: 1136;
    AWS_ERROR_PKCS11_CKR_UNWRAPPING_KEY_HANDLE_INVALID    :: 1137;
    AWS_ERROR_PKCS11_CKR_UNWRAPPING_KEY_SIZE_RANGE        :: 1138;
    AWS_ERROR_PKCS11_CKR_UNWRAPPING_KEY_TYPE_INCONSISTENT :: 1139;
    AWS_ERROR_PKCS11_CKR_USER_ALREADY_LOGGED_IN           :: 1140;
    AWS_ERROR_PKCS11_CKR_USER_NOT_LOGGED_IN               :: 1141;
    AWS_ERROR_PKCS11_CKR_USER_PIN_NOT_INITIALIZED         :: 1142;
    AWS_ERROR_PKCS11_CKR_USER_TYPE_INVALID                :: 1143;
    AWS_ERROR_PKCS11_CKR_USER_ANOTHER_ALREADY_LOGGED_IN   :: 1144;
    AWS_ERROR_PKCS11_CKR_USER_TOO_MANY_TYPES              :: 1145;
    AWS_ERROR_PKCS11_CKR_WRAPPED_KEY_INVALID              :: 1146;
    AWS_ERROR_PKCS11_CKR_WRAPPED_KEY_LEN_RANGE            :: 1147;
    AWS_ERROR_PKCS11_CKR_WRAPPING_KEY_HANDLE_INVALID      :: 1148;
    AWS_ERROR_PKCS11_CKR_WRAPPING_KEY_SIZE_RANGE          :: 1149;
    AWS_ERROR_PKCS11_CKR_WRAPPING_KEY_TYPE_INCONSISTENT   :: 1150;
    AWS_ERROR_PKCS11_CKR_RANDOM_SEED_NOT_SUPPORTED        :: 1151;
    AWS_ERROR_PKCS11_CKR_RANDOM_NO_RNG                    :: 1152;
    AWS_ERROR_PKCS11_CKR_DOMAIN_PARAMS_INVALID            :: 1153;
    AWS_ERROR_PKCS11_CKR_CURVE_NOT_SUPPORTED              :: 1154;
    AWS_ERROR_PKCS11_CKR_BUFFER_TOO_SMALL                 :: 1155;
    AWS_ERROR_PKCS11_CKR_SAVED_STATE_INVALID              :: 1156;
    AWS_ERROR_PKCS11_CKR_INFORMATION_SENSITIVE            :: 1157;
    AWS_ERROR_PKCS11_CKR_STATE_UNSAVEABLE                 :: 1158;
    AWS_ERROR_PKCS11_CKR_CRYPTOKI_NOT_INITIALIZED         :: 1159;
    AWS_ERROR_PKCS11_CKR_CRYPTOKI_ALREADY_INITIALIZED     :: 1160;
    AWS_ERROR_PKCS11_CKR_MUTEX_BAD                        :: 1161;
    AWS_ERROR_PKCS11_CKR_MUTEX_NOT_LOCKED                 :: 1162;
    AWS_ERROR_PKCS11_CKR_NEW_PIN_MODE                     :: 1163;
    AWS_ERROR_PKCS11_CKR_NEXT_OTP                         :: 1164;
    AWS_ERROR_PKCS11_CKR_EXCEEDED_MAX_ITERATIONS          :: 1165;
    AWS_ERROR_PKCS11_CKR_FIPS_SELF_TEST_FAILED            :: 1166;
    AWS_ERROR_PKCS11_CKR_LIBRARY_LOAD_FAILED              :: 1167;
    AWS_ERROR_PKCS11_CKR_PIN_TOO_WEAK                     :: 1168;
    AWS_ERROR_PKCS11_CKR_PUBLIC_KEY_INVALID               :: 1169;
    AWS_ERROR_PKCS11_CKR_FUNCTION_REJECTED                :: 1170;

    AWS_ERROR_IO_PINNED_EVENT_LOOP_MISMATCH               :: 1171;

    AWS_ERROR_PKCS11_ENCODING_ERROR                       :: 1172;
    AWS_IO_TLS_ERROR_DEFAULT_TRUST_STORE_NOT_FOUND        :: 1173;

    AWS_IO_STREAM_SEEK_FAILED                             :: 1174;
    AWS_IO_STREAM_GET_LENGTH_FAILED                       :: 1175;
    AWS_IO_STREAM_SEEK_UNSUPPORTED                        :: 1176;
    AWS_IO_STREAM_GET_LENGTH_UNSUPPORTED                  :: 1177;

    AWS_IO_TLS_ERROR_READ_FAILURE                         :: 1178;

    AWS_ERROR_PEM_MALFORMED                               :: 1179;

    AWS_IO_ERROR_END_RANGE                                :: 2047;
    AWS_IO_INVALID_FILE_HANDLE                            :: 50;
}

aws_crt_statistics_category_t :: u32;

/* Each library gets space for 2^^8 category entries */
anon_enum_11 :: enum s32 {
    AWS_CRT_STATISTICS_CATEGORY_STRIDE_BITS :: 8;
}

/**
* The common-specific range of the aws_crt_statistics_category cross-library enum.
*
* This enum functions as an RTTI value that lets statistics handler's interpret (via cast) a
* specific statistics structure if the RTTI value is understood.
*
* Common doesn't have any statistics structures presently, so its range is essentially empty.
*
*/
aws_crt_common_statistics_category :: enum s32 {
    AWSCRT_STAT_CAT_INVALID :: 0;
}

/**
* Pattern-struct that functions as a base "class" for all statistics structures.  To conform
* to the pattern, a statistics structure must have its first member be the category.  In that
* case it becomes "safe" to cast from aws_crt_statistics_base to the specific statistics structure
* based on the category value.
*/
aws_crt_statistics_base :: struct {
    category: aws_crt_statistics_category_t;
}

/**
* The start and end time, in milliseconds-since-epoch, that a set of statistics was gathered over.
*/
aws_crt_statistics_sample_interval :: struct {
    begin_time_ms: u64;
    end_time_ms:   u64;
}

/*
* Statistics intake function.  The array_list is a list of pointers to aws_crt_statistics_base "derived" (via
* pattern) objects.  The handler should iterate the list and downcast elements whose RTTI category it understands,
* while skipping those it does not understand.
*/
aws_crt_statistics_handler_process_statistics_fn :: #type (handler: *aws_crt_statistics_handler, interval: *aws_crt_statistics_sample_interval, stats: *aws_array_list, _context: *void) -> void #c_call;

/*
* Destroys a statistics handler implementation
*/
aws_crt_statistics_handler_destroy_fn :: #type (handler: *aws_crt_statistics_handler) -> void #c_call;

/*
* The period, in milliseconds, that the handler would like to be informed of statistics.  Statistics generators are
* not required to honor this value, but should if able.
*/
aws_crt_statistics_handler_get_report_interval_ms_fn :: #type (unknown0: *aws_crt_statistics_handler) -> u64 #c_call;

/**
* Vtable for functions that all statistics handlers must implement
*/
aws_crt_statistics_handler_vtable :: struct {
    process_statistics:     aws_crt_statistics_handler_process_statistics_fn;
    destroy:                aws_crt_statistics_handler_destroy_fn;
    get_report_interval_ms: aws_crt_statistics_handler_get_report_interval_ms_fn;
}

/**
* Base structure for all statistics handler implementations.
*
* A statistics handler is an object that listens to a stream of polymorphic (via the category RTTI enum) statistics
* structures emitted from some arbitrary source.  In the initial implementation, statistics handlers are primarily
* attached to channels, where they monitor IO throughput and state data (from channel handlers) to determine a
* connection's health.
*
* Statistics handlers are a generalization of the timeout and bandwidth filters that are often associated with
* SDK network connections.  Configurable, default implementations are defined at the protocol level (http, etc...)
* where they can be attached at connection (channel) creation time.
*/
aws_crt_statistics_handler :: struct {
    vtable:    *aws_crt_statistics_handler_vtable;
    allocator: *aws_allocator;
    impl:      *void;
}

/* The comparator should return a positive value if the second argument has a
* higher priority than the first; Otherwise, it should return a negative value
* or zero. NOTE: priority_queue pops its highest priority element first. For
* example: int cmp(const void *a, const void *b) { return a < b; } would result
* in a max heap, while: int cmp(const void *a, const void *b) { return a > b; }
* would result in a min heap.
*/
aws_priority_queue_compare_fn :: #type (a: *void, b: *void) -> s32 #c_call;

aws_priority_queue :: struct {
    /**
    * predicate that determines the priority of the elements in the queue.
    */
    pred:         aws_priority_queue_compare_fn;

    /**
    * The underlying container storing the queue elements.
    */
    container:    aws_array_list;

    /**
    * An array of pointers to backpointer elements. This array is initialized when
    * the first call to aws_priority_queue_push_bp is made, and is subsequently maintained
    * through any heap node manipulations.
    *
    * Each element is a struct aws_priority_queue_node *, pointing to a backpointer field
    * owned by the calling code, or a NULL. The backpointer field is continually updated
    * with information needed to locate and remove a specific node later on.
    */
    backpointers: aws_array_list;
}

aws_priority_queue_node :: struct {
    /** The current index of the node in question, or SIZE_MAX if the node has been removed. */
    current_index: u64;
}

aws_task_status :: enum s32 {
    RUN_READY :: 0;
    CANCELED  :: 1;

    AWS_TASK_STATUS_RUN_READY :: RUN_READY;
    AWS_TASK_STATUS_CANCELED  :: CANCELED;
}

/**
* A scheduled function.
*/
aws_task_fn :: #type (task: *aws_task, arg: *void, unknown0: aws_task_status) -> void #c_call;

/*
* A task object.
* Once added to the scheduler, a task must remain in memory until its function is executed.
*/
aws_task :: struct {
    fn:                  aws_task_fn;
    arg:                 *void;
    timestamp:           u64;
    node:                aws_linked_list_node;
    priority_queue_node: aws_priority_queue_node;
    type_tag:            *u8;

    abi_extension:       union {
        scheduled: bool;
        reserved:  u64;
    };
}

aws_task_scheduler :: struct {
    alloc:       *aws_allocator;
    timed_queue: aws_priority_queue; /* Tasks scheduled to run at specific times */
    timed_list:  aws_linked_list; /* If timed_queue runs out of memory, further timed tests are stored here */
    asap_list:   aws_linked_list; /* Tasks scheduled to run as soon as possible */
}

aws_channel_direction :: enum s32 {
    READ  :: 0;
    WRITE :: 1;

    AWS_CHANNEL_DIR_READ  :: READ;
    AWS_CHANNEL_DIR_WRITE :: WRITE;
}

aws_channel_on_setup_completed_fn :: #type (channel: *aws_channel, error_code: s32, user_data: *void) -> void #c_call;

/* Callback called when a channel is completely shutdown. error_code refers to the reason the channel was closed. */
aws_channel_on_shutdown_completed_fn :: #type (channel: *aws_channel, error_code: s32, user_data: *void) -> void #c_call;

aws_channel_slot :: struct {
    alloc:                            *aws_allocator;
    channel:                          *aws_channel;
    adj_left:                         *aws_channel_slot;
    adj_right:                        *aws_channel_slot;
    handler:                          *aws_channel_handler;
    window_size:                      u64;
    upstream_message_overhead:        u64;
    current_window_update_batch_size: u64;
}

aws_channel_task_fn :: #type (channel_task: *aws_channel_task, arg: *void, status: aws_task_status) -> void #c_call;

aws_channel_task :: struct {
    wrapper_task: aws_task;
    task_fn:      aws_channel_task_fn;
    arg:          *void;
    type_tag:     *u8;
    node:         aws_linked_list_node;
}

aws_channel_handler_vtable :: struct {
    /**
    * Called by the channel when a message is available for processing in the read direction. It is your
    * responsibility to call aws_mem_release(message->allocator, message); on message when you are finished with it.
    * You must only call `aws_mem_release(message->allocator, message);` if the `process_read_message`
    * returns AWS_OP_SUCCESS. In case of an error, you must not clean up the message and should just raise the error.
    *
    * Also keep in mind that your slot's internal window has been decremented. You'll want to call
    * aws_channel_slot_increment_read_window() at some point in the future if you want to keep receiving data.
    */
    process_read_message:  #type (handler: *aws_channel_handler, slot: *aws_channel_slot, message: *aws_io_message) -> s32 #c_call;

    /**
    * Called by the channel when a message is available for processing in the write direction. It is your
    * responsibility to call aws_mem_release(message->allocator, message); on message when you are finished with it.
    * You must only call `aws_mem_release(message->allocator, message);` if the `process_read_message`
    * returns AWS_OP_SUCCESS. In case of an error, you must not clean up the message and should just raise the error.
    */
    process_write_message: #type (handler: *aws_channel_handler, slot: *aws_channel_slot, message: *aws_io_message) -> s32 #c_call;

    /**
    * Called by the channel when a downstream handler has issued a window increment. You'll want to update your
    * internal state and likely propagate a window increment message of your own by calling
    * 'aws_channel_slot_increment_read_window()'
    */
    increment_read_window: #type (handler: *aws_channel_handler, slot: *aws_channel_slot, size: u64) -> s32 #c_call;

    /**
    * The channel calls shutdown on all handlers twice, once to shut down reading, and once to shut down writing.
    * Shutdown always begins with the left-most handler, and proceeds to the right with dir set to
    * AWS_CHANNEL_DIR_READ. Then shutdown is called on handlers from right to left with dir set to
    * AWS_CHANNEL_DIR_WRITE.
    *
    * The shutdown process does not need to complete immediately and may rely on scheduled tasks.
    * The handler must call aws_channel_slot_on_handler_shutdown_complete() when it is finished,
    * which propagates shutdown to the next handler.  If 'free_scarce_resources_immediately' is true,
    * then resources vulnerable to denial-of-service attacks (such as sockets and file handles)
    * must be closed immediately before the shutdown() call returns.
    */
    shutdown:              #type (handler: *aws_channel_handler, slot: *aws_channel_slot, dir: aws_channel_direction, error_code: s32, free_scarce_resources_immediately: bool) -> s32 #c_call;

    /**
    * Called by the channel when the handler is added to a slot, to get the initial window size.
    */
    initial_window_size:   #type (handler: *aws_channel_handler) -> u64 #c_call;

    /** Called by the channel anytime a handler is added or removed, provides a hint for downstream
    * handlers to avoid message fragmentation due to message overhead. */
    message_overhead:      #type (handler: *aws_channel_handler) -> u64 #c_call;

    /**
    * Clean up any resources and deallocate yourself. The shutdown process will already be completed before this
    * function is called.
    */
    destroy:               #type (handler: *aws_channel_handler) -> void #c_call;

    /**
    * Directs the channel handler to reset all of the internal statistics it tracks about itself.
    */
    reset_statistics:      #type (handler: *aws_channel_handler) -> void #c_call;

    /**
    * Adds a pointer to the handler's internal statistics (if they exist) to a list of statistics structures
    * associated with the channel's handler chain.
    */
    gather_statistics:     #type (handler: *aws_channel_handler, stats_list: *aws_array_list) -> void #c_call;

    /*
    * If this handler represents a source of data (like the socket_handler), then this will trigger a read
    * from the data source.
    */
    trigger_read:          #type (handler: *aws_channel_handler) -> void #c_call;
}

aws_channel_handler :: struct {
    vtable: *aws_channel_handler_vtable;
    alloc:  *aws_allocator;
    slot:   *aws_channel_slot;
    impl:   *void;
}

/**
* Args for creating a new channel.
*  event_loop to use for IO and tasks. on_setup_completed will be invoked when
*  the setup process is finished It will be executed in the event loop's thread.
*  on_shutdown_completed will be executed upon channel shutdown.
*
*  enable_read_back_pressure toggles whether or not back pressure will be applied in the channel.
*  Leave this option off unless you're using something like reactive-streams, since it is a slight throughput
*  penalty.
*
*  Unless otherwise
*  specified all functions for channels and channel slots must be executed within that channel's event-loop's thread.
**/
aws_channel_options :: struct {
    event_loop:                *aws_event_loop;
    on_setup_completed:        aws_channel_on_setup_completed_fn;
    on_shutdown_completed:     aws_channel_on_shutdown_completed_fn;
    setup_user_data:           *void;
    shutdown_user_data:        *void;
    enable_read_back_pressure: bool;
}

g_aws_channel_max_fragment_size: u64;

aws_socket_domain :: enum s32 {
    IPV4  :: 0;
    IPV6  :: 1;

    LOCAL :: 2;

    VSOCK :: 3;

    AWS_SOCKET_IPV4  :: IPV4;
    AWS_SOCKET_IPV6  :: IPV6;

    AWS_SOCKET_LOCAL :: LOCAL;

    AWS_SOCKET_VSOCK :: VSOCK;
}

aws_socket_type :: enum s32 {
    STREAM :: 0;

    DGRAM  :: 1;

    AWS_SOCKET_STREAM :: STREAM;

    AWS_SOCKET_DGRAM  :: DGRAM;
}

aws_socket_options :: struct {
    type:                         aws_socket_type;
    domain:                       aws_socket_domain;
    connect_timeout_ms:           u32;

    /* Keepalive properties are TCP only.
    * Set keepalive true to periodically transmit messages for detecting a disconnected peer.
    * If interval or timeout are zero, then default values are used. */
    keep_alive_interval_sec:      u16;
    keep_alive_timeout_sec:       u16;

    /* If set, sets the number of keep alive probes allowed to fail before the connection is considered
    * lost. If zero OS defaults are used. On Windows, this option is meaningless until Windows 10 1703.*/
    keep_alive_max_failed_probes: u16;
    keepalive:                    bool;
}

/**
* Called in client mode when an outgoing connection has succeeded or an error has occurred.
* If the connection was successful error_code will be AWS_ERROR_SUCCESS and the socket has already been assigned
* to the event loop specified in aws_socket_connect().
*
* If an error occurred error_code will be non-zero.
*/
aws_socket_on_connection_result_fn :: #type (socket: *aws_socket, error_code: s32, user_data: *void) -> void #c_call;

/**
* Called by a listening socket when either an incoming connection has been received or an error occurred.
*
* In the normal use-case, this function will be called multiple times over the lifetime of a single listening socket.
* new_socket is already connected and initialized, and is using the same options and allocator as the listening socket.
* A user may want to call aws_socket_set_options() on the new socket if different options are desired.
*
* new_socket is not yet assigned to an event-loop. The user should call aws_socket_assign_to_event_loop() before
* performing IO operations.
*
* When error_code is AWS_ERROR_SUCCESS, new_socket is the recently accepted connection.
* If error_code is non-zero, an error occurred and you should aws_socket_close() the socket.
*
* Do not call aws_socket_clean_up() from this callback.
*/
aws_socket_on_accept_result_fn :: #type (socket: *aws_socket, error_code: s32, new_socket: *aws_socket, user_data: *void) -> void #c_call;

/**
* Callback for when the data passed to a call to aws_socket_write() has either completed or failed.
* On success, error_code will be AWS_ERROR_SUCCESS.
*/
aws_socket_on_write_completed_fn :: #type (socket: *aws_socket, error_code: s32, bytes_written: u64, user_data: *void) -> void #c_call;

/**
* Callback for when socket is either readable (edge-triggered) or when an error has occurred. If the socket is
* readable, error_code will be AWS_ERROR_SUCCESS.
*/
aws_socket_on_readable_fn :: #type (socket: *aws_socket, error_code: s32, user_data: *void) -> void #c_call;

aws_socket_endpoint :: struct {
    address: [256] u8;
    port:    u32;
}

aws_socket :: struct {
    allocator:                *aws_allocator;
    local_endpoint:           aws_socket_endpoint;
    remote_endpoint:          aws_socket_endpoint;
    options:                  aws_socket_options;
    io_handle:                aws_io_handle;
    event_loop:               *aws_event_loop;
    handler:                  *aws_channel_handler;
    state:                    s32;
    readable_fn:              aws_socket_on_readable_fn;
    readable_user_data:       *void;
    connection_result_fn:     aws_socket_on_connection_result_fn;
    accept_result_fn:         aws_socket_on_accept_result_fn;
    connect_accept_user_data: *void;
    impl:                     *void;
}

aws_ms_fn_ptr :: #type () -> void #c_call;

/* Quality of Service associated with a publish action or subscription [MQTT-4.3]. */
aws_mqtt_qos :: enum s32 {
    AT_MOST_ONCE  :: 0;
    AT_LEAST_ONCE :: 1;
    EXACTLY_ONCE  :: 2;

    FAILURE       :: 128;

    AWS_MQTT_QOS_AT_MOST_ONCE  :: AT_MOST_ONCE;
    AWS_MQTT_QOS_AT_LEAST_ONCE :: AT_LEAST_ONCE;
    AWS_MQTT_QOS_EXACTLY_ONCE  :: EXACTLY_ONCE;

    AWS_MQTT_QOS_FAILURE       :: FAILURE;
}

/* Result of a connect request [MQTT-3.2.2.3]. */
aws_mqtt_connect_return_code :: enum s32 {
    ACCEPTED                      :: 0;
    UNACCEPTABLE_PROTOCOL_VERSION :: 1;
    IDENTIFIER_REJECTED           :: 2;
    SERVER_UNAVAILABLE            :: 3;
    BAD_USERNAME_OR_PASSWORD      :: 4;
    NOT_AUTHORIZED                :: 5;

    AWS_MQTT_CONNECT_ACCEPTED                      :: ACCEPTED;
    AWS_MQTT_CONNECT_UNACCEPTABLE_PROTOCOL_VERSION :: UNACCEPTABLE_PROTOCOL_VERSION;
    AWS_MQTT_CONNECT_IDENTIFIER_REJECTED           :: IDENTIFIER_REJECTED;
    AWS_MQTT_CONNECT_SERVER_UNAVAILABLE            :: SERVER_UNAVAILABLE;
    AWS_MQTT_CONNECT_BAD_USERNAME_OR_PASSWORD      :: BAD_USERNAME_OR_PASSWORD;
    AWS_MQTT_CONNECT_NOT_AUTHORIZED                :: NOT_AUTHORIZED;
}

aws_mqtt_error :: enum s32 {
    MQTT_INVALID_RESERVED_BITS                         :: 5120;
    MQTT_BUFFER_TOO_BIG                                :: 5121;
    MQTT_INVALID_REMAINING_LENGTH                      :: 5122;
    MQTT_UNSUPPORTED_PROTOCOL_NAME                     :: 5123;
    MQTT_UNSUPPORTED_PROTOCOL_LEVEL                    :: 5124;
    MQTT_INVALID_CREDENTIALS                           :: 5125;
    MQTT_INVALID_QOS                                   :: 5126;
    MQTT_INVALID_PACKET_TYPE                           :: 5127;
    MQTT_INVALID_TOPIC                                 :: 5128;
    MQTT_TIMEOUT                                       :: 5129;
    MQTT_PROTOCOL_ERROR                                :: 5130;
    MQTT_NOT_CONNECTED                                 :: 5131;
    MQTT_ALREADY_CONNECTED                             :: 5132;
    MQTT_BUILT_WITHOUT_WEBSOCKETS                      :: 5133;
    MQTT_UNEXPECTED_HANGUP                             :: 5134;
    MQTT_CONNECTION_SHUTDOWN                           :: 5135;
    MQTT_CONNECTION_DESTROYED                          :: 5136;
    MQTT_CONNECTION_DISCONNECTING                      :: 5137;
    MQTT_CANCELLED_FOR_CLEAN_SESSION                   :: 5138;
    MQTT_QUEUE_FULL                                    :: 5139;
    MQTT5_CLIENT_OPTIONS_VALIDATION                    :: 5140;
    MQTT5_CONNECT_OPTIONS_VALIDATION                   :: 5141;
    MQTT5_DISCONNECT_OPTIONS_VALIDATION                :: 5142;
    MQTT5_PUBLISH_OPTIONS_VALIDATION                   :: 5143;
    MQTT5_SUBSCRIBE_OPTIONS_VALIDATION                 :: 5144;
    MQTT5_UNSUBSCRIBE_OPTIONS_VALIDATION               :: 5145;
    MQTT5_USER_PROPERTY_VALIDATION                     :: 5146;
    MQTT5_PACKET_VALIDATION                            :: 5147;
    MQTT5_ENCODE_FAILURE                               :: 5148;
    MQTT5_DECODE_PROTOCOL_ERROR                        :: 5149;
    MQTT5_CONNACK_CONNECTION_REFUSED                   :: 5150;
    MQTT5_CONNACK_TIMEOUT                              :: 5151;
    MQTT5_PING_RESPONSE_TIMEOUT                        :: 5152;
    MQTT5_USER_REQUESTED_STOP                          :: 5153;
    MQTT5_DISCONNECT_RECEIVED                          :: 5154;
    MQTT5_CLIENT_TERMINATED                            :: 5155;
    MQTT5_OPERATION_FAILED_DUE_TO_OFFLINE_QUEUE_POLICY :: 5156;
    MQTT5_ENCODE_SIZE_UNSUPPORTED_PACKET_TYPE          :: 5157;
    MQTT5_OPERATION_PROCESSING_FAILURE                 :: 5158;
    MQTT5_INVALID_INBOUND_TOPIC_ALIAS                  :: 5159;
    MQTT5_INVALID_OUTBOUND_TOPIC_ALIAS                 :: 5160;
    MQTT5_INVALID_UTF8_STRING                          :: 5161;
    MQTT_CONNECTION_RESET_FOR_ADAPTER_CONNECT          :: 5162;
    MQTT_CONNECTION_RESUBSCRIBE_NO_TOPICS              :: 5163;
    MQTT_CONNECTION_SUBSCRIBE_FAILURE                  :: 5164;
    MQTT_ACK_REASON_CODE_FAILURE                       :: 5165;

    END_MQTT_RANGE                                     :: 6143;

    AWS_ERROR_MQTT_INVALID_RESERVED_BITS                         :: MQTT_INVALID_RESERVED_BITS;
    AWS_ERROR_MQTT_BUFFER_TOO_BIG                                :: MQTT_BUFFER_TOO_BIG;
    AWS_ERROR_MQTT_INVALID_REMAINING_LENGTH                      :: MQTT_INVALID_REMAINING_LENGTH;
    AWS_ERROR_MQTT_UNSUPPORTED_PROTOCOL_NAME                     :: MQTT_UNSUPPORTED_PROTOCOL_NAME;
    AWS_ERROR_MQTT_UNSUPPORTED_PROTOCOL_LEVEL                    :: MQTT_UNSUPPORTED_PROTOCOL_LEVEL;
    AWS_ERROR_MQTT_INVALID_CREDENTIALS                           :: MQTT_INVALID_CREDENTIALS;
    AWS_ERROR_MQTT_INVALID_QOS                                   :: MQTT_INVALID_QOS;
    AWS_ERROR_MQTT_INVALID_PACKET_TYPE                           :: MQTT_INVALID_PACKET_TYPE;
    AWS_ERROR_MQTT_INVALID_TOPIC                                 :: MQTT_INVALID_TOPIC;
    AWS_ERROR_MQTT_TIMEOUT                                       :: MQTT_TIMEOUT;
    AWS_ERROR_MQTT_PROTOCOL_ERROR                                :: MQTT_PROTOCOL_ERROR;
    AWS_ERROR_MQTT_NOT_CONNECTED                                 :: MQTT_NOT_CONNECTED;
    AWS_ERROR_MQTT_ALREADY_CONNECTED                             :: MQTT_ALREADY_CONNECTED;
    AWS_ERROR_MQTT_BUILT_WITHOUT_WEBSOCKETS                      :: MQTT_BUILT_WITHOUT_WEBSOCKETS;
    AWS_ERROR_MQTT_UNEXPECTED_HANGUP                             :: MQTT_UNEXPECTED_HANGUP;
    AWS_ERROR_MQTT_CONNECTION_SHUTDOWN                           :: MQTT_CONNECTION_SHUTDOWN;
    AWS_ERROR_MQTT_CONNECTION_DESTROYED                          :: MQTT_CONNECTION_DESTROYED;
    AWS_ERROR_MQTT_CONNECTION_DISCONNECTING                      :: MQTT_CONNECTION_DISCONNECTING;
    AWS_ERROR_MQTT_CANCELLED_FOR_CLEAN_SESSION                   :: MQTT_CANCELLED_FOR_CLEAN_SESSION;
    AWS_ERROR_MQTT_QUEUE_FULL                                    :: MQTT_QUEUE_FULL;
    AWS_ERROR_MQTT5_CLIENT_OPTIONS_VALIDATION                    :: MQTT5_CLIENT_OPTIONS_VALIDATION;
    AWS_ERROR_MQTT5_CONNECT_OPTIONS_VALIDATION                   :: MQTT5_CONNECT_OPTIONS_VALIDATION;
    AWS_ERROR_MQTT5_DISCONNECT_OPTIONS_VALIDATION                :: MQTT5_DISCONNECT_OPTIONS_VALIDATION;
    AWS_ERROR_MQTT5_PUBLISH_OPTIONS_VALIDATION                   :: MQTT5_PUBLISH_OPTIONS_VALIDATION;
    AWS_ERROR_MQTT5_SUBSCRIBE_OPTIONS_VALIDATION                 :: MQTT5_SUBSCRIBE_OPTIONS_VALIDATION;
    AWS_ERROR_MQTT5_UNSUBSCRIBE_OPTIONS_VALIDATION               :: MQTT5_UNSUBSCRIBE_OPTIONS_VALIDATION;
    AWS_ERROR_MQTT5_USER_PROPERTY_VALIDATION                     :: MQTT5_USER_PROPERTY_VALIDATION;
    AWS_ERROR_MQTT5_PACKET_VALIDATION                            :: MQTT5_PACKET_VALIDATION;
    AWS_ERROR_MQTT5_ENCODE_FAILURE                               :: MQTT5_ENCODE_FAILURE;
    AWS_ERROR_MQTT5_DECODE_PROTOCOL_ERROR                        :: MQTT5_DECODE_PROTOCOL_ERROR;
    AWS_ERROR_MQTT5_CONNACK_CONNECTION_REFUSED                   :: MQTT5_CONNACK_CONNECTION_REFUSED;
    AWS_ERROR_MQTT5_CONNACK_TIMEOUT                              :: MQTT5_CONNACK_TIMEOUT;
    AWS_ERROR_MQTT5_PING_RESPONSE_TIMEOUT                        :: MQTT5_PING_RESPONSE_TIMEOUT;
    AWS_ERROR_MQTT5_USER_REQUESTED_STOP                          :: MQTT5_USER_REQUESTED_STOP;
    AWS_ERROR_MQTT5_DISCONNECT_RECEIVED                          :: MQTT5_DISCONNECT_RECEIVED;
    AWS_ERROR_MQTT5_CLIENT_TERMINATED                            :: MQTT5_CLIENT_TERMINATED;
    AWS_ERROR_MQTT5_OPERATION_FAILED_DUE_TO_OFFLINE_QUEUE_POLICY :: MQTT5_OPERATION_FAILED_DUE_TO_OFFLINE_QUEUE_POLICY;
    AWS_ERROR_MQTT5_ENCODE_SIZE_UNSUPPORTED_PACKET_TYPE          :: MQTT5_ENCODE_SIZE_UNSUPPORTED_PACKET_TYPE;
    AWS_ERROR_MQTT5_OPERATION_PROCESSING_FAILURE                 :: MQTT5_OPERATION_PROCESSING_FAILURE;
    AWS_ERROR_MQTT5_INVALID_INBOUND_TOPIC_ALIAS                  :: MQTT5_INVALID_INBOUND_TOPIC_ALIAS;
    AWS_ERROR_MQTT5_INVALID_OUTBOUND_TOPIC_ALIAS                 :: MQTT5_INVALID_OUTBOUND_TOPIC_ALIAS;
    AWS_ERROR_MQTT5_INVALID_UTF8_STRING                          :: MQTT5_INVALID_UTF8_STRING;
    AWS_ERROR_MQTT_CONNECTION_RESET_FOR_ADAPTER_CONNECT          :: MQTT_CONNECTION_RESET_FOR_ADAPTER_CONNECT;
    AWS_ERROR_MQTT_CONNECTION_RESUBSCRIBE_NO_TOPICS              :: MQTT_CONNECTION_RESUBSCRIBE_NO_TOPICS;
    AWS_ERROR_MQTT_CONNECTION_SUBSCRIBE_FAILURE                  :: MQTT_CONNECTION_SUBSCRIBE_FAILURE;
    AWS_ERROR_MQTT_ACK_REASON_CODE_FAILURE                       :: MQTT_ACK_REASON_CODE_FAILURE;

    AWS_ERROR_END_MQTT_RANGE                                     :: END_MQTT_RANGE;
}

aws_mqtt_log_subject :: enum s32 {
    MQTT_GENERAL           :: 5120;
    MQTT_CLIENT            :: 5121;
    MQTT_TOPIC_TREE        :: 5122;
    MQTT5_GENERAL          :: 5123;
    MQTT5_CLIENT           :: 5124;
    MQTT5_CANARY           :: 5125;
    MQTT5_TO_MQTT3_ADAPTER :: 5126;

    AWS_LS_MQTT_GENERAL           :: MQTT_GENERAL;
    AWS_LS_MQTT_CLIENT            :: MQTT_CLIENT;
    AWS_LS_MQTT_TOPIC_TREE        :: MQTT_TOPIC_TREE;
    AWS_LS_MQTT5_GENERAL          :: MQTT5_GENERAL;
    AWS_LS_MQTT5_CLIENT           :: MQTT5_CLIENT;
    AWS_LS_MQTT5_CANARY           :: MQTT5_CANARY;
    AWS_LS_MQTT5_TO_MQTT3_ADAPTER :: MQTT5_TO_MQTT3_ADAPTER;
}

/** Function called on cleanup of a userdata. */
aws_mqtt_userdata_cleanup_fn :: #type (userdata: *void) -> void #c_call;

AWS_DATE_TIME_STR_MAX :: enum s32 {
    LEN       :: 100;
    BASIC_LEN :: 20;

    AWS_DATE_TIME_STR_MAX_LEN       :: LEN;
    AWS_DATE_TIME_STR_MAX_BASIC_LEN :: BASIC_LEN;
}

aws_date_format :: enum s32 {
    RFC822         :: 0;
    ISO_8601       :: 1;
    ISO_8601_BASIC :: 2;
    AUTO_DETECT    :: 3;

    AWS_DATE_FORMAT_RFC822         :: RFC822;
    AWS_DATE_FORMAT_ISO_8601       :: ISO_8601;
    AWS_DATE_FORMAT_ISO_8601_BASIC :: ISO_8601_BASIC;
    AWS_DATE_FORMAT_AUTO_DETECT    :: AUTO_DETECT;
}

aws_date_month :: enum s32 {
    JANUARY   :: 0;
    FEBRUARY  :: 1;
    MARCH     :: 2;
    APRIL     :: 3;
    MAY       :: 4;
    JUNE      :: 5;
    JULY      :: 6;
    AUGUST    :: 7;
    SEPTEMBER :: 8;
    OCTOBER   :: 9;
    NOVEMBER  :: 10;
    DECEMBER  :: 11;

    AWS_DATE_MONTH_JANUARY   :: JANUARY;
    AWS_DATE_MONTH_FEBRUARY  :: FEBRUARY;
    AWS_DATE_MONTH_MARCH     :: MARCH;
    AWS_DATE_MONTH_APRIL     :: APRIL;
    AWS_DATE_MONTH_MAY       :: MAY;
    AWS_DATE_MONTH_JUNE      :: JUNE;
    AWS_DATE_MONTH_JULY      :: JULY;
    AWS_DATE_MONTH_AUGUST    :: AUGUST;
    AWS_DATE_MONTH_SEPTEMBER :: SEPTEMBER;
    AWS_DATE_MONTH_OCTOBER   :: OCTOBER;
    AWS_DATE_MONTH_NOVEMBER  :: NOVEMBER;
    AWS_DATE_MONTH_DECEMBER  :: DECEMBER;
}

aws_date_day_of_week :: enum s32 {
    SUNDAY    :: 0;
    MONDAY    :: 1;
    TUESDAY   :: 2;
    WEDNESDAY :: 3;
    THURSDAY  :: 4;
    FRIDAY    :: 5;
    SATURDAY  :: 6;

    AWS_DATE_DAY_OF_WEEK_SUNDAY    :: SUNDAY;
    AWS_DATE_DAY_OF_WEEK_MONDAY    :: MONDAY;
    AWS_DATE_DAY_OF_WEEK_TUESDAY   :: TUESDAY;
    AWS_DATE_DAY_OF_WEEK_WEDNESDAY :: WEDNESDAY;
    AWS_DATE_DAY_OF_WEEK_THURSDAY  :: THURSDAY;
    AWS_DATE_DAY_OF_WEEK_FRIDAY    :: FRIDAY;
    AWS_DATE_DAY_OF_WEEK_SATURDAY  :: SATURDAY;
}

aws_date_time :: struct {
    timestamp:    time_t;
    milliseconds: u16;
    tz:           [6] u8;
    gmt_time:     tm;
    local_time:   tm;
    utc_assumed:  bool;
}

aws_io_log_subject :: enum s32 {
    LS_IO_GENERAL                            :: 1024;
    LS_IO_EVENT_LOOP                         :: 1025;
    LS_IO_SOCKET                             :: 1026;
    LS_IO_SOCKET_HANDLER                     :: 1027;
    LS_IO_TLS                                :: 1028;
    LS_IO_ALPN                               :: 1029;
    LS_IO_DNS                                :: 1030;
    LS_IO_PKI                                :: 1031;
    LS_IO_CHANNEL                            :: 1032;
    LS_IO_CHANNEL_BOOTSTRAP                  :: 1033;
    LS_IO_FILE_UTILS                         :: 1034;
    LS_IO_SHARED_LIBRARY                     :: 1035;
    LS_IO_EXPONENTIAL_BACKOFF_RETRY_STRATEGY :: 1036;
    LS_IO_STANDARD_RETRY_STRATEGY            :: 1037;
    LS_IO_PKCS11                             :: 1038;
    LS_IO_PEM                                :: 1039;
    IO_LS_LAST                               :: 2047;

    AWS_LS_IO_GENERAL                            :: LS_IO_GENERAL;
    AWS_LS_IO_EVENT_LOOP                         :: LS_IO_EVENT_LOOP;
    AWS_LS_IO_SOCKET                             :: LS_IO_SOCKET;
    AWS_LS_IO_SOCKET_HANDLER                     :: LS_IO_SOCKET_HANDLER;
    AWS_LS_IO_TLS                                :: LS_IO_TLS;
    AWS_LS_IO_ALPN                               :: LS_IO_ALPN;
    AWS_LS_IO_DNS                                :: LS_IO_DNS;
    AWS_LS_IO_PKI                                :: LS_IO_PKI;
    AWS_LS_IO_CHANNEL                            :: LS_IO_CHANNEL;
    AWS_LS_IO_CHANNEL_BOOTSTRAP                  :: LS_IO_CHANNEL_BOOTSTRAP;
    AWS_LS_IO_FILE_UTILS                         :: LS_IO_FILE_UTILS;
    AWS_LS_IO_SHARED_LIBRARY                     :: LS_IO_SHARED_LIBRARY;
    AWS_LS_IO_EXPONENTIAL_BACKOFF_RETRY_STRATEGY :: LS_IO_EXPONENTIAL_BACKOFF_RETRY_STRATEGY;
    AWS_LS_IO_STANDARD_RETRY_STRATEGY            :: LS_IO_STANDARD_RETRY_STRATEGY;
    AWS_LS_IO_PKCS11                             :: LS_IO_PKCS11;
    AWS_LS_IO_PEM                                :: LS_IO_PEM;
    AWS_IO_LS_LAST                               :: IO_LS_LAST;
}

aws_sdkutils_errors :: enum s32 {
    GENERAL                       :: 15360;
    PARSE_FATAL                   :: 15361;
    PARSE_RECOVERABLE             :: 15362;
    ENDPOINTS_UNSUPPORTED_RULESET :: 15363;
    ENDPOINTS_PARSE_FAILED        :: 15364;
    ENDPOINTS_RESOLVE_INIT_FAILED :: 15365;
    ENDPOINTS_RESOLVE_FAILED      :: 15366;
    ENDPOINTS_EMPTY_RULESET       :: 15367;
    ENDPOINTS_RULESET_EXHAUSTED   :: 15368;
    PARTITIONS_UNSUPPORTED        :: 15369;
    PARTITIONS_PARSE_FAILED       :: 15370;
    ENDPOINTS_UNSUPPORTED_REGEX   :: 15371;
    ENDPOINTS_REGEX_NO_MATCH      :: 15372;

    END_RANGE                     :: 16383;

    AWS_ERROR_SDKUTILS_GENERAL                       :: GENERAL;
    AWS_ERROR_SDKUTILS_PARSE_FATAL                   :: PARSE_FATAL;
    AWS_ERROR_SDKUTILS_PARSE_RECOVERABLE             :: PARSE_RECOVERABLE;
    AWS_ERROR_SDKUTILS_ENDPOINTS_UNSUPPORTED_RULESET :: ENDPOINTS_UNSUPPORTED_RULESET;
    AWS_ERROR_SDKUTILS_ENDPOINTS_PARSE_FAILED        :: ENDPOINTS_PARSE_FAILED;
    AWS_ERROR_SDKUTILS_ENDPOINTS_RESOLVE_INIT_FAILED :: ENDPOINTS_RESOLVE_INIT_FAILED;
    AWS_ERROR_SDKUTILS_ENDPOINTS_RESOLVE_FAILED      :: ENDPOINTS_RESOLVE_FAILED;
    AWS_ERROR_SDKUTILS_ENDPOINTS_EMPTY_RULESET       :: ENDPOINTS_EMPTY_RULESET;
    AWS_ERROR_SDKUTILS_ENDPOINTS_RULESET_EXHAUSTED   :: ENDPOINTS_RULESET_EXHAUSTED;
    AWS_ERROR_SDKUTILS_PARTITIONS_UNSUPPORTED        :: PARTITIONS_UNSUPPORTED;
    AWS_ERROR_SDKUTILS_PARTITIONS_PARSE_FAILED       :: PARTITIONS_PARSE_FAILED;
    AWS_ERROR_SDKUTILS_ENDPOINTS_UNSUPPORTED_REGEX   :: ENDPOINTS_UNSUPPORTED_REGEX;
    AWS_ERROR_SDKUTILS_ENDPOINTS_REGEX_NO_MATCH      :: ENDPOINTS_REGEX_NO_MATCH;

    AWS_ERROR_SDKUTILS_END_RANGE                     :: END_RANGE;
}

aws_sdkutils_log_subject :: enum s32 {
    GENERAL            :: 15360;
    PROFILE            :: 15361;
    ENDPOINTS_PARSING  :: 15362;
    ENDPOINTS_RESOLVE  :: 15363;
    ENDPOINTS_GENERAL  :: 15364;
    PARTITIONS_PARSING :: 15365;
    ENDPOINTS_REGEX    :: 15366;

    LAST               :: 16383;

    AWS_LS_SDKUTILS_GENERAL            :: GENERAL;
    AWS_LS_SDKUTILS_PROFILE            :: PROFILE;
    AWS_LS_SDKUTILS_ENDPOINTS_PARSING  :: ENDPOINTS_PARSING;
    AWS_LS_SDKUTILS_ENDPOINTS_RESOLVE  :: ENDPOINTS_RESOLVE;
    AWS_LS_SDKUTILS_ENDPOINTS_GENERAL  :: ENDPOINTS_GENERAL;
    AWS_LS_SDKUTILS_PARTITIONS_PARSING :: PARTITIONS_PARSING;
    AWS_LS_SDKUTILS_ENDPOINTS_REGEX    :: ENDPOINTS_REGEX;

    AWS_LS_SDKUTILS_LAST               :: LAST;
}

/**
* Auth-specific error codes
*/
aws_auth_errors :: enum s32 {
    PROFILE_PARSE_RECOVERABLE_ERROR                      :: 15362;
    PROFILE_PARSE_FATAL_ERROR                            :: 15361;
    SIGNING_UNSUPPORTED_ALGORITHM                        :: 6144;
    SIGNING_MISMATCHED_CONFIGURATION                     :: 6145;
    SIGNING_NO_CREDENTIALS                               :: 6146;
    SIGNING_ILLEGAL_REQUEST_QUERY_PARAM                  :: 6147;
    SIGNING_ILLEGAL_REQUEST_HEADER                       :: 6148;
    SIGNING_INVALID_CONFIGURATION                        :: 6149;
    CREDENTIALS_PROVIDER_INVALID_ENVIRONMENT             :: 6150;
    CREDENTIALS_PROVIDER_INVALID_DELEGATE                :: 6151;
    CREDENTIALS_PROVIDER_PROFILE_SOURCE_FAILURE          :: 6152;
    CREDENTIALS_PROVIDER_IMDS_SOURCE_FAILURE             :: 6153;
    CREDENTIALS_PROVIDER_STS_SOURCE_FAILURE              :: 6154;
    CREDENTIALS_PROVIDER_HTTP_STATUS_FAILURE             :: 6155;
    PROVIDER_PARSER_UNEXPECTED_RESPONSE                  :: 6156;
    CREDENTIALS_PROVIDER_ECS_SOURCE_FAILURE              :: 6157;
    CREDENTIALS_PROVIDER_X509_SOURCE_FAILURE             :: 6158;
    CREDENTIALS_PROVIDER_PROCESS_SOURCE_FAILURE          :: 6159;
    CREDENTIALS_PROVIDER_STS_WEB_IDENTITY_SOURCE_FAILURE :: 6160;
    SIGNING_UNSUPPORTED_SIGNATURE_TYPE                   :: 6161;
    SIGNING_MISSING_PREVIOUS_SIGNATURE                   :: 6162;
    SIGNING_INVALID_CREDENTIALS                          :: 6163;
    CANONICAL_REQUEST_MISMATCH                           :: 6164;
    SIGV4A_SIGNATURE_VALIDATION_FAILURE                  :: 6165;
    CREDENTIALS_PROVIDER_COGNITO_SOURCE_FAILURE          :: 6166;
    CREDENTIALS_PROVIDER_DELEGATE_FAILURE                :: 6167;
    SSO_TOKEN_PROVIDER_SOURCE_FAILURE                    :: 6168;
    SSO_TOKEN_INVALID                                    :: 6169;
    SSO_TOKEN_EXPIRED                                    :: 6170;
    CREDENTIALS_PROVIDER_SSO_SOURCE_FAILURE              :: 6171;
    IMDS_CLIENT_SOURCE_FAILURE                           :: 6172;
    PROFILE_STS_CREDENTIALS_PROVIDER_CYCLE_FAILURE       :: 6173;

    ERROR_END_RANGE                                      :: 7167;

    AWS_AUTH_PROFILE_PARSE_RECOVERABLE_ERROR                      :: PROFILE_PARSE_RECOVERABLE_ERROR;
    AWS_AUTH_PROFILE_PARSE_FATAL_ERROR                            :: PROFILE_PARSE_FATAL_ERROR;
    AWS_AUTH_SIGNING_UNSUPPORTED_ALGORITHM                        :: SIGNING_UNSUPPORTED_ALGORITHM;
    AWS_AUTH_SIGNING_MISMATCHED_CONFIGURATION                     :: SIGNING_MISMATCHED_CONFIGURATION;
    AWS_AUTH_SIGNING_NO_CREDENTIALS                               :: SIGNING_NO_CREDENTIALS;
    AWS_AUTH_SIGNING_ILLEGAL_REQUEST_QUERY_PARAM                  :: SIGNING_ILLEGAL_REQUEST_QUERY_PARAM;
    AWS_AUTH_SIGNING_ILLEGAL_REQUEST_HEADER                       :: SIGNING_ILLEGAL_REQUEST_HEADER;
    AWS_AUTH_SIGNING_INVALID_CONFIGURATION                        :: SIGNING_INVALID_CONFIGURATION;
    AWS_AUTH_CREDENTIALS_PROVIDER_INVALID_ENVIRONMENT             :: CREDENTIALS_PROVIDER_INVALID_ENVIRONMENT;
    AWS_AUTH_CREDENTIALS_PROVIDER_INVALID_DELEGATE                :: CREDENTIALS_PROVIDER_INVALID_DELEGATE;
    AWS_AUTH_CREDENTIALS_PROVIDER_PROFILE_SOURCE_FAILURE          :: CREDENTIALS_PROVIDER_PROFILE_SOURCE_FAILURE;
    AWS_AUTH_CREDENTIALS_PROVIDER_IMDS_SOURCE_FAILURE             :: CREDENTIALS_PROVIDER_IMDS_SOURCE_FAILURE;
    AWS_AUTH_CREDENTIALS_PROVIDER_STS_SOURCE_FAILURE              :: CREDENTIALS_PROVIDER_STS_SOURCE_FAILURE;
    AWS_AUTH_CREDENTIALS_PROVIDER_HTTP_STATUS_FAILURE             :: CREDENTIALS_PROVIDER_HTTP_STATUS_FAILURE;
    AWS_AUTH_PROVIDER_PARSER_UNEXPECTED_RESPONSE                  :: PROVIDER_PARSER_UNEXPECTED_RESPONSE;
    AWS_AUTH_CREDENTIALS_PROVIDER_ECS_SOURCE_FAILURE              :: CREDENTIALS_PROVIDER_ECS_SOURCE_FAILURE;
    AWS_AUTH_CREDENTIALS_PROVIDER_X509_SOURCE_FAILURE             :: CREDENTIALS_PROVIDER_X509_SOURCE_FAILURE;
    AWS_AUTH_CREDENTIALS_PROVIDER_PROCESS_SOURCE_FAILURE          :: CREDENTIALS_PROVIDER_PROCESS_SOURCE_FAILURE;
    AWS_AUTH_CREDENTIALS_PROVIDER_STS_WEB_IDENTITY_SOURCE_FAILURE :: CREDENTIALS_PROVIDER_STS_WEB_IDENTITY_SOURCE_FAILURE;
    AWS_AUTH_SIGNING_UNSUPPORTED_SIGNATURE_TYPE                   :: SIGNING_UNSUPPORTED_SIGNATURE_TYPE;
    AWS_AUTH_SIGNING_MISSING_PREVIOUS_SIGNATURE                   :: SIGNING_MISSING_PREVIOUS_SIGNATURE;
    AWS_AUTH_SIGNING_INVALID_CREDENTIALS                          :: SIGNING_INVALID_CREDENTIALS;
    AWS_AUTH_CANONICAL_REQUEST_MISMATCH                           :: CANONICAL_REQUEST_MISMATCH;
    AWS_AUTH_SIGV4A_SIGNATURE_VALIDATION_FAILURE                  :: SIGV4A_SIGNATURE_VALIDATION_FAILURE;
    AWS_AUTH_CREDENTIALS_PROVIDER_COGNITO_SOURCE_FAILURE          :: CREDENTIALS_PROVIDER_COGNITO_SOURCE_FAILURE;
    AWS_AUTH_CREDENTIALS_PROVIDER_DELEGATE_FAILURE                :: CREDENTIALS_PROVIDER_DELEGATE_FAILURE;
    AWS_AUTH_SSO_TOKEN_PROVIDER_SOURCE_FAILURE                    :: SSO_TOKEN_PROVIDER_SOURCE_FAILURE;
    AWS_AUTH_SSO_TOKEN_INVALID                                    :: SSO_TOKEN_INVALID;
    AWS_AUTH_SSO_TOKEN_EXPIRED                                    :: SSO_TOKEN_EXPIRED;
    AWS_AUTH_CREDENTIALS_PROVIDER_SSO_SOURCE_FAILURE              :: CREDENTIALS_PROVIDER_SSO_SOURCE_FAILURE;
    AWS_AUTH_IMDS_CLIENT_SOURCE_FAILURE                           :: IMDS_CLIENT_SOURCE_FAILURE;
    AWS_AUTH_PROFILE_STS_CREDENTIALS_PROVIDER_CYCLE_FAILURE       :: PROFILE_STS_CREDENTIALS_PROVIDER_CYCLE_FAILURE;

    AWS_AUTH_ERROR_END_RANGE                                      :: ERROR_END_RANGE;
}

/**
* Auth-specific logging subjects
*/
aws_auth_log_subject :: enum s32 {
    AUTH_GENERAL              :: 6144;
    AUTH_PROFILE              :: 6145;
    AUTH_CREDENTIALS_PROVIDER :: 6146;
    AUTH_SIGNING              :: 6147;
    IMDS_CLIENT               :: 6148;

    AUTH_LAST                 :: 7167;

    AWS_LS_AUTH_GENERAL              :: AUTH_GENERAL;
    AWS_LS_AUTH_PROFILE              :: AUTH_PROFILE;
    AWS_LS_AUTH_CREDENTIALS_PROVIDER :: AUTH_CREDENTIALS_PROVIDER;
    AWS_LS_AUTH_SIGNING              :: AUTH_SIGNING;
    AWS_LS_IMDS_CLIENT               :: IMDS_CLIENT;

    AWS_LS_AUTH_LAST                 :: AUTH_LAST;
}

aws_credentials :: struct {}

aws_should_sign_header_fn :: #type (name: *aws_byte_cursor, userdata: *void) -> bool #c_call;

/**
* A primitive RTTI indicator for signing configuration structs
*
* There must be one entry per config structure type and it's a fatal error
* to put the wrong value in the "config_type" member of your config structure.
*/
aws_signing_config_type :: enum s32 {
    AWS_SIGNING_CONFIG_AWS :: 1;
}

/**
* All signing configuration structs must match this by having
* the config_type member as the first member.
*/
aws_signing_config_base :: struct {
    config_type: aws_signing_config_type;
}

/**
* What version of the AWS signing process should we use.
*/
aws_signing_algorithm :: enum s32 {
    V4            :: 0;
    V4_ASYMMETRIC :: 1;
    V4_S3EXPRESS  :: 2;

    AWS_SIGNING_ALGORITHM_V4            :: V4;
    AWS_SIGNING_ALGORITHM_V4_ASYMMETRIC :: V4_ASYMMETRIC;
    AWS_SIGNING_ALGORITHM_V4_S3EXPRESS  :: V4_S3EXPRESS;
}

/**
* What sort of signature should be computed from the signable?
*/
aws_signature_type :: enum s32 {
    HTTP_REQUEST_HEADERS           :: 0;

    HTTP_REQUEST_QUERY_PARAMS      :: 1;

    HTTP_REQUEST_CHUNK             :: 2;

    HTTP_REQUEST_EVENT             :: 3;

    CANONICAL_REQUEST_HEADERS      :: 4;

    CANONICAL_REQUEST_QUERY_PARAMS :: 5;

    HTTP_REQUEST_TRAILING_HEADERS  :: 6;

    AWS_ST_HTTP_REQUEST_HEADERS           :: HTTP_REQUEST_HEADERS;

    AWS_ST_HTTP_REQUEST_QUERY_PARAMS      :: HTTP_REQUEST_QUERY_PARAMS;

    AWS_ST_HTTP_REQUEST_CHUNK             :: HTTP_REQUEST_CHUNK;

    AWS_ST_HTTP_REQUEST_EVENT             :: HTTP_REQUEST_EVENT;

    AWS_ST_CANONICAL_REQUEST_HEADERS      :: CANONICAL_REQUEST_HEADERS;

    AWS_ST_CANONICAL_REQUEST_QUERY_PARAMS :: CANONICAL_REQUEST_QUERY_PARAMS;

    AWS_ST_HTTP_REQUEST_TRAILING_HEADERS  :: HTTP_REQUEST_TRAILING_HEADERS;
}

/**
* Controls if signing adds a header containing the canonical request's body value
*/
aws_signed_body_header_type :: enum s32 {
    NONE                 :: 0;

    X_AMZ_CONTENT_SHA256 :: 1;

    AWS_SBHT_NONE                 :: NONE;

    AWS_SBHT_X_AMZ_CONTENT_SHA256 :: X_AMZ_CONTENT_SHA256;
}

/**
* A configuration structure for use in AWS-related signing.  Currently covers sigv4 only, but is not required to.
*/
aws_signing_config_aws :: struct {
    /**
    * What kind of config structure is this?
    */
    config_type:           aws_signing_config_type;

    /**
    * What signing algorithm to use.
    */
    algorithm:             aws_signing_algorithm;

    /**
    * What sort of signature should be computed?
    */
    signature_type:        aws_signature_type;

    /*
    * Region-related configuration
    *   (1) If Sigv4, the region to sign against
    *   (2) If Sigv4a, the value of the X-amzn-region-set header (added in signing)
    */
    region:                aws_byte_cursor;

    /**
    * name of service to sign a request for
    */
    service:               aws_byte_cursor;

    /**
    * Raw date to use during the signing process.
    */
    date:                  aws_date_time;

    /**
    * Optional function to control which headers are a part of the canonical request.
    * Skipping auth-required headers will result in an unusable signature.  Headers injected by the signing process
    * are not skippable.
    *
    * This function does not override the internal check function (x-amzn-trace-id, user-agent), but rather
    * supplements it.  In particular, a header will get signed if and only if it returns true to both
    * the internal check (skips x-amzn-trace-id, user-agent) and this function (if defined).
    */
    should_sign_header:    aws_should_sign_header_fn;
    should_sign_header_ud: *void;

    flags:                 struct {
        /**
        * We assume the uri will be encoded once in preparation for transmission.  Certain services
        * do not decode before checking signature, requiring us to actually double-encode the uri in the canonical
        * request in order to pass a signature check.
        */
        use_double_uri_encode:     u32;

        /**
        * Controls whether or not the uri paths should be normalized when building the canonical request
        */
        #place use_double_uri_encode; /*bitfield 1*/ should_normalize_uri_path: u32;

        /**
        * Controls whether "X-Amz-Security-Token" is omitted from the canonical request.
        * "X-Amz-Security-Token" is added during signing, as a header or
        * query param, when credentials have a session token.
        * If false (the default), this parameter is included in the canonical request.
        * If true, this parameter is still added, but omitted from the canonical request.
        */
        #place use_double_uri_encode; /*bitfield 2*/ omit_session_token:        u32;
    };

    /**
    * Optional string to use as the canonical request's body value.
    * If string is empty, a value will be calculated from the payload during signing.
    * Typically, this is the SHA-256 of the (request/chunk/event) payload, written as lowercase hex.
    * If this has been precalculated, it can be set here. Special values used by certain services can also be set
    * (e.g. "UNSIGNED-PAYLOAD" "STREAMING-AWS4-HMAC-SHA256-PAYLOAD" "STREAMING-AWS4-HMAC-SHA256-EVENTS").
    */
    signed_body_value:     aws_byte_cursor;

    /**
    * Controls what body "hash" header, if any, should be added to the canonical request and the signed request:
    *   AWS_SBHT_NONE - no header should be added
    *   AWS_SBHT_X_AMZ_CONTENT_SHA256 - the body "hash" should be added in the X-Amz-Content-Sha256 header
    */
    signed_body_header:    aws_signed_body_header_type;

    /*
    * AWS Credentials to sign with.  If Sigv4a is the algorithm and the credentials supplied are not ecc-based,
    * a temporary ecc-based credentials object will be built and used instead.
    */
    credentials:           *aws_credentials;

    aws_credentials_provider :: struct {}
    /*
    * AWS credentials provider to fetch credentials from.  If the signing algorithm is asymmetric sigv4, then the
    * ecc-based credentials will be derived from the fetched credentials.
    */
    credentials_provider:  *aws_credentials_provider;

    /**
    * If non-zero and the signing transform is query param, then signing will add X-Amz-Expires to the query
    * string, equal to the value specified here.  If this value is zero or if header signing is being used then
    * this parameter has no effect.
    */
    expiration_in_seconds: u64;
}

AWS_COMMON_HASH_TABLE_ITER :: enum s32 {
    CONTINUE :: 1;
    DELETE   :: 2;
    ERROR    :: 4;

    AWS_COMMON_HASH_TABLE_ITER_CONTINUE :: CONTINUE;
    AWS_COMMON_HASH_TABLE_ITER_DELETE   :: DELETE;
    AWS_COMMON_HASH_TABLE_ITER_ERROR    :: ERROR;
}

/**
* Hash table data structure. This module provides an automatically resizing
* hash table implementation for general purpose use. The hash table stores a
* mapping between void * keys and values; it is expected that in most cases,
* these will point to a structure elsewhere in the heap, instead of inlining a
* key or value into the hash table element itself.
*
* Currently, this hash table implements a variant of robin hood hashing, but
* we do not guarantee that this won't change in the future.
*
* Associated with each hash function are four callbacks:
*
*   hash_fn - A hash function from the keys to a uint64_t. It is critical that
*      the hash function for a key does not change while the key is in the hash
*      table; violating this results in undefined behavior. Collisions are
*      tolerated, though naturally with reduced performance.
*
*   equals_fn - An equality comparison function. This function must be
*      reflexive and consistent with hash_fn.
*
*   destroy_key_fn, destroy_value_fn - Optional callbacks invoked when the
*      table is cleared or cleaned up and at the caller's option when an element
*      is removed from the table. Either or both may be set to NULL, which
*      has the same effect as a no-op destroy function.
*
* This datastructure can be safely moved between threads, subject to the
* requirements of the underlying allocator. It is also safe to invoke
* non-mutating operations on the hash table from multiple threads. A suitable
* memory barrier must be used when transitioning from single-threaded mutating
* usage to multithreaded usage.
*/
hash_table_state :: struct {}
aws_hash_table :: struct {
    p_impl: *hash_table_state;
}

/**
* Represents an element in the hash table. Various operations on the hash
* table may provide pointers to elements stored within the hash table;
* generally, calling code may alter value, but must not alter key (or any
* information used to compute key's hash code).
*
* Pointers to elements within the hash are invalidated whenever an operation
* which may change the number of elements in the hash is invoked (i.e. put,
* delete, clear, and clean_up), regardless of whether the number of elements
* actually changes.
*/
aws_hash_element :: struct {
    key:   *void;
    value: *void;
}

aws_hash_iter_status :: enum s32 {
    DONE          :: 0;
    DELETE_CALLED :: 1;
    READY_FOR_USE :: 2;

    AWS_HASH_ITER_STATUS_DONE          :: DONE;
    AWS_HASH_ITER_STATUS_DELETE_CALLED :: DELETE_CALLED;
    AWS_HASH_ITER_STATUS_READY_FOR_USE :: READY_FOR_USE;
}

aws_hash_iter :: struct {
    map:      *aws_hash_table;
    element:  aws_hash_element;
    slot:     u64;
    limit:    u64;
    status:   aws_hash_iter_status;

    /*
    * Reserving extra fields for binary compatibility with future expansion of
    * iterator in case hash table implementation changes.
    */
    unused_0: s32;
    unused_1: *void;
    unused_2: *void;
}

/**
* Prototype for a key hashing function pointer.
*/
aws_hash_fn :: #type (key: *void) -> u64 #c_call;

/**
* Prototype for a hash table equality check function pointer.
*
* This type is usually used for a function that compares two hash table
* keys, but note that the same type is used for a function that compares
* two hash table values in aws_hash_table_eq.
*
* Equality functions used in a hash table must be be reflexive (a == a),
* symmetric (a == b => b == a), transitive (a == b, b == c => a == c)
* and consistent (result does not change with time).
*/
aws_hash_callback_eq_fn :: #type (a: *void, b: *void) -> bool #c_call;

/**
* Prototype for a hash table key or value destructor function pointer.
*
* This function is used to destroy elements in the hash table when the
* table is cleared or cleaned up.
*
* Note that functions which remove individual elements from the hash
* table provide options of whether or not to invoke the destructors
* on the key and value of a removed element.
*/
aws_hash_callback_destroy_fn :: #type (key_or_value: *void) -> void #c_call;

aws_simple_completion_callback :: #type (unknown0: *void) -> void #c_call;

/*
* A utility type for making ref-counted types, reminiscent of std::shared_ptr in C++
*/
aws_ref_count :: struct {
    ref_count:  aws_atomic_var;
    object:     *void;
    on_zero_fn: aws_simple_completion_callback;
}

aws_shutdown_callback_options :: struct {
    shutdown_callback_fn:        aws_simple_completion_callback;
    shutdown_callback_user_data: *void;
}

aws_io_event_type :: enum s32 {
    READABLE       :: 1;
    WRITABLE       :: 2;
    REMOTE_HANG_UP :: 4;
    CLOSED         :: 8;
    ERROR          :: 16;

    AWS_IO_EVENT_TYPE_READABLE       :: READABLE;
    AWS_IO_EVENT_TYPE_WRITABLE       :: WRITABLE;
    AWS_IO_EVENT_TYPE_REMOTE_HANG_UP :: REMOTE_HANG_UP;
    AWS_IO_EVENT_TYPE_CLOSED         :: CLOSED;
    AWS_IO_EVENT_TYPE_ERROR          :: ERROR;
}

aws_event_loop_on_event_fn :: #type (event_loop: *aws_event_loop, handle: *aws_io_handle, events: s32, user_data: *void) -> void #c_call;

aws_event_loop_vtable :: struct {
    destroy:                    #type (event_loop: *aws_event_loop) -> void #c_call;
    run:                        #type (event_loop: *aws_event_loop) -> s32 #c_call;
    stop:                       #type (event_loop: *aws_event_loop) -> s32 #c_call;
    wait_for_stop_completion:   #type (event_loop: *aws_event_loop) -> s32 #c_call;
    schedule_task_now:          #type (event_loop: *aws_event_loop, task: *aws_task) -> void #c_call;
    schedule_task_future:       #type (event_loop: *aws_event_loop, task: *aws_task, run_at_nanos: u64) -> void #c_call;
    cancel_task:                #type (event_loop: *aws_event_loop, task: *aws_task) -> void #c_call;

    subscribe_to_io_events:     #type (event_loop: *aws_event_loop, handle: *aws_io_handle, events: s32, on_event: aws_event_loop_on_event_fn, user_data: *void) -> s32 #c_call;

    unsubscribe_from_io_events: #type (event_loop: *aws_event_loop, handle: *aws_io_handle) -> s32 #c_call;
    free_io_event_resources:    #type (user_data: *void) -> void #c_call;
    is_on_callers_thread:       #type (event_loop: *aws_event_loop) -> bool #c_call;
}

aws_event_loop :: struct {
    vtable:                   *aws_event_loop_vtable;
    alloc:                    *aws_allocator;
    clock:                    aws_io_clock_fn;
    local_data:               aws_hash_table;
    current_load_factor:      aws_atomic_var;
    latest_tick_start:        u64;
    current_tick_latency_sum: u64;
    next_flush_time:          aws_atomic_var;
    impl_data:                *void;
}

aws_event_loop_on_local_object_removed_fn :: #type (unknown0: *aws_event_loop_local_object) -> void #c_call;

aws_event_loop_local_object :: struct {
    key:               *void;
    object:            *void;
    on_object_removed: aws_event_loop_on_local_object_removed_fn;
}

aws_event_loop_options :: struct {
    clock:          aws_io_clock_fn;
    thread_options: *aws_thread_options;
}

aws_new_event_loop_fn :: #type (alloc: *aws_allocator, options: *aws_event_loop_options, new_loop_user_data: *void) -> *aws_event_loop #c_call;

aws_event_loop_group :: struct {
    allocator:        *aws_allocator;
    event_loops:      aws_array_list;
    ref_count:        aws_ref_count;
    shutdown_options: aws_shutdown_callback_options;
}

aws_address_record_type :: enum s32 {
    A    :: 0;

    AAAA :: 1;

    AWS_ADDRESS_RECORD_TYPE_A    :: A;

    AWS_ADDRESS_RECORD_TYPE_AAAA :: AAAA;
}

aws_get_host_address_flags :: enum s32 {
    A    :: 1;

    AAAA :: 2;

    AWS_GET_HOST_ADDRESS_COUNT_RECORD_TYPE_A    :: A;

    AWS_GET_HOST_ADDRESS_COUNT_RECORD_TYPE_AAAA :: AAAA;
}

aws_host_address :: struct {
    allocator:                *aws_allocator;
    host:                     *aws_string;
    address:                  *aws_string;
    record_type:              aws_address_record_type;
    expiry:                   u64;

    /* This next section is strictly for mitigating the impact of sticky hosts that aren't performing well. */
    /*for use in DNS-based load balancing.*/
    use_count:                u64;

    /* give a hint on when to remove a bad host from service. */
    connection_failure_count: u64;

    /* we don't implement this yet, but we will asap. */
    weight:                   u8;
}

/**
* Invoked once an address has been resolved for host. The type in host_addresses is struct aws_host_address (by-value).
* The caller does not own this memory and you must copy the host address before returning from this function if you
* plan to use it later. For convenience, we've provided the aws_host_address_copy() and aws_host_address_clean_up()
* functions.
*/
aws_on_host_resolved_result_fn :: #type (resolver: *aws_host_resolver, host_name: *aws_string, err_code: s32, host_addresses: *aws_array_list, user_data: *void) -> void #c_call;

/**
* Function signature for configuring your own resolver (the default just uses getaddrinfo()). The type in
* output_addresses is struct aws_host_address (by-value). We assume this function blocks, hence this absurdly
* complicated design.
*/
aws_resolve_host_implementation_fn :: #type (allocator: *aws_allocator, host_name: *aws_string, output_addresses: *aws_array_list, user_data: *void) -> s32 #c_call;

aws_host_resolution_config :: struct {
    impl:                 aws_resolve_host_implementation_fn;
    max_ttl:              u64;
    impl_data:            *void;
    resolve_frequency_ns: u64; /* 0 defaults to 1 second interval */
}

aws_host_listener :: struct {}

aws_host_listener_options :: struct {}

aws_host_resolver_purge_host_options :: struct {
    /* the host to purge the cache for */
    host:                            *aws_string;

    /* Callback to invoke when the purge is complete */
    on_host_purge_complete_callback: aws_simple_completion_callback;

    /* user_data will be passed as it is in the callback. */
    user_data:                       *void;
}

/** should you absolutely disdain the default implementation, feel free to implement your own. */
aws_host_resolver_vtable :: struct {
    /** clean up everything you allocated, but not resolver itself. */
    destroy:                   #type (resolver: *aws_host_resolver) -> void #c_call;

    /** resolve the host by host_name, the user owns host_name, so it needs to be copied if you persist it,
    * invoke res with the result. This function should never block. */
    resolve_host:              #type (resolver: *aws_host_resolver, host_name: *aws_string, res: aws_on_host_resolved_result_fn, config: *aws_host_resolution_config, user_data: *void) -> s32 #c_call;

    /** gives your implementation a hint that an address has some failed connections occuring. Do whatever you want (or
    * nothing) about it.
    */
    record_connection_failure: #type (resolver: *aws_host_resolver, address: *aws_host_address) -> s32 #c_call;

    /**
    * @Deprecated Use purge_cache_with_callback instead
    * wipe out anything you have cached. */
    purge_cache:               #type (resolver: *aws_host_resolver) -> s32 #c_call;

    /** wipe out anything you have cached. */
    purge_cache_with_callback: #type (resolver: *aws_host_resolver, on_purge_cache_complete_callback: aws_simple_completion_callback, user_data: *void) -> s32 #c_call;

    /** wipe out anything cached for a specific host */
    purge_host_cache:          #type (resolver: *aws_host_resolver, options: *aws_host_resolver_purge_host_options) -> s32 #c_call;

    /** get number of addresses for a given host. */
    get_host_address_count:    #type (resolver: *aws_host_resolver, host_name: *aws_string, flags: u32) -> u64 #c_call;
}

aws_host_resolver :: struct {
    allocator:        *aws_allocator;
    impl:             *void;
    vtable:           *aws_host_resolver_vtable;
    ref_count:        aws_ref_count;
    shutdown_options: aws_shutdown_callback_options;
}

aws_host_resolver_default_options :: struct {
    max_entries:              u64;
    el_group:                 *aws_event_loop_group;
    shutdown_options:         *aws_shutdown_callback_options;
    system_clock_override_fn: aws_io_clock_fn;
}

/**
* Generic event function for channel lifecycle events.
*
* Callbacks are provided for:
*   (1) Channel creation
*   (2) Channel setup - If TLS is being used, this function is called once the socket has connected, the channel has
* been initialized, and TLS has been successfully negotiated. A TLS handler has already been added to the channel. If
* TLS negotiation fails, this function will be called with the corresponding error code. If TLS is not being used, this
* function is called once the socket has connected and the channel has been initialized.
*   (3) Channel shutdown
*
* These callbacks are always invoked within the thread of the event-loop that the channel is assigned to.
*
* This function does NOT always imply "success" -- if error_code is AWS_OP_SUCCESS then everything was successful,
* otherwise an error condition occurred.
*/
aws_client_bootstrap_on_channel_event_fn :: #type (bootstrap: *aws_client_bootstrap, error_code: s32, channel: *aws_channel, user_data: *void) -> void #c_call;

/**
* If ALPN is being used this function will be invoked by the channel once an ALPN message is received. The returned
* channel_handler will be added to, and managed by, the channel.
*/
aws_channel_on_protocol_negotiated_fn :: #type (new_slot: *aws_channel_slot, protocol: *aws_byte_buf, user_data: *void) -> *aws_channel_handler #c_call;

/**
* Called after client bootstrap has been completely cleaned up, after its last refcount is released.
*/
aws_client_bootstrap_shutdown_complete_fn :: #type (user_data: *void) -> void #c_call;

/**
* aws_client_bootstrap handles creation and setup of channels that communicate via socket with a specific endpoint.
*/
aws_client_bootstrap :: struct {
    allocator:              *aws_allocator;
    event_loop_group:       *aws_event_loop_group;
    host_resolver:          *aws_host_resolver;
    host_resolver_config:   aws_host_resolution_config;
    on_protocol_negotiated: aws_channel_on_protocol_negotiated_fn;
    ref_count:              aws_ref_count;
    on_shutdown_complete:   aws_client_bootstrap_shutdown_complete_fn;
    user_data:              *void;
}

/**
* aws_client_bootstrap creation options.
*/
aws_client_bootstrap_options :: struct {
    /* Required. Must outlive the client bootstrap. */
    event_loop_group:       *aws_event_loop_group;

    /* Required. Must outlive the client bootstrap. */
    host_resolver:          *aws_host_resolver;

    /* Optional. If none is provided then default settings are used.
    * This object is deep-copied by bootstrap.
    * */
    host_resolution_config: *aws_host_resolution_config;

    /* Optional. If provided, callback is invoked when client bootstrap has completely shut down. */
    on_shutdown_complete:   aws_client_bootstrap_shutdown_complete_fn;

    /* Optional. Passed to callbacks */
    user_data:              *void;
}

/**
* If TLS is being used, this function is called once the socket has received an incoming connection, the channel has
* been initialized, and TLS has been successfully negotiated. A TLS handler has already been added to the channel. If
* TLS negotiation fails, this function will be called with the corresponding error code.
*
* If TLS is not being used, this function is called once the socket has received an incoming connection and the channel
* has been initialized.
*
* This function is always called within the thread of the event-loop that the new channel is assigned to upon success.
*
* On failure, the channel might not be assigned to an event loop yet, and will thus be invoked on the listener's
* event-loop thread.
*
* This function does NOT mean "success", if error_code is AWS_OP_SUCCESS then everything was successful, otherwise an
* error condition occurred.
*
* If an error occurred, you do not need to shutdown the channel. The `aws_channel_client_shutdown_callback` will be
* invoked once the channel has finished shutting down.
*/
aws_server_bootstrap_on_accept_channel_setup_fn :: #type (bootstrap: *aws_server_bootstrap, error_code: s32, channel: *aws_channel, user_data: *void) -> void #c_call;

/**
* Once the channel shuts down, this function will be invoked within the thread of
* the event-loop that the channel is assigned to.
*
* Note: this function is only invoked if the channel was successfully setup,
* e.g. aws_server_bootstrap_on_accept_channel_setup_fn() was invoked without an error code.
*/
aws_server_bootstrap_on_accept_channel_shutdown_fn :: #type (bootstrap: *aws_server_bootstrap, error_code: s32, channel: *aws_channel, user_data: *void) -> void #c_call;

/**
* Once the server listener socket is finished destroying, and all the existing connections are closed, this fuction
* will be invoked.
*/
aws_server_bootstrap_on_server_listener_destroy_fn :: #type (bootstrap: *aws_server_bootstrap, user_data: *void) -> void #c_call;

/**
* aws_server_bootstrap manages listening sockets, creating and setting up channels to handle each incoming connection.
*/
aws_server_bootstrap :: struct {
    allocator:              *aws_allocator;
    event_loop_group:       *aws_event_loop_group;
    on_protocol_negotiated: aws_channel_on_protocol_negotiated_fn;
    ref_count:              aws_ref_count;
}

/**
* Socket-based channel creation options.
*
* bootstrap - configs name resolution and which event loop group the connection will be seated into
* host_name - host to connect to; if a dns address, will be resolved prior to connecting
* port - port to connect to
* socket_options - socket properties, including type (tcp vs. udp vs. unix domain) and connect timeout.  TLS
*   connections are currently restricted to tcp (AWS_SOCKET_STREAM) only.
* tls_options - (optional) tls context to apply after connection establishment.  If NULL, the connection will
*   not be protected by TLS.
* creation_callback - (optional) callback invoked when the channel is first created.  This is always right after
*   the connection was successfully established.  *Does NOT* get called if the initial connect failed.
* setup_callback - callback invoked once the channel is ready for use and TLS has been negotiated or if an error
*   is encountered
* shutdown_callback - callback invoked once the channel has shutdown.
* enable_read_back_pressure - controls whether or not back pressure will be applied in the channel
* user_data - arbitrary data to pass back to the various callbacks
* requested_event_loop - if set, the connection will be placed on the requested event loop rather than one
*  chosen internally from the bootstrap's associated event loop group.  It is an error to pass in an event loop
*  that is not associated with the bootstrap's event loop group.
*
* Immediately after the `shutdown_callback` returns, the channel is cleaned up automatically. All callbacks are invoked
* in the thread of the event-loop that the new channel is assigned to.
*
*/
aws_socket_channel_bootstrap_options :: struct {
    bootstrap:                       *aws_client_bootstrap;
    host_name:                       *u8;
    port:                            u32;
    socket_options:                  *aws_socket_options;
    tls_options:                     *aws_tls_connection_options;
    creation_callback:               aws_client_bootstrap_on_channel_event_fn;
    setup_callback:                  aws_client_bootstrap_on_channel_event_fn;
    shutdown_callback:               aws_client_bootstrap_on_channel_event_fn;
    enable_read_back_pressure:       bool;
    user_data:                       *void;
    requested_event_loop:            *aws_event_loop;
    host_resolution_override_config: *aws_host_resolution_config;
}

/**
* Arguments to setup a server socket listener which will also negotiate and configure TLS.
* This creates a socket listener bound to `host` and 'port' using socket options `options`, and TLS options
* `tls_options`. `incoming_callback` will be invoked once an incoming channel is ready for use and TLS is
* finished negotiating, or if an error is encountered. `shutdown_callback` will be invoked once the channel has
* shutdown. `destroy_callback` will be invoked after the server socket listener is destroyed, and all associated
* connections and channels have finished shutting down. Immediately after the `shutdown_callback` returns, the channel
* is cleaned up automatically. All callbacks are invoked in the thread of the event-loop that listener is assigned to.
*
* Upon shutdown of your application, you'll want to call `aws_server_bootstrap_destroy_socket_listener` with the return
* value from this function.
*
* The socket type in `options` must be AWS_SOCKET_STREAM if tls_options is set.
* DTLS is not currently supported for tls.
*/
aws_server_socket_channel_bootstrap_options :: struct {
    bootstrap:                 *aws_server_bootstrap;
    host_name:                 *u8;
    port:                      u32;
    socket_options:            *aws_socket_options;
    tls_options:               *aws_tls_connection_options;
    incoming_callback:         aws_server_bootstrap_on_accept_channel_setup_fn;
    shutdown_callback:         aws_server_bootstrap_on_accept_channel_shutdown_fn;
    destroy_callback:          aws_server_bootstrap_on_server_listener_destroy_fn;
    enable_read_back_pressure: bool;
    user_data:                 *void;
}

aws_pkcs11_session :: struct {}

aws_tls_versions :: enum s32 {
    SSLv3                :: 0;
    TLSv1                :: 1;
    TLSv1_1              :: 2;
    TLSv1_2              :: 3;
    TLSv1_3              :: 4;
    TLS_VER_SYS_DEFAULTS :: 128;

    AWS_IO_SSLv3                :: SSLv3;
    AWS_IO_TLSv1                :: TLSv1;
    AWS_IO_TLSv1_1              :: TLSv1_1;
    AWS_IO_TLSv1_2              :: TLSv1_2;
    AWS_IO_TLSv1_3              :: TLSv1_3;
    AWS_IO_TLS_VER_SYS_DEFAULTS :: TLS_VER_SYS_DEFAULTS;
}

aws_tls_cipher_pref :: enum s32 {
    SYSTEM_DEFAULT              :: 0;

    KMS_PQ_TLSv1_0_2019_06      :: 1;
    KMS_PQ_SIKE_TLSv1_0_2019_11 :: 2;
    KMS_PQ_TLSv1_0_2020_02      :: 3;
    KMS_PQ_SIKE_TLSv1_0_2020_02 :: 4;
    KMS_PQ_TLSv1_0_2020_07      :: 5;

    PQ_TLSv1_0_2021_05          :: 6;

    END_RANGE                   :: 65535;

    AWS_IO_TLS_CIPHER_PREF_SYSTEM_DEFAULT              :: SYSTEM_DEFAULT;

    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_TLSv1_0_2019_06      :: KMS_PQ_TLSv1_0_2019_06;
    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_SIKE_TLSv1_0_2019_11 :: KMS_PQ_SIKE_TLSv1_0_2019_11;
    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_TLSv1_0_2020_02      :: KMS_PQ_TLSv1_0_2020_02;
    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_SIKE_TLSv1_0_2020_02 :: KMS_PQ_SIKE_TLSv1_0_2020_02;
    AWS_IO_TLS_CIPHER_PREF_KMS_PQ_TLSv1_0_2020_07      :: KMS_PQ_TLSv1_0_2020_07;

    AWS_IO_TLS_CIPHER_PREF_PQ_TLSv1_0_2021_05          :: PQ_TLSv1_0_2021_05;

    AWS_IO_TLS_CIPHER_PREF_END_RANGE                   :: END_RANGE;
}

/**
* The hash algorithm of a TLS private key operation. Any custom private key operation handlers are expected to perform
* operations on the input TLS data using the correct hash algorithm or fail the operation.
*/
aws_tls_hash_algorithm :: enum s32 {
    UNKNOWN :: 0;
    SHA1    :: 1;
    SHA224  :: 2;
    SHA256  :: 3;
    SHA384  :: 4;
    SHA512  :: 5;

    AWS_TLS_HASH_UNKNOWN :: UNKNOWN;
    AWS_TLS_HASH_SHA1    :: SHA1;
    AWS_TLS_HASH_SHA224  :: SHA224;
    AWS_TLS_HASH_SHA256  :: SHA256;
    AWS_TLS_HASH_SHA384  :: SHA384;
    AWS_TLS_HASH_SHA512  :: SHA512;
}

/**
* The signature of a TLS private key operation. Any custom private key operation handlers are expected to perform
* operations on the input TLS data using the correct signature algorithm or fail the operation.
*/
aws_tls_signature_algorithm :: enum s32 {
    UNKNOWN :: 0;
    RSA     :: 1;
    ECDSA   :: 2;

    AWS_TLS_SIGNATURE_UNKNOWN :: UNKNOWN;
    AWS_TLS_SIGNATURE_RSA     :: RSA;
    AWS_TLS_SIGNATURE_ECDSA   :: ECDSA;
}

/**
* The TLS private key operation that needs to be performed by a custom private key operation handler when making
* a connection using mutual TLS.
*/
aws_tls_key_operation_type :: enum s32 {
    UNKNOWN :: 0;
    SIGN    :: 1;
    DECRYPT :: 2;

    AWS_TLS_KEY_OPERATION_UNKNOWN :: UNKNOWN;
    AWS_TLS_KEY_OPERATION_SIGN    :: SIGN;
    AWS_TLS_KEY_OPERATION_DECRYPT :: DECRYPT;
}

aws_tls_ctx :: struct {
    alloc:     *aws_allocator;
    impl:      *void;
    ref_count: aws_ref_count;
}

/**
* Invoked upon completion of the TLS handshake. If successful error_code will be AWS_OP_SUCCESS, otherwise
* the negotiation failed and immediately after this function is invoked, the channel will be shutting down.
*/
aws_tls_on_negotiation_result_fn :: #type (handler: *aws_channel_handler, slot: *aws_channel_slot, error_code: s32, user_data: *void) -> void #c_call;

/**
* Only used if the TLS handler is the last handler in the channel. This allows you to read any data that
* was read and decrypted by the handler. If you have application protocol channel handlers, this function
* is not necessary and certainly not recommended.
*/
aws_tls_on_data_read_fn :: #type (handler: *aws_channel_handler, slot: *aws_channel_slot, buffer: *aws_byte_buf, user_data: *void) -> void #c_call;

/**
* Invoked when an error occurs in the TLS state machine AFTER the handshake has completed. This function should only
* be used in conjunction with the rules of aws_tls_on_data_read_fn.
*/
aws_tls_on_error_fn :: #type (handler: *aws_channel_handler, slot: *aws_channel_slot, err: s32, message: *u8, user_data: *void) -> void #c_call;

aws_tls_connection_options :: struct {
    /** semi-colon delimited list of protocols. Example:
    *  h2;http/1.1
    */
    alpn_list:              *aws_string;

    /**
    * Serves two purposes. If SNI is supported (hint... it is),
    * this sets the SNI extension.
    *
    * For X.509 validation this also sets the name that will be used
    * for verifying the subj alt name and common name of the peer's certificate.
    */
    server_name:            *aws_string;
    on_negotiation_result:  aws_tls_on_negotiation_result_fn;
    on_data_read:           aws_tls_on_data_read_fn;
    on_error:               aws_tls_on_error_fn;
    user_data:              *void;
    ctx:                    *aws_tls_ctx;
    advertise_alpn_message: bool;
    timeout_ms:             u32;
}

/**
* A struct containing all of the data needed for a private key operation when
* making a mutual TLS connection. This struct contains the data that needs
* to be operated on, like performing a sign operation or a decrypt operation.
*/
aws_tls_key_operation :: struct {}

aws_tls_ctx_options :: struct {
    allocator:               *aws_allocator;

    /**
    *  minimum tls version to use. If you just want us to use the
    *  system defaults, you can set: AWS_IO_TLS_VER_SYS_DEFAULTS. This
    *  has the added benefit of automatically picking up new TLS versions
    *  as your OS or distribution adds support.
    */
    minimum_tls_version:     aws_tls_versions;

    /**
    * The Cipher Preference List to use
    */
    cipher_pref:             aws_tls_cipher_pref;

    /**
    * A PEM armored PKCS#7 collection of CAs you want to trust as a string.
    * Only use this if it's a CA not currently installed on your system.
    */
    ca_file:                 aws_byte_buf;

    /**
    * Only used on Unix systems using an openssl style trust API.
    * this is typically something like /etc/pki/tls/certs/"
    */
    ca_path:                 *aws_string;

    /**
    * Sets ctx wide alpn string. This is most useful for servers.
    * This is a semi-colon delimited list. example:
    * h2;http/1.1
    */
    alpn_list:               *aws_string;

    /**
    * A PEM armored PKCS#7 certificate as a string.
    * It is supported on every operating system.
    */
    certificate:             aws_byte_buf;

    /** The path to a system
    * installed certficate/private key pair. Example:
    * CurrentUser\\MY\\<thumprint>
    */
    system_certificate_path: *u8;

    /**
    * A PEM armored PKCS#7 private key as a string.
    *
    * On windows, this field should be NULL only if you are
    * using a system installed certficate.
    */
    private_key:             aws_byte_buf;

    /** max tls fragment size. Default is the value of g_aws_channel_max_fragment_size. */
    max_fragment_size:       u64;

    /**
    * default is true for clients and false for servers.
    * You should not change this default for clients unless
    * you're testing and don't want to fool around with CA trust stores.
    * Before you release to production, you'll want to turn this back on
    * and add your custom CA to the aws_tls_ctx_options.
    *
    * If you set this in server mode, it enforces client authentication.
    */
    verify_peer:             bool;

    /**
    * For use when adding BYO_CRYPTO implementations. You can set extra data in here for use with your TLS
    * implementation.
    */
    ctx_options_extension:   *void;

    /**
    * Set if using custom private key operations.
    * See aws_custom_key_op_handler for more details
    *
    * Note: Custom key operations (and PKCS#11 integration) hasn't been tested with TLS 1.3, so don't use
    * cipher preferences that allow TLS 1.3. If this is set, we will always use non TLS 1.3 preferences.
    */
    custom_key_op_handler:   *aws_custom_key_op_handler;
}

aws_tls_negotiated_protocol_message :: struct {
    protocol: aws_byte_buf;
}

aws_tls_on_protocol_negotiated :: #type (new_slot: *aws_channel_slot, protocol: *aws_byte_buf, user_data: *void) -> *aws_channel_handler #c_call;

/**
* An enum for the current state of tls negotiation within a tls channel handler
*/
aws_tls_negotiation_status :: enum s32 {
    NONE    :: 0;
    ONGOING :: 1;
    SUCCESS :: 2;
    FAILURE :: 3;

    AWS_TLS_NEGOTIATION_STATUS_NONE    :: NONE;
    AWS_TLS_NEGOTIATION_STATUS_ONGOING :: ONGOING;
    AWS_TLS_NEGOTIATION_STATUS_SUCCESS :: SUCCESS;
    AWS_TLS_NEGOTIATION_STATUS_FAILURE :: FAILURE;
}

/**
* vtable for aws_custom_key_op_handler.
*/
aws_custom_key_op_handler_vtable :: struct {
    /**
    * Called when the a TLS handshake has an operation it needs the custom key operation handler to perform.
    * NOTE: You must call aws_tls_key_operation_complete() or aws_tls_key_operation_complete_with_error()
    * otherwise the TLS handshake will stall the TLS connection indefinitely and leak memory.
    */
    on_key_operation: #type (key_op_handler: *aws_custom_key_op_handler, operation: *aws_tls_key_operation) -> void #c_call;
}

/**
* The custom key operation that is used when performing a mutual TLS handshake. This can
* be extended to provide custom private key operations, like PKCS11 or similar.
*/
aws_custom_key_op_handler :: struct {
    /**
    * A void* intended to be populated with a reference to whatever class is extending this class. For example,
    * if you have extended aws_custom_key_op_handler with a custom struct, you would put a pointer to this struct
    * to *impl so you can retrieve it back in the vtable functions.
    */
    impl:      *void;

    /**
    * A vtable containing all of the functions the aws_custom_key_op_handler implements. Is intended to be extended.
    * NOTE: Use "aws_custom_key_op_handler_<func>" to access vtable functions.
    */
    vtable:    *aws_custom_key_op_handler_vtable;

    /**
    * A reference count for handling memory usage.
    * Use aws_custom_key_op_handler_acquire and aws_custom_key_op_handler_release to increase/decrease count.
    */
    ref_count: aws_ref_count;
}

/**
* This struct exists as a graceful way to pass many arguments when
* calling init-with-pkcs11 functions on aws_tls_ctx_options (this also makes
* it easy to introduce optional arguments in the future).
* Instances of this struct should only exist briefly on the stack.
*
* Instructions for binding this to high-level languages:
* - Python: The members of this struct should be the keyword args to the init-with-pkcs11 functions.
* - JavaScript: This should be an options map passed to init-with-pkcs11 functions.
* - Java: This should be an options class passed to init-with-pkcs11 functions.
* - C++: Same as Java
*
* Notes on integer types:
* PKCS#11 uses `unsigned long` for IDs, handles, etc but we expose them as `uint64_t` in public APIs.
* We do this because sizeof(long) is inconsistent across platform/arch/language
* (ex: always 64bit in Java, always 32bit in C on Windows, matches CPU in C on Linux and Apple).
* By using uint64_t in our public API, we can keep the careful bounds-checking all in one
* place, instead of expecting each high-level language binding to get it just right.
*/
aws_tls_ctx_pkcs11_options :: struct {
    aws_pkcs11_lib :: struct {}
    /**
    * The PKCS#11 library to use.
    * This field is required.
    */
    pkcs11_lib:               *aws_pkcs11_lib;

    /**
    * User PIN, for logging into the PKCS#11 token (UTF-8).
    * Zero out to log into a token with a "protected authentication path".
    */
    user_pin:                 aws_byte_cursor;

    /**
    * ID of slot containing PKCS#11 token.
    * If set to NULL, the token will be chosen based on other criteria
    * (such as token label).
    */
    slot_id:                  *u64;

    /**
    * Label of PKCS#11 token to use.
    * If zeroed out, the token will be chosen based on other criteria
    * (such as slot ID).
    */
    token_label:              aws_byte_cursor;

    /**
    * Label of private key object on PKCS#11 token (UTF-8).
    * If zeroed out, the private key will be chosen based on other criteria
    * (such as being the only available private key on the token).
    */
    private_key_object_label: aws_byte_cursor;

    /**
    * Certificate's file path on disk (UTF-8).
    * The certificate must be PEM formatted and UTF-8 encoded.
    * Zero out if passing in certificate by some other means (such as file contents).
    */
    cert_file_path:           aws_byte_cursor;

    /**
    * Certificate's file contents (UTF-8).
    * The certificate must be PEM formatted and UTF-8 encoded.
    * Zero out if passing in certificate by some other means (such as file path).
    */
    cert_file_contents:       aws_byte_cursor;
}

#scope_file

aws_cpp_sdk_s3 :: #library,no_dll "win/aws-cpp-sdk-s3";
