# Eyewitness Identification and the Time Delay
## Executive Summary
Eyewitnesses have long played a significant role in criminal investigations and prosecutions. The amount of time taken for witnesses to arrive at a decision might affect the accuracy of their memory. Some research shows that time delay of an initial identification is a strong predictor of accuracy, and the identification accuracy worsens as the time delay increases. The client wonders the connection between the time delay and accuracy of memory, and whether there are variables that
systematically influence the connection.

## 1. Is the accuracy of memory(```Accuracy```) and the time delay(```Delay```) related?
Before starting the analysis, I omitted one observation with a missing value, so there are 3644 observations. To investigate the connection between the time delay and the accuracy of memory, I fit a logistic regression model. With ```Accuracy``` as a response and ```Delay``` as an explanatory variable, all factors of ```Delay``` are significant based on the p-values (see below).

```
              Estimate   Std. Error   z value   Pr(>|z|)
(Intercept)   -0.41028      0.06944    -5.909   3.45e-09 ***
Delay4day     -0.22862      0.09781    -2.337     0.0194 *
Delay8day     -0.22111      0.09699    -2.280     0.0226 *
DelayImmediate 0.60297      0.09687     6.225   4.83e-10 ***
```

Before dividing the data by the time delay groups, the whole data are used to calculate the accuracy and true positive/negative rates.

## 2. The Accuracy Rate and the True Rates: the whole data
<p align="center"><img src="images/table1.png"></p>
<h4 align="center">Table 1: Two-way table with the number of observations</h4>

The above table shows the number of participants resulted as accurate or non-accurate on the tests with and without target photos regardless the time delay. The accuracy defines the overall correct result. The true positive rate defines the proportion of target-present observations that are answered (target was chosen) correctly. The true negative rate defines the proportion of target-absent observations that are answered (no targets were chosen) correctly.
- Accuracy Rate = (946+540) / 3644 = 0.41
- True Positive Rate = 946 / (946+583+695) = 0.43
- True Negative Rate = 540 / (540+880) = 0.38

Based on the whole data, the true positive rate is slightly higher than other rates. It means that participants tended to choose the right target with the photo of target rather than not to choose any targets with the photos of innocent people. To investigate how the rate is changed based on the time delay, the data are divided by 4 groups of delayed time: immediate, 2 days, 4 days, and 8 days.


## 3. The Accuracy Rate and the True Rates: 4 time-delay groups
<p align="center"><img src="images/table2.png"></p>
<h4 align="center">Table 2: Two-way table of the Immediate group</h4>

- Accuracy = (181+304) / 885 = 0.55
- True Positive Rate = 181 / (181+87+170) = 0.41
- True Negative Rate = 304 / (304+143) = 0.68

Based on the Immediate group (Table 2), the overall accuracy and true negative rate are higher than 50%. Especially, the true negative rate is 0.68 which means that 68% of participants tended not to choose innocent person immediately after they witnessed the face of the actor. However, even right after the witnessing, the percentage of choosing the right target among photos with a target is less than a half—the true positive rate.

<p align="center"><img src="images/table3.png"></p>
<h4 align="center">Table 3: Two-way table of the 2-day group</h4>

- Accuracy = (128+217) / 865 = 0.40
- True Positive Rate = 128 / (128+135+169) = 0.30
- True Negative Rate = 217 / (217+216) = 0.50

Based on the 2-day data (Table 3), all rates are decreased compared to the immediate data. Especially, the true negative rate is decreased by 18%.

<p align="center"><img src="images/table4.png"></p>
<h4 align="center">Table 4: Two-way table of the 4-day group</h4>

- Accuracy = (130+192) / 932 = 0.35
- True Positive Rate = 130 / (130+168+175) = 0.27
- True Negative Rate = 192 / (192+267) = 0.42

<p align="center"><img src="images/table5.png"></p>
<h4 align="center">Table 5: Two-way table of the 8-day group</h4>

- Accuracy = (101+233) / 962 = 0.35
- True Positive Rate = 101 / (101+193+181) = 0.21
- True Negative Rate = 233 / (233+254) = 0.48

Based on the 4-day (Table 4) and 8-day data (Table 5), the accuracy doesn’t change, the true positive rate decreases, and the true negative rate increases. Overall, the rates are decreased as the time delays, but the rates change notedly from the immediate to 2-day delays.

<p align="center"><img src="images/delay_rate.png"></p>
<h4 align="center">Figure 1: Accuracy and true rates by the time delay</h4>

Figure 1 shows the combined results of accuracy and true rates from Table 2-5. The overall of the delay time, the true positive rates are the lowest. Hence, the rate of choosing a culprit among several photos with the real culprit are not very reliable.

## 4. Other significant variables
To explore whether there are variables that influence the connection of ```Accuracy``` and ```Delay```, I fit several logistic regression models. The first model is fitted with all the variables except participant specific values, and then additional models are fitted removing less significant variables based on p-values.

```
                Estimate  Std. Error  z value   Pr(>|z|)
(Intercept)    -0.937835    0.238867   -3.926   8.63e-05 ***
Delay4day      -0.148719    0.105348   -1.412     0.1580
Delay8day      -0.171781    0.104980   -1.636     0.1018
DelayImmediate  0.554722    0.105787    5.244   1.57e-07 ***
VideoWM         0.169672    0.073926    2.295     0.0217 *
TPTATP         -0.879176    0.074347  -11.825    < 2e-16 ***
ChooserYes     -1.156658    0.073968  -15.637    < 2e-16 ***
Confidence      0.007762    0.001551    5.006   5.56e-07 ***
CFMT.Raw        0.018085    0.003720    4.861   1.17e-06 ***
```

The above summary table shows the summary of the final model with 5 significant variables. ```Video``` has two race factors of actors, and ```TPTA``` indicates whether the target is present or absent. ```Chooser``` indicates whether a participant choose a photo or not, and ```Confidence``` has 6-scale values based on the level of confidence of participants. ```CFMT.Raw``` has results of the face recognition task.
