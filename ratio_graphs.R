library(ggplot2)

ratios <- read.csv("~/Desktop/ordered_ratios.csv")
bbi<-element_text(face="bold.italic", color="black")

mf_graph <- ggplot(data=ratios, aes(x=id, y=mf)) +
  geom_bar(stat="identity", fill=I("lightblue"), col=I("lightblue"))+
  theme(legend.position='none', title=bbi) + 
  labs(title="Routes by Male/Female Ratio") +
 ylab("Ratio") + scale_x_discrete() + xlab("") +
  annotate("text", x = 20, y = 75, 
           label = "Top 3 Routes",
           hjust=0, fontface="bold.italic") +
  annotate("text", x = 20, y = 69, 
           label = paste(" W 42 St & 8 Ave → Broadway & W 49 St: 76.46\n",
                          "W 41 St & 8 Ave → E 43 St & Vanderbilt Ave: 62.27\n",
                          "Grand Army Plaza & Central Park S → W 41 St & 8 Ave: 54.29"),
           hjust=0, size = 3) +
  annotate("text", x = 350, y = 15, 
           label = "Bottom 3 Routes",
           hjust=0, fontface="bold.italic") +
  annotate("text", x = 350, y = 9, 
           label = paste(" West St & Chambers St → 11 Ave & W 27 St: 0.80\n",
                          "11 Ave & W 59 St → West St & Chambers St: 0.82\n",
                          "Barrow St & Hudson St → West St & Chambers St: 0.98"), 
           hjust=0, size = 3) 

yo_graph <- ggplot(data=ratios, aes(x=id, y=yo)) +
  geom_bar(stat="identity", fill=I("lightblue"), col=I("lightblue"))+
  theme(legend.position='none', title=bbi) + 
  labs(title="Routes by Young/Old Ratio") +
  ylab("Ratio") + scale_x_discrete() + xlab("") +
  annotate("text", x = 20, y = 127, 
           label = "Top 3 Routes",
           hjust=0, fontface="bold.italic") +
  annotate("text", x = 20, y = 117, 
           label = paste(" Adelphi St & Myrtle Ave → Willoughby St & Fleet St: 132.60\n",
                          "6 Ave & Canal St → Barclay St & Church St: 102.33\n",
                          "Adelphi St & Myrtle Ave → DeKalb Ave & Hudson Ave: 46.86"), 
           hjust=0, size=3) +
  annotate("text", x = 350, y = 26, 
           label = "Bottom 3 Routes",
           hjust=0, fontface="bold.italic") +
  annotate("text", x = 350, y = 16, 
           label = paste(" Grand Army Plaza & Central Park S → W 41 St & 8 Ave: 0.31\n",
                          "8 Ave & W 31 St → E 39 St & 3 Ave: 0.59\n",
                          "Broadway & E 22 St → Pershing Sq North: 0.68"), 
           hjust=0, size=3) 

we_graph <- ggplot(data=ratios, aes(x=id, y=we)) +
  geom_bar(stat="identity", fill=I("lightblue"), col=I("lightblue"))+
  theme(legend.position='none', title=bbi) + 
  labs(title="Routes by Weekday/Weekend Ratio") +
  ylab("Ratio") + scale_x_discrete() + xlab("") +
  annotate("text", x = 20, y = 130, 
           label = "Top 3 Routes",
           hjust=0, fontface="bold.italic") +
  annotate("text", x = 20, y = 120, 
           label = paste(" 8 Ave & W 31 St → E 47 St & Park Ave: 137.00\n",
                          "E 47 St & Park Ave → W 41 St & 8 Ave: 114.12\n",
                          "W 42 St & 8 Ave → E 47 St & Park Ave : 97.37"), 
           hjust=0, size=3) +
  annotate("text", x = 340, y = 26, 
           label = "Bottom 3 Routes",
           hjust=0, fontface="bold.italic") +
  annotate("text", x = 340, y = 16, 
           label = paste(" Yankee Ferry Terminal → Yankee Ferry Terminal: 0.17\n",
                          "Soissons Landing → Soissons Landing: 0.92\n",
                          "Atlantic Ave & Furman St → Atlantic Ave & Furman St : 1.03"), 
           hjust=0, size=3) 

jd_graph <- ggplot(data=ratios, aes(x=id, y=jd)) +
  geom_bar(stat="identity", fill=I("lightblue"), col=I("lightblue"))+
  theme(legend.position='none', title=bbi) + 
  labs(title="Routes by June/December Ratio") +
  ylab("Ratio") + scale_x_discrete() + xlab("") +
  annotate("text", x = 20, y = 10, 
           label = "Top 3 Routes",
           hjust=0, fontface="bold.italic") +
  annotate("text", x = 20, y = 9.2, 
           label = paste(" 8 Ave & W 31 St → W 41 St & 8 Ave: 10.58\n",
                          "8 Ave & W 31 St → E 58 St  & 3 Ave: 7.91\n",
                          "12 Ave & W 40 St → Grand Army Plaza & Central Park S : 6.68"), 
           hjust=0, size=3) +
  annotate("text", x = 360, y = 3, 
           label = "Bottom 3 Routes",
           hjust=0, fontface="bold.italic") +
  annotate("text", x = 360, y = 2.2, 
           label = paste(" W 45 St & 6 Ave → W 33 St & 7 Ave: 0.27\n",
                          "E 20 St & FDR Drive → E 23 St & 1 Ave: 0.29\n",
                          "E 12 St & 3 Ave → Washington Pl & Broadway : 0.39"), 
           hjust=0, size=3) 
