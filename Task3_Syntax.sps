* Encoding: UTF-8.

*Checking suitability for factor analysis (KMO and Bartlett's):

FACTOR
  /VARIABLES PER1 PER2 PER3 RUM1 RUM2 RUM3 EX1 EX2 EX3 EX4
  /MISSING LISTWISE 
  /ANALYSIS PER1 PER2 PER3 RUM1 RUM2 RUM3 EX1 EX2 EX3 EX4
  /PRINT INITIAL KMO EXTRACTION
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /ROTATION NOROTATE
  /METHOD=CORRELATION.

*Checking normality (skewness and kurtosis and looking for elipitical shapes):

DESCRIPTIVES VARIABLES=PER1 PER2 PER3 RUM1 RUM2 RUM3 EX1 EX2 EX3 EX4
  /STATISTICS=MEAN STDDEV MIN MAX KURTOSIS SKEWNESS.

*Skew <2.0 and Kurtosis <10.0 - checking scatterplots...

GRAPH
  /SCATTERPLOT(MATRIX)=PER1 PER2 PER3 RUM1 RUM2 RUM3 EX1 EX2 EX3 EX4
  /MISSING=LISTWISE.

*Looks like quite a lot of non-normality (non-eliptical shapes)! Perform robust ML-estimation in AMOS using bootstrapping. 

*Descriptive stats (min, max and range), produced for all variables to check that no evidence of impossible/unexpected values.

DATASET ACTIVATE DataSet1.
DESCRIPTIVES VARIABLES=Age Gender PER1 PER2 PER3 RUM1 RUM2 RUM3 EX1 EX2 EX3 EX4
  /STATISTICS=MEAN STDDEV MIN MAX.

*No evidence of impossible values therefore no values coded as missing.

*Missing Values Analysis performed.

MVA VARIABLES=Age PER1 PER2 PER3 RUM1 RUM2 RUM3 EX1 EX2 EX3 EX4 GENDER
  /MAXCAT=25
  /CATEGORICAL=GENDER
  /MPATTERN
  /EM(TOLERANCE=0.001 CONVERGENCE=0.0001 ITERATIONS=25).

*Data is MCAR and rate of missingness is low (<5%) - listwise deletion will be approrpiate.

*Box-plots produced to detect univariate outliers in variables of interest (i.e. PER1+2+3, RUM1+2+3, EX1+2+3+4)

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=PER1 MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: PER1=col(source(s), name("PER1"))
  DATA: id=col(source(s), name("$CASENUM"), unit.category())
  GUIDE: axis(dim(2), label("PER1"))
  GUIDE: text.title(label("Simple Boxplot of PER1"))
  ELEMENT: schema(position(bin.quantile.letter(1*PER1)), label(id))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=PER2 MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: PER2=col(source(s), name("PER2"))
  DATA: id=col(source(s), name("$CASENUM"), unit.category())
  GUIDE: axis(dim(2), label("PER2"))
  GUIDE: text.title(label("Simple Boxplot of PER2"))
  ELEMENT: schema(position(bin.quantile.letter(1*PER2)), label(id))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=PER3 MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: PER3=col(source(s), name("PER3"))
  DATA: id=col(source(s), name("$CASENUM"), unit.category())
  GUIDE: axis(dim(2), label("PER3"))
  GUIDE: text.title(label("Simple Boxplot of PER3"))
  ELEMENT: schema(position(bin.quantile.letter(1*PER3)), label(id))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=RUM1 MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: RUM1=col(source(s), name("RUM1"))
  DATA: id=col(source(s), name("$CASENUM"), unit.category())
  GUIDE: axis(dim(2), label("RUM1"))
  GUIDE: text.title(label("Simple Boxplot of RUM1"))
  ELEMENT: schema(position(bin.quantile.letter(1*RUM1)), label(id))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=RUM2 MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: RUM2=col(source(s), name("RUM2"))
  DATA: id=col(source(s), name("$CASENUM"), unit.category())
  GUIDE: axis(dim(2), label("RUM2"))
  GUIDE: text.title(label("Simple Boxplot of RUM2"))
  ELEMENT: schema(position(bin.quantile.letter(1*RUM2)), label(id))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=RUM3 MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: RUM3=col(source(s), name("RUM3"))
  DATA: id=col(source(s), name("$CASENUM"), unit.category())
  GUIDE: axis(dim(2), label("RUM3"))
  GUIDE: text.title(label("Simple Boxplot of RUM3"))
  ELEMENT: schema(position(bin.quantile.letter(1*RUM3)), label(id))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=EX1 MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: EX1=col(source(s), name("EX1"))
  DATA: id=col(source(s), name("$CASENUM"), unit.category())
  GUIDE: axis(dim(2), label("EX1"))
  GUIDE: text.title(label("Simple Boxplot of EX1"))
  ELEMENT: schema(position(bin.quantile.letter(1*EX1)), label(id))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=EX2 MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: EX2=col(source(s), name("EX2"))
  DATA: id=col(source(s), name("$CASENUM"), unit.category())
  GUIDE: axis(dim(2), label("EX2"))
  GUIDE: text.title(label("Simple Boxplot of EX2"))
  ELEMENT: schema(position(bin.quantile.letter(1*EX2)), label(id))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=EX3 MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: EX3=col(source(s), name("EX3"))
  DATA: id=col(source(s), name("$CASENUM"), unit.category())
  GUIDE: axis(dim(2), label("EX3"))
  GUIDE: text.title(label("Simple Boxplot of EX3"))
  ELEMENT: schema(position(bin.quantile.letter(1*EX3)), label(id))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=EX4 MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: EX4=col(source(s), name("EX4"))
  DATA: id=col(source(s), name("$CASENUM"), unit.category())
  GUIDE: axis(dim(2), label("EX4"))
  GUIDE: text.title(label("Simple Boxplot of EX4"))
  ELEMENT: schema(position(bin.quantile.letter(1*EX4)), label(id))
END GPL.

*3 extreme outliers identified on RUM1 (cases 120, 125, 191); when data ordered by Num Ascending)

*Mahalanobis Distances being used to identify multivariate outliers. 

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Num
  /METHOD=ENTER Age PER1 PER2 PER3 RUM1 RUM2 RUM3 EX1 EX2 EX3 EX4 
  /SAVE MAHAL.

COMPUTE Prob_MAH=1-CDF.CHISQ(MAH_1,11).
EXECUTE.

*3 multivariate outliers identified; ID Num 276, 291 and 230

*Decision made to exclude extreme and multivariate outliers and check impact via Sen Analysis.Missing Data excluded via listwise deletion.

USE ALL.
COMPUTE filter_$=(Missing_ID = 0 AND RUM1  <= 6 AND Prob_MAH  >=  0.001).
VARIABLE LABELS filter_$ 'Missing_ID = 0 AND RUM1  <= 6 AND Prob_MAH  >=  0.001 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

*Checking for multicollinearity:

CORRELATIONS
  /VARIABLES=PER1 PER2 PER3 RUM1 RUM2 RUM3 EX1 EX2 EX3 EX4
  /PRINT=TWOTAIL NOSIG
  /STATISTICS DESCRIPTIVES
  /MISSING=LISTWISE.

*Then importing to AMOS.

--

--

--

--

*Sensitivty Analysis: filter variable turned off for univariate outliers on 'Rum1' and multivariate outliers.

USE ALL.
COMPUTE filter_$=(Missing_ID=0).
VARIABLE LABELS filter_$ 'Missing_ID=0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.






