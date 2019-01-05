; ModuleID = 'c:\Users\Rainbow\Desktop\androidcpp\app\src\main\cpp\cunits\MyComputeUnit.cpp'
source_filename = "c:\5CUsers\5CRainbow\5CDesktop\5Candroidcpp\5Capp\5Csrc\5Cmain\5Ccpp\5Ccunits\5CMyComputeUnit.cpp"
target datalayout = "e-m:w-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.16.27025"

%"class.META::Core::ComputeData" = type { i32 (...)** }
%rtti.TypeDescriptor27 = type { i8**, i8*, [28 x i8] }
%rtti.TypeDescriptor19 = type { i8**, i8*, [20 x i8] }
%rtti.CompleteObjectLocator = type { i32, i32, i32, i32, i32, i32 }
%rtti.ClassHierarchyDescriptor = type { i32, i32, i32, i32 }
%rtti.BaseClassDescriptor = type { i32, i32, i32, i32, i32, i32, i32 }
%class.MyComputeData = type { %"class.META::Core::ComputeData", i32 }
%"class.std::__1::basic_string" = type { %"class.std::__1::__compressed_pair" }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >::__rep" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >::__rep" = type { %union.anon }
%union.anon = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >::__long" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >::__long" = type { i64, i64, i8* }
%class.MyComputeUnit = type { %"class.META::Core::ComputeUnit" }
%"class.META::Core::ComputeUnit" = type { i32 (...)** }

$"?toString@ComputeData@Core@META@@UEBA?AV?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@__1@std@@XZ" = comdat any

$"?fromString@ComputeData@Core@META@@UEAAXV?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@__1@std@@@Z" = comdat any

$"??_R0?AVComputeData@Core@META@@@8" = comdat any

$"??_R0?AVMyComputeData@@@8" = comdat any

$"??_7MyComputeData@@6B@" = comdat largest

$"??_R4MyComputeData@@6B@" = comdat any

$"??_R3MyComputeData@@8" = comdat any

$"??_R2MyComputeData@@8" = comdat any

$"??_R1A@?0A@EA@MyComputeData@@8" = comdat any

$"??_R1A@?0A@EA@ComputeData@Core@META@@8" = comdat any

$"??_R3ComputeData@Core@META@@8" = comdat any

$"??_R2ComputeData@Core@META@@8" = comdat any

$"??_7ComputeData@Core@META@@6B@" = comdat largest

$"??_R4ComputeData@Core@META@@6B@" = comdat any

@"?new_ComputeData@ComputeData@Core@META@@2P6APEAV123@XZEA" = dso_local local_unnamed_addr global %"class.META::Core::ComputeData"* ()* @"?newMyComputeData@@YAPEAVComputeData@Core@META@@XZ", align 8
@"??_7type_info@@6B@" = external constant i8*
@"??_R0?AVComputeData@Core@META@@@8" = linkonce_odr global %rtti.TypeDescriptor27 { i8** @"??_7type_info@@6B@", i8* null, [28 x i8] c".?AVComputeData@Core@META@@\00" }, comdat
@"??_R0?AVMyComputeData@@@8" = linkonce_odr global %rtti.TypeDescriptor19 { i8** @"??_7type_info@@6B@", i8* null, [20 x i8] c".?AVMyComputeData@@\00" }, comdat
@0 = private unnamed_addr constant { [3 x i8*] } { [3 x i8*] [i8* bitcast (%rtti.CompleteObjectLocator* @"??_R4MyComputeData@@6B@" to i8*), i8* bitcast (void (%class.MyComputeData*, %"class.std::__1::basic_string"*)* @"?toString@MyComputeData@@UEBA?AV?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@__1@std@@XZ" to i8*), i8* bitcast (void (%class.MyComputeData*, %"class.std::__1::basic_string"*)* @"?fromString@MyComputeData@@UEAAXV?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@__1@std@@@Z" to i8*)] }, comdat($"??_7MyComputeData@@6B@")
@"??_R4MyComputeData@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.TypeDescriptor19* @"??_R0?AVMyComputeData@@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.ClassHierarchyDescriptor* @"??_R3MyComputeData@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.CompleteObjectLocator* @"??_R4MyComputeData@@6B@" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32) }, comdat
@__ImageBase = external dso_local constant i8
@"??_R3MyComputeData@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 2, i32 trunc (i64 sub nuw nsw (i64 ptrtoint ([3 x i32]* @"??_R2MyComputeData@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32) }, comdat
@"??_R2MyComputeData@@8" = linkonce_odr constant [3 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.BaseClassDescriptor* @"??_R1A@?0A@EA@MyComputeData@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.BaseClassDescriptor* @"??_R1A@?0A@EA@ComputeData@Core@META@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 0], comdat
@"??_R1A@?0A@EA@MyComputeData@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.TypeDescriptor19* @"??_R0?AVMyComputeData@@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 1, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.ClassHierarchyDescriptor* @"??_R3MyComputeData@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32) }, comdat
@"??_R1A@?0A@EA@ComputeData@Core@META@@8" = linkonce_odr constant %rtti.BaseClassDescriptor { i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.TypeDescriptor27* @"??_R0?AVComputeData@Core@META@@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 0, i32 0, i32 -1, i32 0, i32 64, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.ClassHierarchyDescriptor* @"??_R3ComputeData@Core@META@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32) }, comdat
@"??_R3ComputeData@Core@META@@8" = linkonce_odr constant %rtti.ClassHierarchyDescriptor { i32 0, i32 0, i32 1, i32 trunc (i64 sub nuw nsw (i64 ptrtoint ([2 x i32]* @"??_R2ComputeData@Core@META@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32) }, comdat
@"??_R2ComputeData@Core@META@@8" = linkonce_odr constant [2 x i32] [i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.BaseClassDescriptor* @"??_R1A@?0A@EA@ComputeData@Core@META@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 0], comdat
@1 = private unnamed_addr constant { [3 x i8*] } { [3 x i8*] [i8* bitcast (%rtti.CompleteObjectLocator* @"??_R4ComputeData@Core@META@@6B@" to i8*), i8* bitcast (void (%"class.META::Core::ComputeData"*, %"class.std::__1::basic_string"*)* @"?toString@ComputeData@Core@META@@UEBA?AV?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@__1@std@@XZ" to i8*), i8* bitcast (void (%"class.META::Core::ComputeData"*, %"class.std::__1::basic_string"*)* @"?fromString@ComputeData@Core@META@@UEAAXV?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@__1@std@@@Z" to i8*)] }, comdat($"??_7ComputeData@Core@META@@6B@")
@"??_R4ComputeData@Core@META@@6B@" = linkonce_odr constant %rtti.CompleteObjectLocator { i32 1, i32 0, i32 0, i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.TypeDescriptor27* @"??_R0?AVComputeData@Core@META@@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.ClassHierarchyDescriptor* @"??_R3ComputeData@Core@META@@8" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32), i32 trunc (i64 sub nuw nsw (i64 ptrtoint (%rtti.CompleteObjectLocator* @"??_R4ComputeData@Core@META@@6B@" to i64), i64 ptrtoint (i8* @__ImageBase to i64)) to i32) }, comdat
@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

@"??_7MyComputeData@@6B@" = unnamed_addr alias i8*, getelementptr inbounds ({ [3 x i8*] }, { [3 x i8*] }* @0, i32 0, i32 0, i32 1)
@"??_7ComputeData@Core@META@@6B@" = unnamed_addr alias i8*, getelementptr inbounds ({ [3 x i8*] }, { [3 x i8*] }* @1, i32 0, i32 0, i32 1)

; Function Attrs: uwtable
define dso_local noalias nonnull %"class.META::Core::ComputeData"* @"?newMyComputeData@@YAPEAVComputeData@Core@META@@XZ"() #0 {
entry:
  %call = tail call i8* @"??2@YAPEAX_K@Z"(i64 16) #8
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 16 %call, i8 0, i64 16, i1 false)
  %0 = bitcast i8* %call to i32 (...)***
  store i32 (...)** bitcast (i8** @"??_7MyComputeData@@6B@" to i32 (...)**), i32 (...)*** %0, align 8, !tbaa !5
  %1 = bitcast i8* %call to %"class.META::Core::ComputeData"*
  ret %"class.META::Core::ComputeData"* %1
}

; Function Attrs: nobuiltin
declare dso_local noalias nonnull i8* @"??2@YAPEAX_K@Z"(i64) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #2

; Function Attrs: uwtable
define dso_local void @"?fromString@MyComputeData@@UEAAXV?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@__1@std@@@Z"(%class.MyComputeData* nocapture %this, %"class.std::__1::basic_string"* %s) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) {
entry:
  %call = invoke i32 @"?stoi@__1@std@@YAHAEBV?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@12@PEA_KH@Z"(%"class.std::__1::basic_string"* dereferenceable(24) %s, i64* null, i32 10)
          to label %invoke.cont unwind label %ehcleanup

invoke.cont:                                      ; preds = %entry
  %field1 = getelementptr inbounds %class.MyComputeData, %class.MyComputeData* %this, i64 0, i32 1
  store i32 %call, i32* %field1, align 8, !tbaa !8
  tail call void @"??1?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@__1@std@@QEAA@XZ"(%"class.std::__1::basic_string"* nonnull %s) #9
  ret void

ehcleanup:                                        ; preds = %entry
  %0 = cleanuppad within none []
  call void @"??1?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@__1@std@@QEAA@XZ"(%"class.std::__1::basic_string"* %s) #9 [ "funclet"(token %0) ]
  cleanupret from %0 unwind to caller
}

declare dllimport i32 @"?stoi@__1@std@@YAHAEBV?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@12@PEA_KH@Z"(%"class.std::__1::basic_string"* dereferenceable(24), i64*, i32) local_unnamed_addr #3

declare dso_local i32 @__CxxFrameHandler3(...)

; Function Attrs: nounwind
declare dllimport void @"??1?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@__1@std@@QEAA@XZ"(%"class.std::__1::basic_string"*) unnamed_addr #4

; Function Attrs: uwtable
define dso_local void @"?toString@MyComputeData@@UEBA?AV?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@__1@std@@XZ"(%class.MyComputeData* nocapture readonly %this, %"class.std::__1::basic_string"* noalias sret %agg.result) unnamed_addr #0 align 2 {
entry:
  %field1 = getelementptr inbounds %class.MyComputeData, %class.MyComputeData* %this, i64 0, i32 1
  %0 = load i32, i32* %field1, align 8, !tbaa !8
  tail call void @"?to_string@__1@std@@YA?AV?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@12@H@Z"(%"class.std::__1::basic_string"* sret %agg.result, i32 %0)
  ret void
}

declare dllimport void @"?to_string@__1@std@@YA?AV?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@12@H@Z"(%"class.std::__1::basic_string"* sret, i32) local_unnamed_addr #3

; Function Attrs: nounwind readnone uwtable
define dso_local i32 @"?fib@MyComputeUnit@@AEBAHHHH@Z"(%class.MyComputeUnit* nocapture readnone %this, i32 %n, i32 %a, i32 %b) local_unnamed_addr #5 align 2 {
entry:
  %cmp4 = icmp slt i32 %n, 1
  br i1 %cmp4, label %cond.end, label %cond.false

cond.false:                                       ; preds = %entry, %cond.false
  %b.tr7 = phi i32 [ %add, %cond.false ], [ %b, %entry ]
  %a.tr6 = phi i32 [ %b.tr7, %cond.false ], [ %a, %entry ]
  %n.tr5 = phi i32 [ %sub, %cond.false ], [ %n, %entry ]
  %add = add nsw i32 %b.tr7, %a.tr6
  %sub = add nsw i32 %n.tr5, -1
  %cmp = icmp slt i32 %n.tr5, 2
  br i1 %cmp, label %cond.end, label %cond.false

cond.end:                                         ; preds = %cond.false, %entry
  %a.tr.lcssa = phi i32 [ %a, %entry ], [ %b.tr7, %cond.false ]
  ret i32 %a.tr.lcssa
}

; Function Attrs: uwtable
define dso_local noalias nonnull %"class.META::Core::ComputeData"* @"?compute@MyComputeUnit@@UEBAPEAVComputeData@Core@META@@PEAV234@@Z"(%class.MyComputeUnit* nocapture readnone %this, %"class.META::Core::ComputeData"* %data) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__CxxFrameHandler3 to i8*) {
entry:
  %0 = bitcast %"class.META::Core::ComputeData"* %data to i8*
  %1 = tail call i8* @__RTDynamicCast(i8* %0, i32 0, i8* bitcast (%rtti.TypeDescriptor27* @"??_R0?AVComputeData@Core@META@@@8" to i8*), i8* bitcast (%rtti.TypeDescriptor19* @"??_R0?AVMyComputeData@@@8" to i8*), i32 0)
  %field1 = getelementptr inbounds i8, i8* %1, i64 8
  %2 = bitcast i8* %field1 to i32*
  %3 = load i32, i32* %2, align 8, !tbaa !8
  %cmp4.i = icmp slt i32 %3, 1
  br i1 %cmp4.i, label %"?fib@MyComputeUnit@@AEBAHHHH@Z.exit", label %cond.false.i

cond.false.i:                                     ; preds = %entry, %cond.false.i
  %b.tr7.i = phi i32 [ %add.i, %cond.false.i ], [ 1, %entry ]
  %a.tr6.i = phi i32 [ %b.tr7.i, %cond.false.i ], [ 1, %entry ]
  %n.tr5.i = phi i32 [ %sub.i, %cond.false.i ], [ %3, %entry ]
  %add.i = add nsw i32 %a.tr6.i, %b.tr7.i
  %sub.i = add nsw i32 %n.tr5.i, -1
  %cmp.i = icmp slt i32 %n.tr5.i, 2
  br i1 %cmp.i, label %"?fib@MyComputeUnit@@AEBAHHHH@Z.exit", label %cond.false.i

"?fib@MyComputeUnit@@AEBAHHHH@Z.exit":            ; preds = %cond.false.i, %entry
  %a.tr.lcssa.i = phi i32 [ 1, %entry ], [ %b.tr7.i, %cond.false.i ]
  %call2 = tail call i8* @"??2@YAPEAX_K@Z"(i64 16) #8
  %4 = bitcast i8* %call2 to i32 (...)***
  store i32 (...)** bitcast (i8** @"??_7MyComputeData@@6B@" to i32 (...)**), i32 (...)*** %4, align 8, !tbaa !5
  %field1.i = getelementptr inbounds i8, i8* %call2, i64 8
  %5 = bitcast i8* %field1.i to i32*
  store i32 %a.tr.lcssa.i, i32* %5, align 8, !tbaa !8
  %6 = bitcast i8* %call2 to %"class.META::Core::ComputeData"*
  ret %"class.META::Core::ComputeData"* %6
}

declare dllimport i8* @__RTDynamicCast(i8*, i32, i8*, i8*, i32) local_unnamed_addr

; Function Attrs: uwtable
define linkonce_odr dso_local void @"?toString@ComputeData@Core@META@@UEBA?AV?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@__1@std@@XZ"(%"class.META::Core::ComputeData"* %this, %"class.std::__1::basic_string"* noalias sret %agg.result) unnamed_addr #0 comdat align 2 {
entry:
  %0 = bitcast %"class.std::__1::basic_string"* %agg.result to i8*
  tail call void @llvm.memset.p0i8.i64(i8* align 8 %0, i8 0, i64 24, i1 false) #9
  %call.i.i = tail call i64 @strlen(i8* null) #9
  tail call void @"?__init@?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@__1@std@@AEAAXPEBD_K@Z"(%"class.std::__1::basic_string"* %agg.result, i8* null, i64 %call.i.i)
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @"?fromString@ComputeData@Core@META@@UEAAXV?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@__1@std@@@Z"(%"class.META::Core::ComputeData"* %this, %"class.std::__1::basic_string"* %s) unnamed_addr #6 comdat align 2 {
entry:
  tail call void @"??1?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@__1@std@@QEAA@XZ"(%"class.std::__1::basic_string"* %s) #9
  ret void
}

declare dllimport void @"?__init@?$basic_string@DU?$char_traits@D@__1@std@@V?$allocator@D@23@@__1@std@@AEAAXPEBD_K@Z"(%"class.std::__1::basic_string"*, i8*, i64) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind readonly
declare dso_local i64 @strlen(i8* nocapture) local_unnamed_addr #7

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { argmemonly nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { builtin }
attributes #9 = { nounwind }

!llvm.linker.options = !{!0, !1}
!llvm.module.flags = !{!2, !3}
!llvm.ident = !{!4}

!0 = !{!"/DEFAULTLIB:libc++.lib"}
!1 = !{!"/FAILIFMISMATCH:\22_CRT_STDIO_ISO_WIDE_SPECIFIERS=0\22"}
!2 = !{i32 1, !"wchar_size", i32 2}
!3 = !{i32 7, !"PIC Level", i32 2}
!4 = !{!"clang version 8.0.0 (trunk)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"vtable pointer", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !10, i64 8}
!9 = !{!"?AVMyComputeData@@", !10, i64 8}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !7, i64 0}
