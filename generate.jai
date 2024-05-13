#import "Bindings_Generator";
#import "Basic";
#import "File";
#import "String";
#import "BuildCpp";
#import "File_Utilities";

#run {
    using opts: Generate_Bindings_Options;
    array_add(*system_include_paths, GENERATOR_DEFAULT_SYSTEM_INCLUDE_PATH);

    // strip_flags = .FUNCTIONS_WITH_VALIST;

    array_add(*extra_clang_arguments, "-DBUILD_ONLY=\"s3\"", "-DJAI_GENERATOR");

    array_add(*libpaths, "win");
    array_add(*libnames, "aws-cpp-sdk-s3");
    array_add(*include_paths, "aws-sdk-cpp/src/aws-cpp-sdk-core/include");
    array_add(*include_paths, "aws-sdk-cpp/crt/aws-crt-cpp/include");
    array_add(*include_paths, "aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include");
    array_add(*include_paths, "aws-sdk-cpp/cmake-build-release/crt/aws-crt-cpp/crt/aws-c-common/generated/include");
    array_add(*include_paths, "aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-io/include");
    array_add(*include_paths, "aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-mqtt/include");
    array_add(*include_paths, "aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-auth/include");
    array_add(*include_paths, "aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-sdkutils/include");
    array_add(*include_paths, "aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-lc/include");
    files := string.[
        "aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/Aws.h",
        "aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/Globals.h",
        "aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/AmazonSerializableWebServiceRequest.h",
        "aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/AmazonStreamingWebServiceRequest.h",
        "aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/AmazonWebServiceRequest.h",
        "aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/AmazonWebServiceResult.h",
    ];
    
    // array_add(*source_files, "C:/jai/modules/Bindings_Generator/bin/clang/16/include/immintrin.h");
    // array_add(*source_files, "C:/jai/modules/Bindings_Generator/bin/clang/16/include/intrin.h");
    // array_add(*source_files, "C:/jai/modules/Bindings_Generator/bin/clang/16/include/bmi2intrin.h");

    // array_add(*source_files, "aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-lc/crypto/fipsmodule/cpucap/cpu_intel.c");

    for file: files {
        if !ends_with(file, ".h") {
            continue;
        }

        print("%\n", file);
        array_add(*source_files, tprint("%/%", #filepath, file));
    }

    array_add(*system_include_paths, "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt");
    array_add(*system_include_paths, "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\um");
    array_add(*system_include_paths, "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\shared");
    array_add(*system_include_paths, "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.31.31103\\include");

    array_add(*extra_clang_arguments, "-x", "c++");
    generate_compile_time_struct_checks = false;

//     footer = #string DONE
// FILE :: *void;
// time_t :: s64;
// SOCKET :: u64;
// ADDRESS_FAMILY :: u16;
// fd_set :: struct {
//     fd_count: u32;
//     fd_array: [64] SOCKET;
// }
// sockaddr :: struct {
//     sa_family: ADDRESS_FAMILY;

//     sa_data:   [14] u8;
// }
// DONE

    // array_add(*system_include_paths, "C:/cygwin64/usr/include");
    array_add(*system_include_paths, "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt");
    // array_add(*system_include_paths, "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.31.31103\\include");

    generate_bindings(opts, "module.jai");
}
