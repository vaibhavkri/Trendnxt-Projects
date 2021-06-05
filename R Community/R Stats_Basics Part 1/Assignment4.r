mean_men<-177 #mean
sd_men<-10 #standard deviation
val_men<-200 #target value
z_mean<-(val_men - mean_men)/sd_men # calculating z-score
p_men<-pnorm(z_mean) #area under the curve from -infinity till the taget value
p_target<-1 - p_men #area under the curve is 1. So substracting from 1 toget the target area
Prob_target<-p_target*100
