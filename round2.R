library(tidyverse)
library(dplyr)
library(ggplot2)
Data <- read_csv("round-1to2-line-lists.csv")
Data <- Data %>% mutate_if(is.character, list(~na_if(.,""))) 
str(Data)
#plot province
Dataprovince <- Data %>%
  group_by(province) %>%
  summarise(n = n())
Dataprovince
arrange(Dataprovince,desc(n))%>%
  slice(1:10)%>%
  ggplot(., aes(x = province, y= n,fill = province))+ geom_bar(stat = 'identity')

#plot gender
Datagender <- Data %>%
  group_by(gender) %>%
  summarise(n = n())
Datagender
arrange(Datagender,desc(n))%>%
  slice(1:10)%>%
  ggplot(., aes(x = gender, y= n,fill = gender))+ geom_bar(stat = 'identity')

#plot age
Dataage <- Data %>%
  group_by(age_number) %>%
  summarise(n = n())
Dataage
arrange(Dataage,desc(n))%>%
  slice(1:10)%>%
  ggplot(., aes(x = age_number, y= n,fill = age_number))+ geom_bar(stat = 'identity')

#plot job
Datajob <- Data %>%
  group_by(job) %>%
  summarise(n = n())
Datajob
arrange(Datajob,desc(n))%>%
  slice(1:10)%>%
  ggplot(., aes(x = job, y= n,fill = job))+ geom_bar(stat = 'identity')

#plot patient_type_map
Datapatient_type <- Data %>%
  group_by(patient_type_map) %>%
  summarise(n = n())
Datapatient_type
arrange(Datapatient_type,desc(n))%>%
  slice(1:10)%>%
  ggplot(., aes(x = patient_type_map, y= n,fill = patient_type_map))+ geom_bar(stat = 'identity')
