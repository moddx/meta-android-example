; ModuleID = 'MyComputeUnit.cpp'
source_filename = "MyComputeUnit.cpp"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%"struct.META::Core::DataSet" = type { i32, %"class.META::Core::ComputeData"* }
%"class.META::Core::ComputeData" = type { i32 (...)** }
%class.MyComputeData = type <{ %"class.META::Core::ComputeData", i32, [4 x i8] }>
%"class.std::__1::basic_string" = type { %"class.std::__1::__compressed_pair" }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >::__rep" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >::__rep" = type { %union.anon }
%union.anon = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >::__long" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >::__long" = type { i64, i64, i8* }
%class.MyComputeUnit = type { %"class.META::Core::ComputeUnit" }
%"class.META::Core::ComputeUnit" = type { i32 (...)** }
%"class.std::__1::allocator" = type { i8 }
%"struct.std::__1::__compressed_pair_elem.1" = type { i8 }
%"class.std::__1::__basic_string_common" = type { i8 }

@_ZN4META4CoreL10No_DataSetE = internal global %"struct.META::Core::DataSet" zeroinitializer, align 8
@_ZN4META4Core11ComputeData15new_ComputeDataE = global %"class.META::Core::ComputeData"* ()* @_Z16newMyComputeDatav, align 8
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTSN4META4Core11ComputeDataE = linkonce_odr constant [26 x i8] c"N4META4Core11ComputeDataE\00"
@_ZTIN4META4Core11ComputeDataE = linkonce_odr constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @_ZTSN4META4Core11ComputeDataE, i32 0, i32 0) }
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTS13MyComputeData = constant [16 x i8] c"13MyComputeData\00"
@_ZTI13MyComputeData = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @_ZTS13MyComputeData, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTIN4META4Core11ComputeDataE to i8*) }
@_ZTV13MyComputeData = unnamed_addr constant { [4 x i8*] } { [4 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTI13MyComputeData to i8*), i8* bitcast (void (%"class.std::__1::basic_string"*, %class.MyComputeData*)* @_ZNK13MyComputeData8toStringEv to i8*), i8* bitcast (void (%class.MyComputeData*, %"class.std::__1::basic_string"*)* @_ZN13MyComputeData10fromStringENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE to i8*)] }, align 8
@_ZTV13MyComputeUnit = unnamed_addr constant { [3 x i8*] } { [3 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTI13MyComputeUnit to i8*), i8* bitcast (void (%class.MyComputeUnit*, i32, %"class.META::Core::ComputeData"*, %"struct.META::Core::DataSet"*)* @_ZNK13MyComputeUnit7computeEN4META4Core7DataSetERS2_ to i8*)] }, align 8
@_ZTS13MyComputeUnit = constant [16 x i8] c"13MyComputeUnit\00"
@_ZTSN4META4Core11ComputeUnitE = linkonce_odr constant [26 x i8] c"N4META4Core11ComputeUnitE\00"
@_ZTIN4META4Core11ComputeUnitE = linkonce_odr constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @_ZTSN4META4Core11ComputeUnitE, i32 0, i32 0) }
@_ZTI13MyComputeUnit = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @_ZTS13MyComputeUnit, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTIN4META4Core11ComputeUnitE to i8*) }
@_ZTVN4META4Core11ComputeDataE = linkonce_odr unnamed_addr constant { [4 x i8*] } { [4 x i8*] [i8* null, i8* bitcast ({ i8*, i8* }* @_ZTIN4META4Core11ComputeDataE to i8*), i8* bitcast (void (%"class.std::__1::basic_string"*, %"class.META::Core::ComputeData"*)* @_ZNK4META4Core11ComputeData8toStringEv to i8*), i8* bitcast (void (%"class.META::Core::ComputeData"*, %"class.std::__1::basic_string"*)* @_ZN4META4Core11ComputeData10fromStringENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE to i8*)] }, align 8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_MyComputeUnit.cpp, i8* null }]

; Function Attrs: noinline nounwind ssp uwtable
define internal void @__cxx_global_var_init() #0 section "__TEXT,__StaticInit,regular,pure_instructions" {
  call void @_ZN4META4Core7DataSetC1Ev(%"struct.META::Core::DataSet"* @_ZN4META4CoreL10No_DataSetE)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define linkonce_odr void @_ZN4META4Core7DataSetC1Ev(%"struct.META::Core::DataSet"*) unnamed_addr #1 align 2 {
  %2 = alloca %"struct.META::Core::DataSet"*, align 8
  store %"struct.META::Core::DataSet"* %0, %"struct.META::Core::DataSet"** %2, align 8
  %3 = load %"struct.META::Core::DataSet"*, %"struct.META::Core::DataSet"** %2, align 8
  call void @_ZN4META4Core7DataSetC2Ev(%"struct.META::Core::DataSet"* %3)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define %"class.META::Core::ComputeData"* @_Z16newMyComputeDatav() #1 {
  %1 = call i8* @_Znwm(i64 16) #7
  %2 = bitcast i8* %1 to %class.MyComputeData*
  %3 = bitcast %class.MyComputeData* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 16, i32 16, i1 false)
  call void @_ZN13MyComputeDataC1Ev(%class.MyComputeData* %2) #8
  %4 = bitcast %class.MyComputeData* %2 to %"class.META::Core::ComputeData"*
  ret %"class.META::Core::ComputeData"* %4
}

; Function Attrs: nobuiltin
declare noalias i8* @_Znwm(i64) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define linkonce_odr void @_ZN13MyComputeDataC1Ev(%class.MyComputeData*) unnamed_addr #1 align 2 {
  %2 = alloca %class.MyComputeData*, align 8
  store %class.MyComputeData* %0, %class.MyComputeData** %2, align 8
  %3 = load %class.MyComputeData*, %class.MyComputeData** %2, align 8
  call void @_ZN13MyComputeDataC2Ev(%class.MyComputeData* %3) #8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @_ZN13MyComputeData10fromStringENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%class.MyComputeData*, %"class.std::__1::basic_string"*) unnamed_addr #1 align 2 {
  %3 = alloca %class.MyComputeData*, align 8
  store %class.MyComputeData* %0, %class.MyComputeData** %3, align 8
  %4 = load %class.MyComputeData*, %class.MyComputeData** %3, align 8
  %5 = call i32 @_ZNSt3__14stoiERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPmi(%"class.std::__1::basic_string"* dereferenceable(24) %1, i64* null, i32 10)
  %6 = getelementptr inbounds %class.MyComputeData, %class.MyComputeData* %4, i32 0, i32 1
  store i32 %5, i32* %6, align 8
  ret void
}

declare i32 @_ZNSt3__14stoiERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPmi(%"class.std::__1::basic_string"* dereferenceable(24), i64*, i32) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @_ZNK13MyComputeData8toStringEv(%"class.std::__1::basic_string"* noalias sret, %class.MyComputeData*) unnamed_addr #1 align 2 {
  %3 = alloca %class.MyComputeData*, align 8
  store %class.MyComputeData* %1, %class.MyComputeData** %3, align 8
  %4 = load %class.MyComputeData*, %class.MyComputeData** %3, align 8
  %5 = getelementptr inbounds %class.MyComputeData, %class.MyComputeData* %4, i32 0, i32 1
  %6 = load i32, i32* %5, align 8
  call void @_ZNSt3__19to_stringEi(%"class.std::__1::basic_string"* sret %0, i32 %6)
  ret void
}

declare void @_ZNSt3__19to_stringEi(%"class.std::__1::basic_string"* sret, i32) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @_ZNK13MyComputeUnit3fibEi(%class.MyComputeUnit*, i32) #1 align 2 {
  %3 = alloca %class.MyComputeUnit*, align 8
  %4 = alloca i32, align 4
  store %class.MyComputeUnit* %0, %class.MyComputeUnit** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.MyComputeUnit*, %class.MyComputeUnit** %3, align 8
  %6 = load i32, i32* %4, align 4
  %7 = icmp sle i32 %6, 1
  br i1 %7, label %8, label %9

; <label>:8:                                      ; preds = %2
  br label %17

; <label>:9:                                      ; preds = %2
  %10 = load i32, i32* %4, align 4
  %11 = sub nsw i32 %10, 1
  %12 = call i32 @_ZNK13MyComputeUnit3fibEi(%class.MyComputeUnit* %5, i32 %11)
  %13 = load i32, i32* %4, align 4
  %14 = sub nsw i32 %13, 2
  %15 = call i32 @_ZNK13MyComputeUnit3fibEi(%class.MyComputeUnit* %5, i32 %14)
  %16 = add nsw i32 %12, %15
  br label %17

; <label>:17:                                     ; preds = %9, %8
  %18 = phi i32 [ 1, %8 ], [ %16, %9 ]
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @_ZNK13MyComputeUnit7computeEN4META4Core7DataSetERS2_(%class.MyComputeUnit*, i32, %"class.META::Core::ComputeData"*, %"struct.META::Core::DataSet"* dereferenceable(16)) unnamed_addr #1 align 2 {
  %5 = alloca %"struct.META::Core::DataSet", align 8
  %6 = alloca %class.MyComputeUnit*, align 8
  %7 = alloca %"struct.META::Core::DataSet"*, align 8
  %8 = alloca %class.MyComputeData*, align 8
  %9 = alloca i32, align 4
  %10 = alloca %class.MyComputeData*, align 8
  %11 = bitcast %"struct.META::Core::DataSet"* %5 to { i32, %"class.META::Core::ComputeData"* }*
  %12 = getelementptr inbounds { i32, %"class.META::Core::ComputeData"* }, { i32, %"class.META::Core::ComputeData"* }* %11, i32 0, i32 0
  store i32 %1, i32* %12, align 8
  %13 = getelementptr inbounds { i32, %"class.META::Core::ComputeData"* }, { i32, %"class.META::Core::ComputeData"* }* %11, i32 0, i32 1
  store %"class.META::Core::ComputeData"* %2, %"class.META::Core::ComputeData"** %13, align 8
  store %class.MyComputeUnit* %0, %class.MyComputeUnit** %6, align 8
  store %"struct.META::Core::DataSet"* %3, %"struct.META::Core::DataSet"** %7, align 8
  %14 = load %class.MyComputeUnit*, %class.MyComputeUnit** %6, align 8
  %15 = getelementptr inbounds %"struct.META::Core::DataSet", %"struct.META::Core::DataSet"* %5, i32 0, i32 1
  %16 = load %"class.META::Core::ComputeData"*, %"class.META::Core::ComputeData"** %15, align 8
  %17 = icmp eq %"class.META::Core::ComputeData"* %16, null
  br i1 %17, label %22, label %18

; <label>:18:                                     ; preds = %4
  %19 = bitcast %"class.META::Core::ComputeData"* %16 to i8*
  %20 = call i8* @__dynamic_cast(i8* %19, i8* bitcast ({ i8*, i8* }* @_ZTIN4META4Core11ComputeDataE to i8*), i8* bitcast ({ i8*, i8*, i8* }* @_ZTI13MyComputeData to i8*), i64 0) #8
  %21 = bitcast i8* %20 to %class.MyComputeData*
  br label %23

; <label>:22:                                     ; preds = %4
  br label %23

; <label>:23:                                     ; preds = %22, %18
  %24 = phi %class.MyComputeData* [ %21, %18 ], [ null, %22 ]
  store %class.MyComputeData* %24, %class.MyComputeData** %8, align 8
  %25 = load %class.MyComputeData*, %class.MyComputeData** %8, align 8
  %26 = getelementptr inbounds %class.MyComputeData, %class.MyComputeData* %25, i32 0, i32 1
  %27 = load i32, i32* %26, align 8
  %28 = call i32 @_ZNK13MyComputeUnit3fibEi(%class.MyComputeUnit* %14, i32 %27)
  store i32 %28, i32* %9, align 4
  %29 = getelementptr inbounds %"struct.META::Core::DataSet", %"struct.META::Core::DataSet"* %5, i32 0, i32 0
  %30 = load i32, i32* %29, align 8
  %31 = load %"struct.META::Core::DataSet"*, %"struct.META::Core::DataSet"** %7, align 8
  %32 = getelementptr inbounds %"struct.META::Core::DataSet", %"struct.META::Core::DataSet"* %31, i32 0, i32 0
  store i32 %30, i32* %32, align 8
  %33 = call i8* @_Znwm(i64 16) #7
  %34 = bitcast i8* %33 to %class.MyComputeData*
  %35 = bitcast %class.MyComputeData* %34 to i8*
  call void @llvm.memset.p0i8.i64(i8* %35, i8 0, i64 16, i32 16, i1 false)
  call void @_ZN13MyComputeDataC1Ev(%class.MyComputeData* %34) #8
  store %class.MyComputeData* %34, %class.MyComputeData** %10, align 8
  %36 = load i32, i32* %9, align 4
  %37 = load %class.MyComputeData*, %class.MyComputeData** %10, align 8
  %38 = getelementptr inbounds %class.MyComputeData, %class.MyComputeData* %37, i32 0, i32 1
  store i32 %36, i32* %38, align 8
  %39 = load %class.MyComputeData*, %class.MyComputeData** %10, align 8
  %40 = bitcast %class.MyComputeData* %39 to %"class.META::Core::ComputeData"*
  %41 = load %"struct.META::Core::DataSet"*, %"struct.META::Core::DataSet"** %7, align 8
  %42 = getelementptr inbounds %"struct.META::Core::DataSet", %"struct.META::Core::DataSet"* %41, i32 0, i32 1
  store %"class.META::Core::ComputeData"* %40, %"class.META::Core::ComputeData"** %42, align 8
  ret void
}

; Function Attrs: nounwind readonly
declare i8* @__dynamic_cast(i8*, i8*, i8*, i64) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define linkonce_odr void @_ZN4META4Core7DataSetC2Ev(%"struct.META::Core::DataSet"*) unnamed_addr #1 align 2 {
  %2 = alloca %"struct.META::Core::DataSet"*, align 8
  store %"struct.META::Core::DataSet"* %0, %"struct.META::Core::DataSet"** %2, align 8
  %3 = load %"struct.META::Core::DataSet"*, %"struct.META::Core::DataSet"** %2, align 8
  %4 = getelementptr inbounds %"struct.META::Core::DataSet", %"struct.META::Core::DataSet"* %3, i32 0, i32 0
  store i32 -1, i32* %4, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define linkonce_odr void @_ZN13MyComputeDataC2Ev(%class.MyComputeData*) unnamed_addr #1 align 2 {
  %2 = alloca %class.MyComputeData*, align 8
  store %class.MyComputeData* %0, %class.MyComputeData** %2, align 8
  %3 = load %class.MyComputeData*, %class.MyComputeData** %2, align 8
  %4 = bitcast %class.MyComputeData* %3 to %"class.META::Core::ComputeData"*
  call void @_ZN4META4Core11ComputeDataC2Ev(%"class.META::Core::ComputeData"* %4) #8
  %5 = bitcast %class.MyComputeData* %3 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [4 x i8*] }, { [4 x i8*] }* @_ZTV13MyComputeData, i32 0, inrange i32 0, i32 2) to i32 (...)**), i32 (...)*** %5, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define linkonce_odr void @_ZN4META4Core11ComputeDataC2Ev(%"class.META::Core::ComputeData"*) unnamed_addr #1 align 2 {
  %2 = alloca %"class.META::Core::ComputeData"*, align 8
  store %"class.META::Core::ComputeData"* %0, %"class.META::Core::ComputeData"** %2, align 8
  %3 = load %"class.META::Core::ComputeData"*, %"class.META::Core::ComputeData"** %2, align 8
  %4 = bitcast %"class.META::Core::ComputeData"* %3 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [4 x i8*] }, { [4 x i8*] }* @_ZTVN4META4Core11ComputeDataE, i32 0, inrange i32 0, i32 2) to i32 (...)**), i32 (...)*** %4, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define linkonce_odr void @_ZNK4META4Core11ComputeData8toStringEv(%"class.std::__1::basic_string"* noalias sret, %"class.META::Core::ComputeData"*) unnamed_addr #1 align 2 {
  %3 = alloca %"class.std::__1::allocator"*, align 8
  %4 = alloca %"struct.std::__1::__compressed_pair_elem.1"*, align 8
  %5 = alloca %"struct.std::__1::__compressed_pair_elem"*, align 8
  %6 = alloca %"class.std::__1::__compressed_pair"*, align 8
  %7 = alloca %"class.std::__1::__compressed_pair"*, align 8
  %8 = alloca %"class.std::__1::basic_string"*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca %"class.std::__1::basic_string"*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca %"class.META::Core::ComputeData"*, align 8
  store %"class.META::Core::ComputeData"* %1, %"class.META::Core::ComputeData"** %12, align 8
  %13 = load %"class.META::Core::ComputeData"*, %"class.META::Core::ComputeData"** %12, align 8
  store %"class.std::__1::basic_string"* %0, %"class.std::__1::basic_string"** %10, align 8
  store i8* null, i8** %11, align 8
  %14 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %10, align 8
  %15 = load i8*, i8** %11, align 8
  store %"class.std::__1::basic_string"* %14, %"class.std::__1::basic_string"** %8, align 8
  store i8* %15, i8** %9, align 8
  %16 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %8, align 8
  %17 = bitcast %"class.std::__1::basic_string"* %16 to %"class.std::__1::__basic_string_common"*
  %18 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %16, i32 0, i32 0
  store %"class.std::__1::__compressed_pair"* %18, %"class.std::__1::__compressed_pair"** %7, align 8
  %19 = load %"class.std::__1::__compressed_pair"*, %"class.std::__1::__compressed_pair"** %7, align 8
  store %"class.std::__1::__compressed_pair"* %19, %"class.std::__1::__compressed_pair"** %6, align 8
  %20 = load %"class.std::__1::__compressed_pair"*, %"class.std::__1::__compressed_pair"** %6, align 8
  %21 = bitcast %"class.std::__1::__compressed_pair"* %20 to %"struct.std::__1::__compressed_pair_elem"*
  store %"struct.std::__1::__compressed_pair_elem"* %21, %"struct.std::__1::__compressed_pair_elem"** %5, align 8
  %22 = load %"struct.std::__1::__compressed_pair_elem"*, %"struct.std::__1::__compressed_pair_elem"** %5, align 8
  %23 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem", %"struct.std::__1::__compressed_pair_elem"* %22, i32 0, i32 0
  %24 = bitcast %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >::__rep"* %23 to i8*
  call void @llvm.memset.p0i8.i64(i8* %24, i8 0, i64 24, i32 8, i1 false) #8
  %25 = bitcast %"class.std::__1::__compressed_pair"* %20 to %"struct.std::__1::__compressed_pair_elem.1"*
  store %"struct.std::__1::__compressed_pair_elem.1"* %25, %"struct.std::__1::__compressed_pair_elem.1"** %4, align 8
  %26 = load %"struct.std::__1::__compressed_pair_elem.1"*, %"struct.std::__1::__compressed_pair_elem.1"** %4, align 8
  %27 = bitcast %"struct.std::__1::__compressed_pair_elem.1"* %26 to %"class.std::__1::allocator"*
  store %"class.std::__1::allocator"* %27, %"class.std::__1::allocator"** %3, align 8
  %28 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %3, align 8
  %29 = load i8*, i8** %9, align 8
  %30 = load i8*, i8** %9, align 8
  %31 = call i64 @_ZNSt3__111char_traitsIcE6lengthEPKc(i8* %30) #8
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcm(%"class.std::__1::basic_string"* %16, i8* %29, i64 %31) #8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define linkonce_odr void @_ZN4META4Core11ComputeData10fromStringENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE(%"class.META::Core::ComputeData"*, %"class.std::__1::basic_string"*) unnamed_addr #1 align 2 {
  %3 = alloca %"class.META::Core::ComputeData"*, align 8
  store %"class.META::Core::ComputeData"* %0, %"class.META::Core::ComputeData"** %3, align 8
  %4 = load %"class.META::Core::ComputeData"*, %"class.META::Core::ComputeData"** %3, align 8
  ret void
}

declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcm(%"class.std::__1::basic_string"*, i8*, i64) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define linkonce_odr i64 @_ZNSt3__111char_traitsIcE6lengthEPKc(i8*) #1 align 2 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = call i64 @strlen(i8* %3) #8
  ret i64 %4
}

; Function Attrs: nounwind
declare i64 @strlen(i8*) #6

; Function Attrs: noinline nounwind ssp uwtable
define internal void @_GLOBAL__sub_I_MyComputeUnit.cpp() #0 section "__TEXT,__StaticInit,regular,pure_instructions" {
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { noinline nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { builtin }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Apple LLVM version 9.1.0 (clang-902.0.39.2)"}
