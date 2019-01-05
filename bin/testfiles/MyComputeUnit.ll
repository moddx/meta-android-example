; ModuleID = './testfiles/MyComputeUnit.cpp'
source_filename = "./testfiles/MyComputeUnit.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

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

$_ZTSN4META4Core11ComputeDataE = comdat any

$_ZTIN4META4Core11ComputeDataE = comdat any

$_ZTSN4META4Core11ComputeUnitE = comdat any

$_ZTIN4META4Core11ComputeUnitE = comdat any

@_ZN4META4Core11ComputeData15new_ComputeDataE = dso_local local_unnamed_addr global %"class.META::Core::ComputeData"* ()* @_Z16newMyComputeDatav, align 8
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTSN4META4Core11ComputeDataE = linkonce_odr dso_local constant [26 x i8] c"N4META4Core11ComputeDataE\00", comdat
@_ZTIN4META4Core11ComputeDataE = linkonce_odr dso_local constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @_ZTSN4META4Core11ComputeDataE, i32 0, i32 0) }, comdat
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTS13MyComputeData = dso_local constant [16 x i8] c"13MyComputeData\00"
@_ZTI13MyComputeData = dso_local constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @_ZTS13MyComputeData, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTIN4META4Core11ComputeDataE to i8*) }
@_ZTV13MyComputeData = dso_local unnamed_addr constant { [4 x i8*] } { [4 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTI13MyComputeData to i8*), i8* bitcast (void (%"class.std::__1::basic_string"*, %class.MyComputeData*)* @_ZNK13MyComputeData8toStringEv to i8*), i8* bitcast (void (%class.MyComputeData*, %"class.std::__1::basic_string"*)* @_ZN13MyComputeData10fromStringENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE to i8*)] }, align 8
@_ZTV13MyComputeUnit = dso_local unnamed_addr constant { [3 x i8*] } { [3 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTI13MyComputeUnit to i8*), i8* bitcast (%"class.META::Core::ComputeData"* (%class.MyComputeUnit*, %"class.META::Core::ComputeData"*)* @_ZNK13MyComputeUnit7computeEPN4META4Core11ComputeDataE to i8*)] }, align 8
@_ZTS13MyComputeUnit = dso_local constant [16 x i8] c"13MyComputeUnit\00"
@_ZTSN4META4Core11ComputeUnitE = linkonce_odr dso_local constant [26 x i8] c"N4META4Core11ComputeUnitE\00", comdat
@_ZTIN4META4Core11ComputeUnitE = linkonce_odr dso_local constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @_ZTSN4META4Core11ComputeUnitE, i32 0, i32 0) }, comdat
@_ZTI13MyComputeUnit = dso_local constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @_ZTS13MyComputeUnit, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTIN4META4Core11ComputeUnitE to i8*) }
@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: sspstrong uwtable
define dso_local noalias nonnull %"class.META::Core::ComputeData"* @_Z16newMyComputeDatav() #0 {
  %1 = tail call i8* @_Znwm(i64 16) #6
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 16 %1, i8 0, i64 16, i1 false)
  %2 = bitcast i8* %1 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [4 x i8*] }, { [4 x i8*] }* @_ZTV13MyComputeData, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !4
  %3 = bitcast i8* %1 to %"class.META::Core::ComputeData"*
  ret %"class.META::Core::ComputeData"* %3
}

; Function Attrs: nobuiltin
declare noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #2

; Function Attrs: sspstrong uwtable
define dso_local void @_ZN13MyComputeData10fromStringENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%class.MyComputeData* nocapture, %"class.std::__1::basic_string"*) unnamed_addr #0 align 2 {
  %3 = tail call i32 @_ZNSt3__14stoiERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPmi(%"class.std::__1::basic_string"* dereferenceable(24) %1, i64* null, i32 10)
  %4 = getelementptr inbounds %class.MyComputeData, %class.MyComputeData* %0, i64 0, i32 1
  store i32 %3, i32* %4, align 8, !tbaa !7
  ret void
}

declare i32 @_ZNSt3__14stoiERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPmi(%"class.std::__1::basic_string"* dereferenceable(24), i64*, i32) local_unnamed_addr #3

; Function Attrs: sspstrong uwtable
define dso_local void @_ZNK13MyComputeData8toStringEv(%"class.std::__1::basic_string"* noalias sret, %class.MyComputeData* nocapture readonly) unnamed_addr #0 align 2 {
  %3 = getelementptr inbounds %class.MyComputeData, %class.MyComputeData* %1, i64 0, i32 1
  %4 = load i32, i32* %3, align 8, !tbaa !7
  tail call void @_ZNSt3__19to_stringEi(%"class.std::__1::basic_string"* sret %0, i32 %4)
  ret void
}

declare void @_ZNSt3__19to_stringEi(%"class.std::__1::basic_string"* sret, i32) local_unnamed_addr #3

; Function Attrs: nounwind readnone sspstrong uwtable
define dso_local i32 @_ZNK13MyComputeUnit3fibEiii(%class.MyComputeUnit* nocapture readnone, i32, i32, i32) local_unnamed_addr #4 align 2 {
  %5 = icmp slt i32 %1, 1
  br i1 %5, label %13, label %6

; <label>:6:                                      ; preds = %4, %6
  %7 = phi i32 [ %11, %6 ], [ %3, %4 ]
  %8 = phi i32 [ %7, %6 ], [ %2, %4 ]
  %9 = phi i32 [ %10, %6 ], [ %1, %4 ]
  %10 = add nsw i32 %9, -1
  %11 = add nsw i32 %7, %8
  %12 = icmp slt i32 %9, 2
  br i1 %12, label %13, label %6

; <label>:13:                                     ; preds = %6, %4
  %14 = phi i32 [ %2, %4 ], [ %7, %6 ]
  ret i32 %14
}

; Function Attrs: sspstrong uwtable
define dso_local noalias nonnull %"class.META::Core::ComputeData"* @_ZNK13MyComputeUnit7computeEPN4META4Core11ComputeDataE(%class.MyComputeUnit* nocapture readnone, %"class.META::Core::ComputeData"* readonly) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = bitcast %"class.META::Core::ComputeData"* %1 to i8*
  %4 = tail call i8* @__dynamic_cast(i8* %3, i8* bitcast ({ i8*, i8* }* @_ZTIN4META4Core11ComputeDataE to i8*), i8* bitcast ({ i8*, i8*, i8* }* @_ZTI13MyComputeData to i8*), i64 0) #7
  %5 = getelementptr inbounds i8, i8* %4, i64 8
  %6 = bitcast i8* %5 to i32*
  %7 = load i32, i32* %6, align 8, !tbaa !7
  %8 = icmp slt i32 %7, 1
  br i1 %8, label %16, label %9

; <label>:9:                                      ; preds = %2, %9
  %10 = phi i32 [ %14, %9 ], [ 1, %2 ]
  %11 = phi i32 [ %10, %9 ], [ 1, %2 ]
  %12 = phi i32 [ %13, %9 ], [ %7, %2 ]
  %13 = add nsw i32 %12, -1
  %14 = add nsw i32 %11, %10
  %15 = icmp slt i32 %12, 2
  br i1 %15, label %16, label %9

; <label>:16:                                     ; preds = %9, %2
  %17 = phi i32 [ 1, %2 ], [ %10, %9 ]
  %18 = tail call i8* @_Znwm(i64 16) #6
  %19 = bitcast i8* %18 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [4 x i8*] }, { [4 x i8*] }* @_ZTV13MyComputeData, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %19, align 8, !tbaa !4
  %20 = getelementptr inbounds i8, i8* %18, i64 8
  %21 = bitcast i8* %20 to i32*
  store i32 %17, i32* %21, align 8, !tbaa !7
  %22 = bitcast i8* %18 to %"class.META::Core::ComputeData"*
  ret %"class.META::Core::ComputeData"* %22
}

; Function Attrs: nounwind readonly
declare i8* @__dynamic_cast(i8*, i8*, i8*, i64) local_unnamed_addr #5

declare i32 @__gxx_personality_v0(...)

attributes #0 = { sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }
attributes #6 = { builtin }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 7.0.1 (tags/RELEASE_701/final)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"vtable pointer", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{!8, !9, i64 8}
!8 = !{!"_ZTS13MyComputeData", !9, i64 8}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !6, i64 0}
