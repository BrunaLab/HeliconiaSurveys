
# H acuminata flowering & n plants (by sht number) in CF ------------------
# NOTE: all CF plots combined

# load the libraries ------------------------------------------------------


library(tidyverse)
library(gridExtra)


# load the survey data archived in Dryad  ---------------------------------



ha_plants<-read_csv("./data/survey_archive/HDP_survey.csv")
# check for zombie plants  ------------------------------------------------


hacf<-ha_plants %>%
  filter(str_detect(plot_id,"CF")==TRUE) %>%
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
# cf_rep

cf_rep_summary<-cf_rep %>%
  group_by(shts_bin) %>%
  summarize(perc_bin=mean(perc_bin),sd=sd(perc_bin)) %>%
  mutate(year="mean\n(1998-2012)")

cf_rep<- cf_rep %>%
  mutate(year=as.character(year))

plot_data<- full_join(cf_rep,cf_rep_summary,
                      by=c("perc_bin","shts_bin","year")) %>%
  mutate(year=as.factor(year)) %>%
  mutate(shts_bin=as.factor(shts_bin)) %>%
  mutate(highlight=ifelse(year=="mean\n(1998-2012)","mean\n(1998-2012)","other")) %>%
  mutate(year=as.character(year))
# library(hrbrthemes)
perc_plot<-plot_data %>%
  ggplot(aes(x=shts_bin,
             y=perc_bin,
             group=year, size=highlight,color=highlight)) +
  scale_y_continuous(breaks=c(0,10,20,30,40,50,60))+
  labs(x="shoots",y="% Flowering")+
  geom_line() +
  expand_limits(x= c(-0, 9))+
  geom_text(data=plot_data %>% filter(shts_bin=="8") %>% filter(year=="mean\n(1998-2012)"),
            aes(label = year,
                x = shts_bin,
                y = perc_bin,
                color = highlight),
            size=2,
            hjust = 0.6,
            nudge_x=0.5,
            # position = position_dodge(0.0)
  )+
  scale_x_discrete(labels = c(seq(1,7),expression("">=8)))+
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
# perc_plot


ggsave("./docs/data_summaries/figs/perc_plot.pdf", width = 5, height = 4, units = "in", bg = "white")
ggsave("./docs/data_summaries/figs/perc_plot.png", width = 5, height = 4, units = "in", bg = "white")
ggsave("./docs/data_summaries/figs/perc_plot.tiff", width = 5, height = 4, units = "in", bg = "white")


# n plot ------------------------------------------------------------------
cf_n_summary<-cf_rep %>%
  group_by(shts_bin) %>%
  summarize(n_bin=mean(n_bin)) %>%
  mutate(year="mean\n(1998-2012)")

cf_rep<- cf_rep %>%
  mutate(year=as.character(year))

plot_n_data<- full_join(cf_rep,cf_n_summary,
                        by=c("n_bin","shts_bin","year")) %>%
  mutate(year=as.factor(year)) %>%
  mutate(shts_bin=as.factor(shts_bin)) %>%
  mutate(highlight=ifelse(year=="mean\n(1998-2012)","mean\n(1998-2012)","other")) %>%
  mutate(year=as.character(year))

n_plot<-plot_n_data %>%
  ggplot(aes(x=shts_bin,
             y=n_bin,
             group=year, size=highlight,color=highlight)) +
  # scale_y_continuous(breaks=c(0,10,20,30,40,50,60))+
  labs(x="shoots",y="Total no. of plants")+
  geom_line() +
  expand_limits(x= c(-0, 9))+
  geom_text(data=plot_n_data %>% filter(shts_bin=="8") %>% filter(year=="mean\n(1998-2012)"),
            aes(label = year,
                x = shts_bin,
                y = n_bin,
                color = highlight),
            size=2,
            hjust = 0.6,
            nudge_x=0.5,
            # position = position_dodge(0.0)
  )+
  scale_x_discrete(labels = c(seq(1,7),expression("">=8)))+
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
# n_plot
# Save the figures in multiple formats
ggsave("./docs/data_summaries/figs/n_plot.pdf", width = 5, height = 4, units = "in", bg = "white")
ggsave("./docs/data_summaries/figs/n_plot.png", width = 5, height = 4, units = "in", bg = "white")
ggsave("./docs/data_summaries/figs/n_plot.tiff", width = 5, height = 4, units = "in", bg = "white")


fig_n_flrperc<-grid.arrange(n_plot, perc_plot, ncol = 1)
ggsave("./docs/data_summaries/figs/fig_n_flrperc.jpg", width = 6, height = 8, units = "in", bg = "white")

ggdraw() +
  draw_image("./docs/data_summaries/figs/n_plot.png", x = 0.00, y = 0.21, scale = .8) +
  draw_image("./docs/data_summaries/figs/perc_plot.png", x = 0.0, y = -0.21, scale = .8)
ggsave("./docs/data_summaries/figs/fig_n_flrperc.jpg", width = 4, height = 6, units = "in", bg = "white")