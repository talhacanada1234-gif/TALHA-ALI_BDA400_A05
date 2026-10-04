BDA400 Assignment 5 - Technical Analysis using R
Student: TALHA ALI
Submission name: talha ali _BDA400_A05

CONTENTS
sma.R
ema.R
macd.R
stdev.R
linreg.R
rsi.R
stoch_rsi.R
crossover.R
crossunder.R
test_all.R
README.txt
TALHA ALI_BDA400_A05_Report.docx

REQUIREMENTS
- R / RStudio
- No external packages are required.

RUNNING
1. Open RStudio.
2. Set the working directory to this folder.
3. Run: source("test_all.R")
4. The script prints verification messages and sample results.

INDIVIDUAL FUNCTIONS
source("sma.R")       -> sma(data, period)
source("ema.R")       -> ema(data, period)
source("macd.R")      -> macd(data, short_period, long_period, signal_period)
source("stdev.R")     -> stdev(data)
source("linreg.R")    -> linreg(regressionSource, regressionLength, regressionOffset)
source("rsi.R")       -> rsi(data, period)
source("stoch_rsi.R") -> stoch_rsi(data, period, k_period, d_period)
source("crossover.R") -> crossover(arr1, arr2)
source("crossunder.R")-> crossunder(arr1, arr2)

IMPORTANT
The assignment requires the exact function names shown above. No external libraries are used.

REPOSITORY
Paste the final repository URL into the report cover page before submission.
