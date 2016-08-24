set.seed(839291)

lambda = 0.2
# So expect mean of exponential distribution to be 1/lambda or 5
dat <- as.data.frame(rexp(1000,lambda))
colnames(dat) <- 'val'
mean(dat$val)
qplot(dat$val, bins = 30, colour = I('lightblue'), fill = I('lightblue') ) + abline()

ggplot(data = dat, aes(x=val)) +
  geom_histogram(bins = 30, colour = 'lightblue', fill = 'lightblue') + 
  geom_vline(xintercept = 5, size = 0.5)

y <- NULL
for( i in 1 : 1000 ) y <- c(y, mean(rexp(40,lambda)))
dat2 <- as.data.frame(y)
colnames(dat2) <- 'val'
mean(dat2$val)
qplot(dat2$val, geom = 'histogram', bins = 30, colour = I('lightblue'), fill = I('lightblue') )

ggplot(data = dat2, aes(x=val)) +
  geom_histogram(bins = 30, colour = 'lightblue', fill = 'lightblue', aes(y = ..density..)) + 
#  geom_vline(xintercept = 5, size = 0.5) +
  stat_function(fun = dnorm, args = list(mean = 5, sd = 5/sqrt(40)), size = 1)
