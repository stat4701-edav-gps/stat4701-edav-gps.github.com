##Initial regression models

	dfb2$mavgbrdist <- dfb2$avgbrdist*0.3048 
	dfb2$mavgbrdist1 <- dfb2$avgbrdist+.00000001
	dfb2$logmavgbrdist1 <- log(dfb2$mavgbrdist1)
	
	fit1 <- lm(dfb2$dist_bldg_hght ~ dfb2$logmavgbrdist1)
	summary(fit1) 
	confint(fit1, level=0.95)
	
	fit2 <- update(block.model, correlation = corGaus(.1,form = ~x+z), method = "ML")
	summary(fit2)




####Every 1-unit increase in distributed building height was associated with approximately a 17% increase in distance from roadbed
0.17, 95% CI = 0.15 \- 0.19, Adjusted R-squared 0.0089