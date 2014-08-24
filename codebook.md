# Key features

The feature `subject` identifies individual that performed the actividy. It is qualitative variable with values from 1 to 30.

The feature `activity` is qualitaive (factored) with values: `WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`,
`STANDING` and `LAYING`.

# Measurement features

Measurement features are all quantitative variables. All of them are averages of processed measurements averaged for each
combination of `subject` and `activity`.

The features selected for this database come from the accelerometer (`Acc`) and 
gyroscope (`Gyro`) 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

These time domain signals (prefix `t` to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass 
Butterworth filter with a corner frequency of 20 Hz to remove noise. 

Similarly, the acceleration signal was then separated into body (`Body`) and gravity (`Gravity`) acceleration signals using another low pass
Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in 
time to obtain Jerk signals (tBodyAccJerk(XYZ) and tBodyGyroJerk(XYZ). Also the magnitude of 
these three-dimensional signals were calculated using the Euclidean norm 
(tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 


Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing 
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the `f` to indicate frequency domain signals). 

Each value is either mean value of sampled signal denoted by `Mean` or 
standard deviation denoted by `Std`.


| name                 | type    | min    | Q1     | median | Q3     | mean   | std   | max |
|:---------------------|:--------|-------:|-------:|------: |-------:|-------:|------:|----:|
| tBodyAccMeanX        | numeric | -0.985 | -0.956 | -0.758 | -0.414 | -0.665 | 0.31  | 0.216
| tBodyAccMeanY        | numeric | -0.989 | -0.951 | -0.731 | -0.483 | -0.703 | 0.264 | -0.029
| tBodyAccMeanZ        | numeric | -0.981 | -0.946 | -0.655 | -0.216 | -0.565 | 0.398 | 0.418
| tBodyAccStdX         | numeric | -0.452 | -0.182 | -0.084 | 0.023  | -0.072 | 0.159 | 0.519
| tBodyAccStdY         | numeric | -0.338 | 0.044  | 0.119  | 0.183  | 0.109  | 0.121 | 0.423
| tBodyAccStdZ         | numeric | -0.356 | -0.124 | -0.054 | 0.006  | -0.055 | 0.115 | 0.316
| tGravityAccMeanX     | numeric | -0.482 | -0.29  | -0.185 | -0.062 | -0.176 | 0.157 | 0.373
| tGravityAccMeanY     | numeric | -0.762 | -0.612 | -0.519 | -0.393 | -0.494 | 0.16  | 0.175
| tGravityAccMeanZ     | numeric | -0.624 | -0.345 | -0.209 | -0.065 | -0.19  | 0.232 | 0.638
| tGravityAccStdX      | numeric | -1     | -0.999 | -0.967 | -0.85  | -0.898 | 0.143 | -0.314
| tGravityAccStdY      | numeric | -1     | -1     | -0.979 | -0.853 | -0.911 | 0.125 | -0.278
| tGravityAccStdZ      | numeric | -1     | -1     | -0.989 | -0.93  | -0.953 | 0.069 | -0.626
| tBodyAccJerkMeanX    | numeric | -1     | -0.994 | -0.825 | -0.511 | -0.722 | 0.31  | 0.326
| tBodyAccJerkMeanY    | numeric | -1     | -0.995 | -0.909 | -0.693 | -0.821 | 0.219 | 0.309
| tBodyAccJerkMeanZ    | numeric | -0.993 | -0.98  | -0.797 | -0.255 | -0.611 | 0.397 | 0.337
| tBodyAccJerkStdX     | numeric | -0.904 | -0.748 | -0.158 | 0.447  | -0.145 | 0.598 | 0.811
| tBodyAccJerkStdY     | numeric | -1     | -0.806 | -0.765 | -0.719 | -0.758 | 0.103 | -0.411
| tBodyAccJerkStdZ     | numeric | -0.999 | -0.894 | -0.802 | -0.721 | -0.791 | 0.133 | -0.351
| tBodyGyroMeanX       | numeric | -0.99  | -0.974 | -0.785 | -0.169 | -0.571 | 0.432 | 0.35
| tBodyGyroMeanY       | numeric | -0.993 | -0.984 | -0.895 | -0.544 | -0.756 | 0.257 | -0.006
| tBodyGyroMeanZ       | numeric | -0.993 | -0.981 | -0.788 | -0.131 | -0.545 | 0.468 | 0.664
| tBodyGyroStdX        | numeric | -0.993 | -0.985 | -0.906 | -0.602 | -0.78  | 0.237 | 0.177
| tBodyGyroStdY        | numeric | -0.996 | -0.991 | -0.936 | -0.759 | -0.868 | 0.136 | -0.359
| tBodyGyroStdZ        | numeric | -0.991 | -0.985 | -0.92  | -0.719 | -0.846 | 0.147 | -0.522
| tBodyGyroJerkMeanX   | numeric | -1     | -1     | -0.996 | -0.971 | -0.982 | 0.026 | -0.803
| tBodyGyroJerkMeanY   | numeric | -1     | -1     | -0.97  | -0.748 | -0.847 | 0.198 | 0.168
| tBodyGyroJerkMeanZ   | numeric | -1     | -0.999 | -0.974 | -0.739 | -0.834 | 0.225 | 0.182
| tBodyGyroJerkStdX    | numeric | -1     | -0.999 | -0.929 | -0.647 | -0.811 | 0.229 | 0.205
| tBodyGyroJerkStdY    | numeric | -1     | -0.999 | -0.968 | -0.773 | -0.852 | 0.198 | -0.045
| tBodyGyroJerkStdZ    | numeric | -1     | -0.999 | -0.979 | -0.681 | -0.817 | 0.238 | -0.11
| tBodyAccMagMean      | numeric | -1     | -0.999 | -0.947 | -0.669 | -0.795 | 0.262 | 0.353
| tBodyAccMagStd       | numeric | -1     | -0.999 | -0.958 | -0.732 | -0.828 | 0.23  | 0.065
| tGravityAccMagMean   | numeric | -1     | -1     | -0.984 | -0.919 | -0.948 | 0.075 | -0.57
| tGravityAccMagStd    | numeric | -1     | -1     | -0.997 | -0.951 | -0.956 | 0.101 | 0.039
| tBodyAccJerkMagMean  | numeric | -0.907 | -0.666 | -0.503 | -0.351 | -0.488 | 0.235 | 0.386
| tBodyAccJerkMagStd   | numeric | -1     | -0.999 | -0.972 | -0.732 | -0.84  | 0.213 | 0.083
| tBodyGyroMagMean     | numeric | -1     | -0.999 | -0.982 | -0.876 | -0.923 | 0.109 | -0.435
| tBodyGyroMagStd      | numeric | -0.993 | -0.97  | -0.73  | -0.339 | -0.637 | 0.347 | 0.475
| tBodyGyroJerkMagMean | numeric | -1     | -0.999 | -0.95  | -0.62  | -0.79  | 0.258 | 0.048
| tBodyGyroJerkMagStd  | numeric | -1     | -0.999 | -0.981 | -0.812 | -0.886 | 0.163 | -0.156
| fBodyAccMeanX        | numeric | -0.495 | -0.117 | 0.024  | 0.149  | 0.074  | 0.289 | 0.958
| fBodyAccMeanY        | numeric | -0.997 | -0.982 | -0.969 | -0.951 | -0.964 | 0.025 | -0.83
| fBodyAccMeanZ        | numeric | -0.994 | -0.971 | -0.959 | -0.937 | -0.952 | 0.033 | -0.644
| fBodyAccStdX         | numeric | -0.81  | -0.34  | -0.168 | 0.15   | -0.111 | 0.318 | 0.634
| fBodyAccStdY         | numeric | -0.998 | 0.592  | 0.793  | 0.845  | 0.483  | 0.657 | 0.929
| fBodyAccStdZ         | numeric | -0.996 | -0.956 | -0.908 | -0.794 | -0.74  | 0.416 | 0.838
| fBodyAccJerkMeanX    | numeric | -0.233 | 0.34   | 0.825  | 0.976  | 0.652  | 0.348 | 0.992
| fBodyAccJerkMeanY    | numeric | -0.086 | 0.45   | 0.854  | 0.977  | 0.711  | 0.297 | 0.992
| fBodyAccJerkMeanZ    | numeric | -0.993 | -0.981 | -0.815 | -0.246 | -0.605 | 0.4   | 0.439
| fBodyAccJerkStdX     | numeric | -0.024 | 0.119  | 0.171  | 0.218  | 0.169  | 0.07  | 0.374
| fBodyAccJerkStdY     | numeric | -0.314 | -0.058 | 0.054  | 0.182  | 0.055  | 0.142 | 0.303
| fBodyAccJerkStdZ     | numeric | -0.227 | 0.031  | 0.137  | 0.222  | 0.119  | 0.121 | 0.299
| fBodyGyroMeanX       | numeric | -0.422 | -0.052 | 0.04   | 0.113  | 0.027  | 0.136 | 0.358
| fBodyGyroMeanY       | numeric | -0.373 | -0.106 | 0.041  | 0.152  | 0.04   | 0.187 | 0.61
| fBodyGyroMeanZ       | numeric | -0.346 | -0.058 | 0.04   | 0.143  | 0.05   | 0.172 | 0.522
| fBodyGyroStdX        | numeric | -0.569 | -0.218 | -0.049 | 0.065  | -0.084 | 0.203 | 0.281
| fBodyGyroStdY        | numeric | -0.235 | -0.084 | 0.005  | 0.15   | 0.036  | 0.157 | 0.427
| fBodyGyroStdZ        | numeric | -0.24  | -0.051 | 0.082  | 0.153  | 0.05   | 0.13  | 0.282
| fBodyAccMagMean      | numeric | -0.305 | 0.055  | 0.156  | 0.223  | 0.133  | 0.129 | 0.445
| fBodyAccMagStd       | numeric | -0.204 | -0.09  | -0.073 | -0.061 | -0.074 | 0.036 | 0.027
| fBodyAccJerkMagMean  | numeric | -0.887 | -0.861 | -0.711 | -0.406 | -0.62  | 0.251 | 0.047
| fBodyAccJerkMagStd   | numeric | -0.403 | 0.282  | 0.677  | 0.805  | 0.53   | 0.299 | 0.835
| fBodyGyroMagMean     | numeric | -0.478 | -0.162 | 0.013  | 0.136  | -0.024 | 0.181 | 0.274
| fBodyGyroMagStd      | numeric | -0.157 | -0.103 | -0.099 | -0.091 | -0.096 | 0.023 | -0.022
| fBodyGyroJerkMagMean | numeric | -0.719 | -0.348 | -0.095 | 0.118  | -0.125 | 0.275 | 0.302
| fBodyGyroJerkMagStd  | numeric | -0.224 | 0.054  | 0.135  | 0.215  | 0.124  | 0.112 | 0.362
