plot(wild_Chr01$sample_id, wild_Chr01$mean)

ggplot(data = wild_Chr01, aes(x = sample_id, y = mean)) +
  geom_bar(stat = "identity") +
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "HanXRQChr01_Coverage_Wild") +
  #annotate("text", x = 18, y = 13.5, label = "*", size = 8) +
  #annotate("text", x = 13, y = 10.5, label = "*", size = 8) +
  #annotate("text", x = 10, y = 9, label = "*", size = 8) +
  #annotate("text", x = 22, y = 8, label = "*", size = 8) +
  #annotate("text", x = 24, y = 3.75, label = "*", size = 8) 

plot(landrace_Chr01$sample_id, landrace_Chr01$mean)

ggplot(data = landrace_Chr01, aes(x = sample_id, y = mean)) +
  geom_bar(stat = "identity") +
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "HanXRQChr01_Coverage_Landrace") +
  #annotate("text", x = 7, y = 14, label = "*", size = 8) +
  #annotate("text", x = 24, y = 6, label = "*", size = 8) +
  #annotate("text", x = 13, y = 5.5, label = "*", size = 8) +
  #annotate("text", x = 6, y = 5, label = "*", size = 8) +
  #annotate("text", x = 23, y = 4.75, label = "*", size = 8)
