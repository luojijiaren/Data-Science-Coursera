Code book

I) Acquisition of the data
The data we cleaned in this assignment are measured using the accelerometers and
gyroscopes of Samsung cell phones J2. The measurement carried out in the time domain is
captured at a constant rate of 50 Hz.
II) Short description
The data have been grouped by subject.id (1st column) and activity (last column).
The rest of the column contain the mean for each variable described in III for each subject
and each activity.
III) Variables
? subject.id: ID of the subject
? activity: The activity carried out by the subject.
? The other columns are already described in the features_info file provided with the
data. We can nevertheless recall a short guide to understand these variables.
o If the variable name start by t (respectively f) it is in the time domain
(respectively the Fourier domain)
o The data are derived from two raw signals tAcc and tGyro
o These raw signals are separated into body and gravity acceleration signals
(tBodyAcc and tGravityAcc)
o Jerk signal (time rate change of the acceleration) is derived (Jerk contained in
the name).
o Euclidian magnitude is derived (Mag contained in the name)
o The axis of measurement is indicated by a X, Y or a Z
o Extra derivations are carried out (from features_info)
? mean(): Mean value
? std(): Standard deviation
? mad(): Median absolute deviation
? max(): Largest value in array
? min(): Smallest value in array
? sma(): Signal magnitude area
? energy(): Energy measure. Sum of the squares divided by the number
of values.
? iqr(): Interquartile range
? entropy(): Signal entropy
? arCoeff(): Autorregresion coefficients with Burg order equal to 4
? correlation(): correlation coefficient between two signals
? maxInds(): index of the frequency component with largest magnitude
? meanFreq(): Weighted average of the frequency components to obtain
a mean frequency
? skewness(): skewness of the frequency domain signal
? kurtosis(): kurtosis of the frequency domain signal
? bandsEnergy(): Energy of a frequency interval within the 64 bins of
the FFT of each window.
? angle(): Angle between to vectors