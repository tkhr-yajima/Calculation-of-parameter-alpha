(* ::Package:: *)

(* ::Input:: *)
(*Clear["Global`*"]*)


(* ::Input:: *)
(*(*Load the calculation results for Case A*)*)
(*listx=Import["listx_Numerical_example_case_A.csv"];*)
(*listMean=Flatten[Import["listMean_Numerical_example_case_A.csv"]];*)
(*listVar=Flatten[Import["listVar_Numerical_example_case_A.csv"]];*)
(*listr=Import["listr_Numerical_example_case_A.csv"];*)
(*listAlphak=Import["listAlphak_Numerical_example_case_A.csv"];*)
(*listAlphak3=Import["listAlphak3_Numerical_example_case_A.csv"];*)


(* ::Input:: *)
(*(*Total iteration*)*)
(*n=50000;*)


(* ::Input:: *)
(*(*M1,M2,M3,M:Equations (36)-(39),N1,N2,N3,N:Equations (40)-(43)*)*)
(*(*alphakM:Numerator of Equation (35),alphakN:Denominator of Equation (35)*)*)
(*M1=(k+1)*(muk1-muk)*wk1;*)
(*M2=(muk1-muk)^2*((k+2)*wk+2*k*(k+1)*wk1)-(k+2)*(wk1-wk)*wk1;*)
(*M3=k*(muk1-muk)^3*((k+2)*wk-2*(k+1)*wk1);*)
(*N1=-(k+1)*(muk1-muk)*(wk1-wk);*)
(*N2=(muk1-muk)^2*((2*k^2+3*k+2)*wk-2*k*(k+1)*wk1)+(k+2)*(wk1-wk)^2;*)
(*N3=k*(muk1-muk)^3*(2*(k+1)*wk1-k*wk);*)
(*alphakM=M1*Deltaxk2^2+M2*Deltaxk2+M3;*)
(*alphakN=N1*Deltaxk2^2+N2*Deltaxk2+N3;*)
(*alphak=alphakM/alphakN;*)


(* ::Input:: *)
(*(*Determine the step number $k$ and the value of $\alpha_k$ for which $\alpha_k$ becomes an outlier.*)*)
(*listAlphaUp={};*)
(*Do[If[listr[[i+1]][[2]]==1,AppendTo[listAlphaUp,listAlphak3[[i]]]],{i,1,Length[listAlphak3]}];*)
(*listAlphaDwn={};*)
(*Do[If[listr[[i+1]][[2]]==-1,AppendTo[listAlphaDwn,listAlphak3[[i]]]],{i,1,Length[listAlphak3]}];*)
(**)
(*listoutlier={};*)
(*Table[If[listAlphaUp[[i]][[2]]>1.0*10^7,AppendTo[listoutlier,listAlphaUp[[i]]]],{i,1,Length[listAlphaUp]}];*)
(*Table[If[listAlphaDwn[[i]][[2]]>1.0*10^7,AppendTo[listoutlier,listAlphaDwn[[i]]]],{i,1,Length[listAlphaDwn]}];*)
(*Table[If[listAlphaUp[[i]][[2]]<-1.0*10^7,AppendTo[listoutlier,listAlphaUp[[i]]]],{i,1,Length[listAlphaUp]}];*)
(*Table[If[listAlphaDwn[[i]][[2]]<-1.0*10^7,AppendTo[listoutlier,listAlphaDwn[[i]]]],{i,1,Length[listAlphaDwn]}];*)


(* ::Input:: *)
(*(*Determine M and N for which \[Alpha]k becomes an outlier.*)*)
(*listMOutlier=Table[*)
(*alphakM/.{k->listoutlier[[i]][[1]],Deltaxk2->listDeltax[[listoutlier[[i]][[1]]+1]],muk1->listMean[[listoutlier[[i]][[1]]+1]],muk->listMean[[listoutlier[[i]][[1]]]],wk1->listVar[[listoutlier[[i]][[1]]+1]],wk->listVar[[listoutlier[[i]][[1]]]]},{i,1,Length[listoutlier]}];*)
(*listNOutlier=Table[*)
(*alphakN/.{k->listoutlier[[i]][[1]],Deltaxk2->listDeltax[[listoutlier[[i]][[1]]+1]],muk1->listMean[[listoutlier[[i]][[1]]+1]],muk->listMean[[listoutlier[[i]][[1]]]],wk1->listVar[[listoutlier[[i]][[1]]+1]],wk->listVar[[listoutlier[[i]][[1]]]]},{i,1,Length[listoutlier]}];*)


(* ::Input:: *)
(*(*For the number of steps $k$ at which an outlier occurs,solve for the denominator $N$ in the expression $\alpha_k=M/N$ by treating it as a quadratic equation in terms of $\Delta x$.*)*)
(*solalphakN=Solve[alphakN==0,Deltaxk2];*)
(*solalphakN1=Deltaxk2/.solalphakN[[1]];*)
(*solalphakN2=Deltaxk2/.solalphakN[[2]];*)


(* ::Input:: *)
(*(*Numerical solution for N=0 in the case of an outlier*)*)
(*solalphakNoutlier=Table[*)
(*{solalphakN1/.{k->listoutlier[[i]][[1]],Deltaxk2->listDeltax[[listoutlier[[i]][[1]]+1]],muk1->listMean[[listoutlier[[i]][[1]]+1]],muk->listMean[[listoutlier[[i]][[1]]]],wk1->listVar[[listoutlier[[i]][[1]]+1]],wk->listVar[[listoutlier[[i]][[1]]]]},*)
(*solalphakN2/.{k->listoutlier[[i]][[1]],Deltaxk2->listDeltax[[listoutlier[[i]][[1]]+1]],muk1->listMean[[listoutlier[[i]][[1]]+1]],muk->listMean[[listoutlier[[i]][[1]]]],wk1->listVar[[listoutlier[[i]][[1]]+1]],wk->listVar[[listoutlier[[i]][[1]]]]}},{i,1,Length[listoutlier]}]*)


(* ::Input:: *)
(*(*Pairs of iteration and random variable \(\Delta x\) that result in an outlier*)*)
(*listDeltaxoutlierk=Table[{listoutlier[[i]][[1]],listDeltax[[listoutlier[[i]][[1]]+1]][[1]]},{i,1,Length[listoutlier]}]*)


(* ::Input:: *)
(*(*Determine the rational number \(\alpha_k\) used when introducing outliers.*)*)
(*listxRationalize=Flatten[Rationalize[listx,0]];*)
(*(*Rationalized mean*)*)
(*listMeanRationalize={listxRationalize[[1]]};*)
(*Do[meanx=Rationalize[(1/(i+1))*(listxRationalize[[i+1]]+i*listMeanRationalize[[i]]),0];*)
(*AppendTo[listMeanRationalize,meanx]*)
(*,{i,1,n-1}];*)
(*(*Rationalized variance*)*)
(*listVarRationalize={0};*)
(*Do[varx=(i/(i+1))*listVarRationalize[[i]]+i*(listMeanRationalize[[i+1]]-listMeanRationalize[[i]])^2;*)
(*AppendTo[listVarRationalize,varx],{i,1,n-1}];*)
(*(*Rationalized random variable*)*)
(*listDeltaxRationalize=Flatten[Rationalize[listDeltax,0]];*)
(*(*Calculating outliers using the mean,variance,and random numbers,all converted into rational numbers.*)*)
(*alphakRationalize=Table[alphak/.{k->listoutlier[[i]][[1]],Deltaxk2->listDeltaxRationalize[[listoutlier[[i]][[1]]+1]],muk1->listMeanRationalize[[listoutlier[[i]][[1]]+1]],muk->listMeanRationalize[[listoutlier[[i]][[1]]]],wk1->listVarRationalize[[listoutlier[[i]][[1]]+1]],wk->listVarRationalize[[listoutlier[[i]][[1]]]]},{i,1,Length[listoutlier]}];*)
(*(*Convert to 15 significant digits.*)*)
(*NalphakRationalize15=N[alphakRationalize,15]*)
