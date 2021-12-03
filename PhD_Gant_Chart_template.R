
devtools::install_github('joejcollins/DiagrammeR')
library(DiagrammeR)

gant1 <- mermaid("
gantt
title PhD Gantt Chart - J Collins
dateFormat  YYYY-MM-DD 

section Year 1
Taught Modules                                :done,            year1_1,    2020-10-01, 2021-01-01
Annual Leave                                  :done,            year1_2,    2020-12-20, 2021-01-01
Mini Project 1                                :done,            year1_3,    2021-01-01, 2021-04-01
Mini Project 2                                :done,            year1_4,    2021-04-01, 2021-07-01
PIP's                                         :active,          year1_5,    2022-01-01, 2022-07-01

section Year 2
PhD Project Experimental Design               :active, done,    year2_1,    2021-07-01, 2022-01-01
SR1                                           :crit, done,      year2_2,    2021-07-01, 2021-08-15
Experiment 1                                  :done,            year2_3,    2021-07-01, 2021-10-01
Literature Review                             :active,          year2_4,    2021-07-01, 2024-10-01
Field experiment maintenance                  :active,          year2_5,    2021-12-01, 2023-11-01
Annual Leave                                  :done,            year2_6,    2021-12-20, 2022-01-01
Soil Baseline Sampling & analysis             :crit, active,    year2_7,    2022-01-01, 2022-03-01
Experiment 2                                  :active,          year2_8,    2021-11-15, 2022-02-01
Spring Soil & Crop Sampling & analysis        :active,          year2_9,    2022-04-01, 2022-05-01 
Summer Soil & Crop Sampling  & analysis       :active,          year2_10,   2022-07-01, 2022-08-01
Economic analysis                             :active,          year2_11,   2022-08-01, 2022-10-01 
First Year Report                             :active,crit,     year2_12,   2022-07-01, 2022-10-01 


section Year 3
Autumn Soil Sampling  + & analysis            :active,          year3_1,    2022-10-01, 2022-11-01 
Annual Leave                                  :done,            year3_2,    2022-12-20, 2023-01-01
Soil Lab analysis                             :active,          year3_3,    2023-01-01, 2023-03-01
Experiment 3                                  :active,          year3_4,    2022-11-15, 2023-02-01
Spring Soil & Crop Sampling & analysis        :active,          year3_5,    2023-04-01, 2023-05-01 
Summer Soil & Crop Sampling  & analysis       :active,          year3_6,    2023-07-01, 2023-08-01 
Second Year Report                            :active,crit,     year3_7,    2023-07-01, 2023-10-01 


section Year 4
Autumn Soil & Crop Sampling  & analysis       :active,          year4_1,    2023-10-01, 2023-11-01
Full Economic Analysis                        :active,          year4_2,    2023-11-01, 2024-04-01
Annual Leave                                  :done,            year4_3,    2023-12-20, 2024-01-01
Write-up Thesis                               :active,crit,     year4_4,    2024-01-01, 2024-10-01

")
gant1





