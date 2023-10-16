library(tidyverse)
library(EpiEstim)
library(patchwork)
## load data
case.asym.wider.sh<-read.csv('https://raw.githubusercontent.com/shalom-lab/covid.sh/main/local/share/case.asym.wider.sh.csv')

cases <- case.asym.wider.sh %>%
  select(date,pos) %>%
  mutate(date=as.Date(date)) %>%
  rename(I=pos,date=date)

## wallinga-teunis method to estimate rt
res <- wallinga_teunis(
  cases,
  method = "parametric_si",
  config = make_config(
    t_start = seq(1,102),
    t_end = seq(7,108),
#   t_end = seq(7,129),
    mean_si = 4, std_si = 2))

plot(res)

