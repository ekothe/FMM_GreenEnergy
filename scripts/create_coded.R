## read in raw data
library(readr)
library(dplyr)

raw_anon <- read_csv("raw_anon.csv")

## Code categorical variables 
coded <- raw_anon %>% 
  mutate(gender = as.factor(case_when(
    gender == 1 ~ "Male",
    gender == 2 ~ "Female",
    gender == 3 ~ "Other/Not specified")), 
    
    consent = as.factor(case_when(
      consent == 1 ~ "Consented",
      consent != 1 ~ "Not consented")),
    
    education = as.factor(case_when(
      education == 1 ~ "Less than high school", 
      education == 2 ~ "High school graduate",
      education == 3 ~ "Some college", 
      education == 4 ~ "2 year degree", 
      education == 5 ~ "4 year degree", 
      education == 6 ~ "Professional degree",
      education == 7 ~ "Doctorate")),

    state = as.factor(case_when(
      state == 11 ~ "AL Alabama",
      state == 12 ~ "AK Alaska",
      state == 13 ~ "AZ Arizona",
      state == 14 ~ "AR Arkansas",
      state == 15 ~ "CA California",
      state == 16 ~ "CO Colorado",
      state == 17 ~ "CT Connecticut",
      state == 18 ~ "DE Delaware",
      state == 19 ~ "DC District of Columbia",
      state == 20 ~ "FL Florida",
      state == 21 ~ "GA Georgia",
      state == 22 ~ "HI Hawaii",
      state == 23 ~ "ID Idaho",
      state == 24 ~ "IL Illinois",
      state == 25 ~ "IN Indiana",
      state == 26 ~ "IA Iowa",
      state == 27 ~ "KS Kansas",
      state == 28 ~ "KY Kentucky",
      state == 29 ~ "LA Louisiana",
      state == 30 ~ "ME Maine",
      state == 31 ~ "MD Maryland",
      state == 32 ~ "MA Massachusetts",
      state == 33 ~ "MI Michigan",
      state == 34 ~ "MN Minnesota",
      state == 35 ~ "MS Mississippi",
      state == 36 ~ "MO Missouri",
      state == 37 ~ "MT Montana",
      state == 38 ~ "NE Nebraska",
      state == 39 ~ "NV Nevada",
      state == 40 ~ "NH New Hampshire",
      state == 41 ~ "NJ New Jersey",
      state == 42 ~ "NM New Mexico",
      state == 43 ~ "NY New York",
      state == 44 ~ "NC North Carolina",
      state == 45 ~ "ND North Dakota",
      state == 46 ~ "OH Ohio",
      state == 47 ~ "OK Oklahoma",
      state == 48 ~ "OR Oregon",
      state == 49 ~ "PA Pennsylvania",
      state == 50 ~ "RI Rhode Island",
      state == 51 ~ "SC South Carolina",
      state == 52 ~ "SD South Dakota",
      state == 53 ~ "TN Tennessee",
      state == 54 ~ "TX Texas",
      state == 55 ~ "UT Utah",
      state == 56 ~ "VT Vermont",
      state == 57 ~ "VA Virginia",
      state == 58 ~ "WA Washington",
      state == 59 ~ "WV West Virginia",
      state == 60 ~ "WI Wisconsin",
      state == 61 ~ "WY Wyoming")))
  

## Replace NA with 0 for prototype familiarity items
## This is required so that sums are correctly calculated for this variable
coded <- coded %>%
  mutate(proto_caring = if_else(is.na(proto_caring), 0, as.numeric(proto_caring)),
         proto_informed = if_else(is.na(proto_informed), 0, as.numeric(proto_informed)),
         proto_dedicated = if_else(is.na(proto_dedicated), 0, as.numeric(proto_dedicated)),
         proto_pushy = if_else(is.na(proto_pushy), 0, as.numeric(proto_pushy)),
         proto_stubborn = if_else(is.na(proto_stubborn), 0, as.numeric(proto_stubborn)),
         proto_arrogant = if_else(is.na(proto_arrogant), 0, as.numeric(proto_arrogant)),
         proto_patriotic = if_else(is.na(proto_patriotic), 0, as.numeric(proto_patriotic)),
         proto_responsible = if_else(is.na(proto_responsible), 0, as.numeric(proto_responsible)))

## Create recoding functions

invert_likert <- function(x, maxval = 5) {
  (maxval+1) - x # reverse scores items collected on a 1 to 5 likert scale
}

invert_binary <- function(x) {
  x * -1 # reverse scores items (where items should be 1 or -1)
}

## Code key variables
coded <- coded %>% 
  mutate(
         beh_1_rc = as.factor(case_when(
           beh_1 == 10 ~ "Green Energy User",
           beh_1 == 11 ~ "Non Green Energy User",
           beh_1 == 12 ~ "Non Green Energy User")),
         beh_2_rc = as.factor(case_when(
           beh_2 == 10 ~ "Green Energy User",
           beh_2 == 11 ~ "Non Green Energy User",
           beh_2 == 12 ~ "Non Green Energy User")),
         beh_3_rc = as.factor(case_when(
           beh_3 == 5 ~ "Green Energy User",
           beh_3 == 7 ~ "Green Energy User",
           beh_3 == 9 ~ "Non Green Energy User",
           beh_3 == 10 ~ "Green Energy User")),
         sus = (invert_likert(sus_1) + sus_2 + invert_likert(sus_3))/3,
         sev = (invert_likert(sev_1) + invert_likert(sev_2) + invert_likert(sev_3))/3,
         mrr = (invert_likert(mrr_1) + invert_likert(mrr_2) + invert_likert(mrr_3))/3,
         re = (invert_likert(re_1) + invert_likert(re_2) + invert_likert(re_3))/3,
         se = (invert_likert(se_1) + se_2 + invert_likert(se_3))/3,
         rc = (invert_likert(rc_1) + invert_likert(rc_2) + invert_likert(rc_3))/3,
         proto_similarity = proto_similarity,
         proto_fav = (proto_arrogant*-1) + (proto_pushy*-1) + (proto_stubborn*-1) + proto_caring + proto_informed + proto_dedicated,
         att = (invert_likert(att_1) + att_2 + invert_likert(att_3) + invert_likert(att_4) + att_5 + invert_likert(att_6))/6,
         inj = (invert_likert(sn_1) + invert_likert(sn_2) + invert_likert(sn_3))/3,
         des = (invert_likert(sn_4) + invert_likert(sn_5))/2,
         int = (invert_likert(int_1) + invert_likert(int_2) + invert_likert(int_3))/3,
         willingness = (willingness_1 + invert_likert(willingness_2))/2,
         beh = as.factor(case_when(
           beh_3_rc == "Green Energy User" | beh_2_rc == "Green Energy User" | beh_1_rc == "Green Energy User" ~ "Green Energy User",
           TRUE ~ "Non Green Energy User"))
  )

write_csv(coded, "coded.csv")
