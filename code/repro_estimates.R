
library(tidyverse)

# load the complete and clean Heliconia dataset ---------------------------


ha_data<-read_csv("./data/survey_clean/heliconia_survey_clean.csv")
# check for zombie plants  ------------------------------------------------


ha_rep_size<-ha_data %>% filter(shts>1) %>% 
  group_by(year,shts) %>% 
  summarize(n=n_distinct((plant_id)))

ha_rep_count<-ha_data %>% filter(shts>1) %>% 
  group_by(year,shts) %>% 
  filter(is.na(infl)==FALSE) %>% 
  summarize(n_rep=n_distinct((plant_id)))

ha_rep_count$n_rep

reps<-full_join(ha_rep_count,ha_rep_size) %>% 
  mutate(perc=n_rep/n*100) %>% 
  arrange(desc(perc)) %>% 
  mutate(n_rep = replace_na(n_rep, 0))

reps
hist(reps$n)
hist(reps$n_rep)
sum(reps$n)
sum(reps$n_rep)
mean(reps$perc,na.rm = TRUE)

ha_data2<-ha_data %>% filter(habitat!="10-ha")
ha_rep_size2<-ha_data2 %>% 
  filter(shts>1) %>% 
  mutate(shts_bin = cut(shts, breaks=c(0,1,2, 3, 4, 5,6,7,25), 
                        labels = c("1", "2", "3", "3", "4","5","6","7 or more"))) %>% 
  group_by(habitat,year,shts_bin) %>% 
  summarize(n=n_distinct((plant_id)))

ha_rep_count2<-ha_data2 %>% 
  filter(shts>1) %>% 
  mutate(shts_bin = cut(shts, breaks=c(0,1,2, 3, 4, 5,6,7,25),
                        labels = c("1", "2", "3", "3", "4","5","6","7 or more"))) %>% 
  group_by(year,shts_bin) %>% 
  filter(is.na(infl)==FALSE) %>% 
  summarize(n_rep=n_distinct((plant_id)))



reps2<-full_join(ha_rep_count2,ha_rep_size2) %>% 
  mutate(perc=n_rep/n*100) %>% 
  arrange(desc(perc)) %>% 
  mutate(n_rep = replace_na(n_rep, 0))


reps2
hist(reps2$n)
hist(reps2$n_rep)
sum(reps2$n)
sum(reps2$n_rep)
mean(reps2$perc,na.rm = TRUE)



reps2_summary<-reps2 %>% group_by(shts_bin) %>% summarize(mean=mean(perc),sd=sd(perc))


plot2 <- reps2_summary %>%
  ggplot(aes(x=shts_bin, y=mean)) +
  geom_point()
plot2

plot2 <- reps2 %>%
  ggplot( aes(x=shts_bin, y=n_rep, group=year, color=year)) +
  geom_line()
plot2





plot2 <- reps2 %>%
  ggplot( aes(x=shts_bin, y=perc, group=year, color=year)) +
  geom_line()
plot2
-----







ha_data3<-ha_data %>% filter(habitat!="10-ha")
ha_rep_size3<-ha_data2 %>% 
  filter(shts>1) %>% 
  # mutate(shts_bin = cut(shts, breaks=c(0,1,2, 3, 4, 5,6,7,25))) %>% 
  group_by(year) %>% 
  summarize(n=n_distinct((plant_id)))

ha_rep_count3<-ha_data2 %>% 
  filter(shts>1) %>% 
  # mutate(shts_bin = cut(shts, breaks=c(0,1,2, 3, 4, 5,6,7,25))) %>% 
  group_by(year) %>% 
  filter(is.na(infl)==FALSE) %>% 
  summarize(n_rep=n_distinct((plant_id)))



reps3<-full_join(ha_rep_count3,ha_rep_size3) %>% 
  mutate(perc=n_rep/n*100) %>% 
  arrange(desc(perc)) %>% 
  mutate(n_rep = replace_na(n_rep, 0))


reps3
hist(reps3$n)
hist(reps3$n_rep)
sum(reps3$n)
sum(reps3$n_rep)
mean(reps3$perc,na.rm = TRUE)





plot3 <- reps3 %>%
  ggplot( aes(x=year, y=perc, color=year)) +
  geom_line()
plot3

plot3<- reps3 %>%
  ggplot( aes(x=year, y=n_rep, color=year)) +
  geom_line()
plot3
----
  
  

# spaghetting plot

  
  reps2


  reps2_summary<-reps2 %>% 
    group_by(shts_bin) %>% 
    summarize(perc1=mean(perc),sd=sd(perc)) %>% 
    rename(perc=perc1) %>% 
    mutate(year="mean")

  reps2$year<-as.character(reps2$year)
  
  
  
  
  
  
  reps4<-full_join(reps2,reps2_summary,by=c("perc","shts_bin","year")) %>% 
    mutate(year=as.factor(year)) %>% 
    mutate(shts_bin=as.factor(shts_bin))
  
  reps4<-reps4 %>%
    mutate(highlight=ifelse(year=="mean","mean","other")) %>% 
    mutate(year=as.character(year)) %>% 
    mutate(year=ifelse(year=="2002","       2002",year)) 
  
library(hrbrthemes)

plot4<-reps4 %>%
  ggplot(aes(x=shts_bin, y=perc, group=year, size=highlight,color=highlight)) +
  scale_y_continuous(breaks=c(0,10,20,30,40,50,60))+
  labs(x="shoots",y="Percent Flowering")+
  geom_line() +
  expand_limits(x= c(-0, 9))+
  geom_text(data=reps4 %>% filter(shts_bin=="7 or more"), 
            aes(label = year,
                x = shts_bin, 
                y = perc, 
                color = highlight),
            size=5,
            hjust = -.2,
            position = position_dodge(0.0))+ 
    
  # geom_text(aes(label = year))+
  scale_color_manual(values = c("#69b3a2","lightgrey")) +
  scale_size_manual(values=c(1.0,0.5)) +
  theme(legend.position="none") +
  # ggtitle("Popularity of American names in the previous 30 years") +
  theme_classic() +
  theme(
    legend.position="none",
    plot.title = element_text(size=14)
  )
  plot4