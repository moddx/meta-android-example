; ModuleID = 'MyComputeUnit.cpp'
source_filename = "MyComputeUnit.cpp"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

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
%"struct.META::Core::DataSet" = type { i32, %"class.META::Core::ComputeData"* }

@_ZN4META4Core11ComputeData15new_ComputeDataE = local_unnamed_addr global %"class.META::Core::ComputeData"* ()* @_Z16newMyComputeDatav, align 8
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
@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: nounwind ssp uwtable
define noalias nonnull %"class.META::Core::ComputeData"* @_Z16newMyComputeDatav() #0 {
  %1 = tail call i8* @_Znwm(i64 16) #6
  tail call void @llvm.memset.p0i8.i64(i8* nonnull %1, i8 0, i64 16, i32 16, i1 false)
  %2 = bitcast i8* %1 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [4 x i8*] }, { [4 x i8*] }* @_ZTV13MyComputeData, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !3
  %3 = bitcast i8* %1 to %"class.META::Core::ComputeData"*
  ret %"class.META::Core::ComputeData"* %3
}

; Function Attrs: nobuiltin
declare noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

; Function Attrs: nounwind ssp uwtable
define void @_ZN13MyComputeData10fromStringENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%class.MyComputeData* nocapture, %"class.std::__1::basic_string"*) unnamed_addr #0 align 2 {
  %3 = tail call i32 @_ZNSt3__14stoiERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPmi(%"class.std::__1::basic_string"* dereferenceable(24) %1, i64* null, i32 10) #7
  %4 = getelementptr inbounds %class.MyComputeData, %class.MyComputeData* %0, i64 0, i32 1
  store i32 %3, i32* %4, align 8, !tbaa !6
  ret void
}

declare i32 @_ZNSt3__14stoiERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPmi(%"class.std::__1::basic_string"* dereferenceable(24), i64*, i32) local_unnamed_addr #3

; Function Attrs: nounwind ssp uwtable
define void @_ZNK13MyComputeData8toStringEv(%"class.std::__1::basic_string"* noalias sret, %class.MyComputeData* nocapture readonly) unnamed_addr #0 align 2 {
  %3 = getelementptr inbounds %class.MyComputeData, %class.MyComputeData* %1, i64 0, i32 1
  %4 = load i32, i32* %3, align 8, !tbaa !6
  tail call void @_ZNSt3__19to_stringEi(%"class.std::__1::basic_string"* sret %0, i32 %4) #7
  ret void
}

declare void @_ZNSt3__19to_stringEi(%"class.std::__1::basic_string"* sret, i32) local_unnamed_addr #3

; Function Attrs: nounwind readnone ssp uwtable
define i32 @_ZNK13MyComputeUnit3fibEi(%class.MyComputeUnit*, i32) local_unnamed_addr #4 align 2 {
  %3 = icmp slt i32 %1, 2
  br i1 %3, label %13, label %4

; <label>:4:                                      ; preds = %2
  br label %5

; <label>:5:                                      ; preds = %4, %5
  %6 = phi i32 [ %10, %5 ], [ %1, %4 ]
  %7 = phi i32 [ %11, %5 ], [ 1, %4 ]
  %8 = add nsw i32 %6, -1
  %9 = tail call i32 @_ZNK13MyComputeUnit3fibEi(%class.MyComputeUnit* %0, i32 %8)
  %10 = add nsw i32 %6, -2
  %11 = add nsw i32 %9, %7
  %12 = icmp slt i32 %6, 4
  br i1 %12, label %13, label %5

; <label>:13:                                     ; preds = %5, %2
  %14 = phi i32 [ 1, %2 ], [ %11, %5 ]
  ret i32 %14
}

; Function Attrs: nounwind ssp uwtable
define void @_ZNK13MyComputeUnit7computeEN4META4Core7DataSetERS2_(%class.MyComputeUnit*, i32, %"class.META::Core::ComputeData"* readonly, %"struct.META::Core::DataSet"* nocapture dereferenceable(16)) unnamed_addr #0 align 2 {
  %5 = bitcast %"class.META::Core::ComputeData"* %2 to i8*
  %6 = tail call i8* @__dynamic_cast(i8* %5, i8* bitcast ({ i8*, i8* }* @_ZTIN4META4Core11ComputeDataE to i8*), i8* bitcast ({ i8*, i8*, i8* }* @_ZTI13MyComputeData to i8*), i64 0) #7
  %7 = getelementptr inbounds i8, i8* %6, i64 8
  %8 = bitcast i8* %7 to i32*
  %9 = load i32, i32* %8, align 8, !tbaa !6
  %10 = tail call i32 @_ZNK13MyComputeUnit3fibEi(%class.MyComputeUnit* %0, i32 %9)
  %11 = getelementptr inbounds %"struct.META::Core::DataSet", %"struct.META::Core::DataSet"* %3, i64 0, i32 0
  store i32 %1, i32* %11, align 8, !tbaa !10
  %12 = tail call i8* @_Znwm(i64 16) #6
  tail call void @llvm.memset.p0i8.i64(i8* nonnull %12, i8 0, i64 16, i32 16, i1 false)
  %13 = bitcast i8* %12 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [4 x i8*] }, { [4 x i8*] }* @_ZTV13MyComputeData, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %13, align 8, !tbaa !3
  %14 = getelementptr inbounds i8, i8* %12, i64 8
  %15 = bitcast i8* %14 to i32*
  store i32 %10, i32* %15, align 8, !tbaa !6
  %16 = getelementptr inbounds %"struct.META::Core::DataSet", %"struct.META::Core::DataSet"* %3, i64 0, i32 1
  %17 = bitcast %"class.META::Core::ComputeData"** %16 to i8**
  store i8* %12, i8** %17, align 8, !tbaa !13
  ret void
}

; Function Attrs: nounwind readonly
declare i8* @__dynamic_cast(i8*, i8*, i8*, i64) local_unnamed_addr #5

attributes #0 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }
attributes #6 = { builtin nounwind }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Apple LLVM version 9.1.0 (clang-902.0.39.2)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"vtable pointer", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{!7, !8, i64 8}
!7 = !{!"_ZTS13MyComputeData", !8, i64 8}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !5, i64 0}
!10 = !{!11, !8, i64 0}
!11 = !{!"_ZTSN4META4Core7DataSetE", !8, i64 0, !12, i64 8}
!12 = !{!"any pointer", !9, i64 0}
!13 = !{!11, !12, i64 8}
