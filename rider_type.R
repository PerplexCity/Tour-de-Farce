library(ggplot2)
race_results <- read.csv("~/Desktop/race_results.csv")
bbi<-element_text(face="bold.italic", color="black")
nun <- element_blank()
ggplot(race_results, aes(x = tripduration., col = X.usertype.)) + 
  geom_density() + xlim(0,5000) + 
  theme(title = bbi, axis.ticks.x=nun, axis.text.x=nun, legend.title = nun) + 
  labs (title="Speedy Subscribers", x="Duration\n← Faster   Slower →", y="Frequency\n← Less  More→") +
  scale_y_continuous(breaks=c(0.0005, 0.001, 0.0015), labels = c(".05%", ".01%", ".015%"))