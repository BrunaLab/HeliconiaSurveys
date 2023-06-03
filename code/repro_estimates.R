

# heliconia reproduction in CF --------------------------------------------

library(dplyr)
library(ggplot2)
ha_data<-read_csv("./data/survey_clean/heliconia_survey_clean.csv")
# check for zombie plants  ------------------------------------------------


    
hacf<-ha_data %>% 
  filter(habitat=="CF") %>% 
  filter(recorded_sdlg==FALSE) %>% 
  filter(shts>0) %>% 
  filter(is.na(shts)==FALSE)

size<-hacf %>% 
  group_by(year,shts) %>% 
  summarize(n=n_distinct((plant_id)))

repro<-hacf %>%
  group_by(year,shts) %>% 
  filter(is.na(infl)==FALSE) %>% 
  summarize(n_rep=n_distinct((plant_id)))


max_shts<-max(size$shts,na.rm = TRUE)
cf_rep<-full_join(size,repro) %>% 
  mutate(n_rep = replace_na(n_rep, 0)) %>% 
  mutate(shts_bin = cut(shts, breaks=c(0,1,2, 3, 4, 5,6,7,max_shts), 
                      labels = c("1", "2", "3", "4","5","6","7","8")),
       .after=shts) %>% 
  group_by(year,shts_bin) %>% 
  mutate(n_bin=sum(n),.after=shts_bin) %>% 
  group_by(year,shts_bin) %>% 
  mutate(n_rep_bin=sum(n_rep),.after=n_bin) %>% 
  relocate(n,.after=shts) %>% 
  relocate(n_rep,.after=n) %>% 
  mutate(perc_n=n_rep/n*100) %>% 
  mutate(perc_bin=n_rep_bin/n_bin*100) %>% 
  arrange(year,shts_bin) 
        
cf_rep

cf_rep_summary<-cf_rep %>% 
    group_by(shts_bin) %>% 
    summarize(perc_bin=mean(perc_bin),sd=sd(perc_bin)) %>% 
    mutate(year="12 yr mean")

cf_rep<- cf_rep %>% 
  mutate(year=as.character(year))
  
  
  
  plot_data<- full_join(cf_rep,cf_rep_summary,
                        by=c("perc_bin","shts_bin","year")) %>% 
    mutate(year=as.factor(year)) %>% 
    mutate(shts_bin=as.factor(shts_bin)) %>%
    mutate(highlight=ifelse(year=="12 yr mean","12 yr mean","other")) %>% 
    mutate(year=as.character(year))
  
  
# library(hrbrthemes)

  
  
  
  perc_plot<-plot_data %>%
    ggplot(aes(x=shts_bin, 
               y=perc_bin, 
               group=year, size=highlight,color=highlight)) +
    scale_y_continuous(breaks=c(0,10,20,30,40,50,60))+
    labs(x="shoots",y="Percent Flowering")+
    geom_line() +
    expand_limits(x= c(-0, 9))+
    geom_text(data=plot_data %>% filter(shts_bin=="8") %>% filter(year=="12 yr mean"), 
              aes(label = year,
                  x = shts_bin, 
                  y = perc_bin, 
                  color = highlight),
              size=5,
              hjust = -.2,
              position = position_dodge(0.0))+ 
    scale_x_discrete(labels = c(seq(1,7), "\u2265 8"))+
    # geom_text(aes(label = year))+
    scale_color_manual(values = c("darkgreen","lightgrey")) +
    scale_size_manual(values=c(1.0,0.5)) +
    theme(legend.position="none") +
    # ggtitle("title") +
    theme_classic() +
    theme(
      legend.position="none",
      plot.title = element_text(size=14)
    )
  perc_plot
  
  
  

# n plot ------------------------------------------------------------------

  
  cf_n_summary<-cf_rep %>% 
    group_by(shts_bin) %>% 
    summarize(n_bin=mean(n_bin)) %>% 
    mutate(year="12 yr mean")
  
  cf_rep<- cf_rep %>% 
    mutate(year=as.character(year))
  
  
  
  plot_n_data<- full_join(cf_rep,cf_n_summary,
                        by=c("n_bin","shts_bin","year")) %>% 
    mutate(year=as.factor(year)) %>% 
    mutate(shts_bin=as.factor(shts_bin)) %>%
    mutate(highlight=ifelse(year=="12 yr mean","12 yr mean","other")) %>% 
    mutate(year=as.character(year))  
  
  
  n_plot<-plot_n_data %>%
    ggplot(aes(x=shts_bin, 
               y=n_bin, 
               group=year, size=highlight,color=highlight)) +
    # scale_y_continuous(breaks=c(0,10,20,30,40,50,60))+
    labs(x="shoots",y="number of plants")+
    geom_line() +
    expand_limits(x= c(-0, 9))+
    geom_text(data=plot_n_data %>% filter(shts_bin=="8") %>% filter(year=="12 yr mean"), 
              aes(label = year,
                  x = shts_bin, 
                  y = n_bin, 
                  color = highlight),
              size=5,
              hjust = -.2,
              position = position_dodge(0.0))+ 
    scale_x_discrete(labels = c(seq(1,7), "\u2265 8"))+
    # geom_text(aes(label = year))+
    scale_color_manual(values = c("darkgreen","lightgrey")) +
    scale_size_manual(values=c(1.0,0.5)) +
    theme(legend.position="none") +
    # ggtitle("title") +
    theme_classic() +
    theme(
      legend.position="none",
      plot.title = element_text(size=14)
    )
  n_plot
  
  
  # 
  # library(tidyverse)
  # 
  # # load the complete and clean Heliconia dataset ---------------------------
  # 
  # 
  # ha_data<-read_csv("./data/survey_clean/heliconia_survey_clean.csv")
  # # check for zombie plants  ------------------------------------------------
  # 
  # 
  # ha_rep_size<-ha_data %>% filter(shts>1) %>% 
  #   group_by(year,shts) %>% 
  #   summarize(n=n_distinct((plant_id)))
  # 
  # ha_rep_count<-ha_data %>% filter(shts>1) %>% 
  #   group_by(year,shts) %>% 
  #   filter(is.na(infl)==FALSE) %>% 
  #   summarize(n_rep=n_distinct((plant_id)))
  # 
  # ha_rep_count$n_rep
  # 
  # reps<-full_join(ha_rep_count,ha_rep_size) %>% 
  #   mutate(perc=n_rep/n*100) %>% 
  #   arrange(desc(perc)) %>% 
  #   mutate(n_rep = replace_na(n_rep, 0))
  # 
  # reps
  # hist(reps$n)
  # hist(reps$n_rep)
  # sum(reps$n)
  # sum(reps$n_rep)
  # mean(reps$perc,na.rm = TRUE)
  # 
  # ha_data2<-ha_data %>% filter(habitat=="CF")
  # ha_rep_size2<-ha_data2 %>% 
  #   filter(shts>1) %>% 
  #   mutate(shts_bin = cut(shts, breaks=c(0,1,2, 3, 4, 5,6,7,25), 
  #                         labels = c("1", "2", "3", "3", "4","5","6","7 or more"))) %>% 
  #   group_by(year,shts_bin) %>% 
  #   summarize(n=n_distinct((plant_id)))
  # 
  # ha_rep_count2<-ha_data2 %>% 
  #   filter(shts>1) %>% 
  #   mutate(shts_bin = cut(shts, breaks=c(0,1,2, 3, 4, 5,6,7,25),
  #                         labels = c("1", "2", "3", "3", "4","5","6","7 or more"))) %>% 
  #   group_by(year,shts_bin) %>% 
  #   filter(is.na(infl)==FALSE) %>% 
  #   summarize(n_rep=n_distinct((plant_id)))
  # 
  # 
  # 
  # reps2<-full_join(ha_rep_count2,ha_rep_size2) %>% 
  #   mutate(perc=n_rep/n*100) %>% 
  #   arrange(desc(perc)) %>% 
  #   mutate(n_rep = replace_na(n_rep, 0))
  # 
  # 
  # reps2
  # hist(reps2$n)
  # hist(reps2$n_rep)
  # sum(reps2$n)
  # sum(reps2$n_rep)
  # mean(reps2$perc,na.rm = TRUE)
  # 
  # 
  # 
  # reps2_summary<-reps2 %>% group_by(shts_bin) %>% summarize(mean=mean(perc),sd=sd(perc))
  # 
  # 
  # plot2 <- reps2_summary %>%
  #   ggplot(aes(x=shts_bin, y=mean)) +
  #   geom_point()
  # plot2
  # 
  # plot2 <- reps2 %>%
  #   ggplot( aes(x=shts_bin, y=n_rep, group=year, color=year)) +
  #   geom_line()
  # plot2
  # 
  # 
  # 
  # 
  # 
  # plot2 <- reps2 %>%
  #   ggplot( aes(x=shts_bin, y=perc, group=year, color=year)) +
  #   geom_line()
  # plot2
  # -----
  #   
  #   
  #   
  #   
  #   
  #   
  #   
  #   ha_data3<-ha_data %>% filter(habitat=="CF")
  # ha_rep_size3<-ha_data2 %>% 
  #   filter(shts>1) %>% 
  #   # mutate(shts_bin = cut(shts, breaks=c(0,1,2, 3, 4, 5,6,7,25))) %>% 
  #   group_by(year) %>% 
  #   summarize(n=n_distinct((plant_id)))
  # 
  # ha_rep_count3<-ha_data2 %>% 
  #   filter(shts>1) %>% 
  #   # mutate(shts_bin = cut(shts, breaks=c(0,1,2, 3, 4, 5,6,7,25))) %>% 
  #   group_by(year) %>% 
  #   filter(is.na(infl)==FALSE) %>% 
  #   summarize(n_rep=n_distinct((plant_id)))
  # 
  # 
  # 
  # reps3<-full_join(ha_rep_count3,ha_rep_size3) %>% 
  #   mutate(perc=n_rep/n*100) %>% 
  #   arrange(desc(perc)) %>% 
  #   mutate(n_rep = replace_na(n_rep, 0))
  # 
  # 
  # reps3
  # hist(reps3$n)
  # hist(reps3$n_rep)
  # sum(reps3$n)
  # sum(reps3$n_rep)
  # mean(reps3$perc,na.rm = TRUE)
  # 
  # 
  # 
  # 
  # 
  # plot3 <- reps3 %>%
  #   ggplot( aes(x=year, y=perc, color=year)) +
  #   geom_line()
  # plot3
  # 
  # plot3<- reps3 %>%
  #   ggplot( aes(x=year, y=n_rep, color=year)) +
  #   geom_line()
  # plot3
  # ----
  #   