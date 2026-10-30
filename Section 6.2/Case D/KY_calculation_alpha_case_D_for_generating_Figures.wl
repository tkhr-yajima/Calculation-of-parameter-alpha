(* ::Package:: *)

(* ::Input:: *)
(*Clear["Global`*"]*)


(* ::Input:: *)
(*(*n:iteration*)*)
(*n=50000;fontsize=22;*)


(* ::Input:: *)
(*(*Import the mean,variance,state transition classification results,and the values \:200b\:200bof $\alpha_k$*)*)
(*listMean=Flatten[Import["listMean_Numerical_example_case_D.csv"]];*)
(*listVar=Flatten[Import["listVar_Numerical_example_case_D.csv"]];*)
(*listr=Import["listr_Numerical_example_case_D.csv"];*)
(*listAlphak=Import["listAlphak_Numerical_example_case_D.csv"];*)
(*listAlphak3=Import["listAlphak3_Numerical_example_case_D.csv"];*)


(* ::Input:: *)
(*(*figure of mean*)*)
(*figMean=ListPlot[listMean,Frame->True,GridLines->Automatic,FrameLabel->{k,"\!\(\*SubscriptBox[\(\[Mu]\), \(k\)]\)"},FrameStyle->Directive[FontSize->fontsize,FontFamily->"Times New Roman",FontColor->Black],PlotRange->All,PlotStyle->{PointSize[0.005],Purple},ImageSize->Large,FrameTicks->{{{{0,"0"},{1.0,"1.0"},{2.0,"2.0"},{3.0,"3.0"},{4.0,"4.0"},{5.0,"5.0"}},None},{{{0,"0"},{10000,"1.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{20000,"2.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{30000,"3.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{40000,"4.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{50000,"5.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"}},None}},Epilog->Inset[Style["(a)",FontFamily->"Times New Roman",25,FontColor->Black],Offset[{-5,-2},Scaled[{0.1,1}]],{Right,Top}]]*)


(* ::Input:: *)
(*(*figure of variance*)*)
(*figVar=ListPlot[listVar,Frame->True,GridLines->Automatic,FrameLabel->{k,"\!\(\*SubscriptBox[\(\[Omega]\), \(k\)]\)"},FrameStyle->Directive[FontSize->fontsize,FontFamily->"Times New Roman",FontColor->Black],PlotRange->All,PlotStyle->{PointSize[0.005],Orange},ImageSize->Large,FrameTicks->{{{{0,"0"},{0.5,"0.5"},{1.0,"1.0"},{1.5,"1.5"},{2.0,"2.0"}},None},{{{0,"0"},{10000,"1.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{20000,"2.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{30000,"3.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{40000,"4.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{50000,"5.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"}},None}},Epilog->Inset[Style["(b)",FontFamily->"Times New Roman",25,FontColor->Black],Offset[{3,-2},Scaled[{0.1,1}]],{Right,Top}]]*)


(* ::Input:: *)
(*(*Using `listr`\[LongDash]which stores the types of state transitions\[LongDash]classify the calculated $\alpha_k$ into one of the following categories:"Deterministic Acceptance," "Probabilistic Acceptance," or "Probabilistic Rejection"*)*)
(*listAlphaUp={};*)
(*Do[If[listr[[i+1]][[2]]==1,AppendTo[listAlphaUp,listAlphak3[[i]]]],{i,1,Length[listAlphak3]}];*)
(*listAlphaDwn={};*)
(*Do[If[listr[[i+1]][[2]]==-1,AppendTo[listAlphaDwn,listAlphak3[[i]]]],{i,1,Length[listAlphak3]}];*)
(*listAlphaSty={};*)
(*Do[If[listr[[i+1]][[2]]==0,AppendTo[listAlphaSty,listAlphak3[[i]]]],{i,1,Length[listAlphak3]}];*)


(* ::Input:: *)
(*(*The value of $alphak$ for "Deterministic Acceptance" in the vicinity of the $alphak$ value at which a proposal is rejected*)*)
(*figAlphaStayDwnUp1=ListPlot[listAlphaUp,Frame->True,GridLines->Automatic,FrameLabel->{k,Subscript[\[Alpha], k]},FrameStyle->Directive[FontSize->fontsize,FontFamily->"Times New Roman"],PlotRange->{{0,n},{-5,0}},PlotStyle->{PointSize[0.01],Darker[Green]},Epilog->Inset[Style["(c)",FontFamily->"Times New Roman",25,FontColor->Black],Offset[{0,-2},Scaled[{0.1,1}]],{Right,Top}],ImageSize->Large];*)


(* ::Input:: *)
(*(*The value of $alphak$ for "Probabilistic Acceptance" in the vicinity of the $alphak$ value at which a proposal is rejected*)*)
(*figAlphaStayDwnUp2=ListPlot[listAlphaDwn,Frame->True,GridLines->Automatic,FrameLabel->{k,Subscript[\[Alpha], k]},FrameStyle->Directive[FontSize->fontsize,FontFamily->"Times New Roman"],PlotStyle->{PointSize[0.01],Blue},ImageSize->Large,PlotRange->{{0,n},{-2,5}},Epilog->Inset[Style["(c)",FontFamily->"Times New Roman",18],Offset[{-20,-2},Scaled[{0.1,1}]],{Right,Top}]];*)


(* ::Input:: *)
(*(*Graph for "Probabilistic Rejection" with respect to $\alpha_k$*)*)
(*figAlphaStayDwnUp3=ListPlot[listAlphaSty,Frame->True,GridLines->Automatic,FrameLabel->{k,Subscript[\[Alpha], k]},FrameStyle->Directive[FontSize->fontsize,FontFamily->"Times New Roman"],PlotStyle->{PointSize[0.005],Red},ImageSize->Large,PlotRange->All,Epilog->Inset[Style["(c)",FontFamily->"Times New Roman",18],Offset[{-10,-2},Scaled[{0.1,1}]],{Right,Top}]];*)


(* ::Input:: *)
(*(*The alphak value for "Probabilistic Rejection" and the alphak values \:200b\:200bfor "Deterministic Acceptance" and "Probabilistic Acceptance" in the vicinity.*)*)
(*figAlphaStayDwnUp=Show[figAlphaStayDwnUp1,figAlphaStayDwnUp3,figAlphaStayDwnUp2,PlotRange->{{-1000,n},{-5,3}},FrameTicks->{{{{-5.0,"-5.00"},{-3.00,"-3.00"},{-1.00,"-1.00"},{0,"0"},{1.00,"1.00"},{3.00,"3.00"}},None},{{{0,"0"},{10000,"1.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{20000,"2.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{30000,"3.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{40000,"4.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{50000,"5.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"}},None}},Epilog->Inset[Style["(c)",FontFamily->"Times New Roman",25],Offset[{5,-2},Scaled[{0.1,1}]],{Right,Top}]]*)


(* ::Input:: *)
(*(*Graph for "Deterministic Acceptance" and "Probabilistic Acceptance" with respect to $\alpha_k$ across the entire range*)*)
(*figUpDownAll=ListPlot[{listAlphaUp,listAlphaDwn},Frame->True,GridLines->Automatic,FrameLabel->{k,Subscript[\[Alpha], k]},FrameStyle->Directive[FontSize->fontsize,FontFamily->"Times New Roman",FontColor->Black],PlotStyle->{{PointSize[0.008],Darker[Green]},{PointSize[0.008],Blue}},ImageSize->Large,PlotRange->All,Epilog->Inset[Style["(d)",FontFamily->"Times New Roman",25,FontColor->Black],Offset[{-5,3},Scaled[{0.1,1}]],{Right,Top}],FrameTicks->{{{{-600000000,"-6.0\[Times]\!\(\*SuperscriptBox[\(10\), \(8\)]\)"},{-500000000,"-5.0\[Times]\!\(\*SuperscriptBox[\(10\), \(8\)]\)"},{-400000000,"-4.0\[Times]\!\(\*SuperscriptBox[\(10\), \(8\)]\)"},{-300000000,"-3.0\[Times]\!\(\*SuperscriptBox[\(10\), \(8\)]\)"},{-200000000,"-2.0\[Times]\!\(\*SuperscriptBox[\(10\), \(8\)]\)"},{-100000000,"-1.0\[Times]\!\(\*SuperscriptBox[\(10\), \(8\)]\)"},{0,"0"}},None},{{{0,"0"},{10000,"1.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{20000,"2.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{30000,"3.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{40000,"4.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{50000,"5.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"}},None}}]*)


(* ::Input:: *)
(*(*Graph for "Deterministic Acceptance" with respect to $\alpha_k$,excluding outliers*)*)
(*figUpLimit=ListPlot[listAlphaUp,Frame->True,GridLines->Automatic,FrameLabel->{k,Subscript[\[Alpha], k]},FrameStyle->Directive[FontSize->fontsize,FontFamily->"Times New Roman",FontColor->Black],PlotStyle->{PointSize[0.005],Darker[Green]},Epilog->Inset[Style["(e)",FontFamily->"Times New Roman",25,FontColor->Black],Offset[{-12,-2},Scaled[{0.1,1}]],{Right,Top}],ImageSize->Large,FrameTicks->{{{{-100000,"-1.0\[Times]\!\(\*SuperscriptBox[\(10\), \(5\)]\)"},{-50000,"-5.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{0,"0"},{50000,"5.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{100000,"1.0\[Times]\!\(\*SuperscriptBox[\(10\), \(5\)]\)"}},None},{{{0,"0"},{10000,"1.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{20000,"2.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{30000,"3.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{40000,"4.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{50000,"5.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"}},None}}];*)


(* ::Input:: *)
(*(*Graph for boundary $\alpha_k=k$*)*)
(*figUpDwnLimitboundary=Plot[k,{k,0,n},Frame->True,GridLines->Automatic,FrameLabel->{k,Subscript[\[Alpha], k]},FrameStyle->Directive[FontSize->fontsize,FontFamily->"Times New Roman",FontColor->Black],ImageSize->Large,PlotStyle->{Red,Dashed,Thickness[0.007]}];*)


(* ::Input:: *)
(*(*Graph for "Deterministic Acceptance" with respect to $\alpha_k$,excluding outliers and boundary $\alpha_k=k$*)*)
(*figUpLimit2=Show[figUpLimit,figUpDwnLimitboundary]*)


(* ::Input:: *)
(*(*Graph for "Probabilistic Acceptance" with respect to $\alpha_k$,excluding outliers*)*)
(*figDownLimit=ListPlot[listAlphaDwn,Frame->True,PlotRange->{{0,n},{-1.15*10^5,1.5*10^5}},GridLines->Automatic,FrameLabel->{k,Subscript[\[Alpha], k]},FrameStyle->Directive[FontSize->fontsize,FontFamily->"Times New Roman",FontColor->Black],PlotStyle->{PointSize[0.005],Blue},ImageSize->Large,Epilog->Inset[Style["(f)",FontFamily->"Times New Roman",25,FontColor->Black],Offset[{-10,-2},Scaled[{0.1,1}]],{Right,Top}],FrameTicks->{{{{-100000,"-1.0\[Times]\!\(\*SuperscriptBox[\(10\), \(5\)]\)"},{-50000,"-5.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{0,"0"},{50000,"5.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{100000,"1.0\[Times]\!\(\*SuperscriptBox[\(10\), \(5\)]\)"}},None},{{{0,"0"},{10000,"1.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{20000,"2.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{30000,"3.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{40000,"4.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"},{50000,"5.0\[Times]\!\(\*SuperscriptBox[\(10\), \(4\)]\)"}},None}}];*)


(* ::Input:: *)
(*(*Graph for "Probabilistic Acceptance" with respect to $\alpha_k$,excluding outliers and boundary $\alpha_k=k$*)*)
(*figDownLimit2=Show[figDownLimit,figUpDwnLimitboundary]*)


(* ::Input:: *)
(*fig=GraphicsGrid[{{figMean,figVar},{figAlphaStayDwnUp,figUpDownAll},{figUpLimit2,figDownLimit2}},Alignment->Right]*)
