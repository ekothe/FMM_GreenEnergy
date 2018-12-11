library(Qualtrics)
library(dplyr)
library(readr)

## Read in the raw (potentially) identifiable data
raw <- read_qualtrics("raw_data.csv")

## remove all responses from duplicate worker_ids
raw <- raw[!(duplicated(raw$worker_id) | duplicated(raw$worker_id, fromLast = TRUE)), ]

raw <- raw %>% 
  filter(finished == "1")



## Identify and drop columns to de-identify
## Note, this will throw a warning if a column you're attempting to drop does not exist but will still run. 
## The code includes columns that may not be in the dataset but if present should be dropped

drop_cols <- c("worker_id", 
               "assignment_id",
               "hit_id",
               "ip_address", 
               "recipient_last_name", 
               "recipient_first_name",
               "recipient_email",
               "location_latitude", 
               "location_longitude",
               "external_reference", 
               "distribution_channel")

raw_anon <- raw %>% select(-one_of(drop_cols))


## Identify and drop columns that show display order if they're not needed
## Note, this will throw a warning if a column you're attempting to drop does not exist but will still run. 
## The code includes columns that may not be in the dataset but if present should be dropped

drop_do <- c("q28_do_1",
             "q28_do_2",
             "q28_do_3",
             "q28_do_4",
             "q28_do_5",
             "q28_do_6",
             "q28_do_11",
             "q28_do_12",
             "q33_do_1",
             "q33_do_2",
             "q33_do_3",
             "q33_do_4",
             "q33_do_5",
             "q33_do_6",
             "fl_21_do_susceptibility",
             "fl_21_do_re",
             "fl_21_do_severity",
             "fl_21_do_se",
             "fl_21_do_mrr",
             "fl_21_do_rc",
             "fl_21_do_prototypes",
             "fl_21_do_willingness",
             "fl_21_do_attitude",
             "fl_21_do_subjective_norm_injunctive",
             "fl_21_do_subjective_norm_descriptive",
             "fl_21_do_intend",
             "fl_21_do_past_behaviour",
             "susceptibility_do_q14",
             "susceptibility_do_q13",
             "susceptibility_do_q12",
             "re_do_q20",
             "re_do_q18",
             "re_do_q19",
             "severity_do_q11",
             "severity_do_q10",
             "severity_do_q9",
             "se_do_q23",
             "se_do_q22",
             "se_do_q21",
             "mrr_do_q16",
             "mrr_do_q15",
             "mrr_do_q17",
             "rc_do_q26",
             "rc_do_q25",
             "rc_do_q24",
             "prototypes_do_q27",
             "prototypes_do_q29",
             "prototypes_do_q28",
             "willingness_do_q32",
             "willingness_do_q31",
             "willingness_do_q30",
             "subjective_norm_injunctive_do_q36",
             "subjective_norm_injunctive_do_q35",
             "subjective_norm_injunctive_do_q34",
             "subjective_norm_descriptive_do_q54",
             "subjective_norm_descriptive_do_q53",
             "intend_do_q37",
             "intend_do_q39",
             "intend_do_q38", 
             "sc0")
         
raw_anon <- raw_anon %>% select(-one_of(drop_do))

##  Read in variable names from metadata and rename according to old name match
metadata <- read_csv("metadata.csv")
names(raw_anon)[match(metadata$import_name,names(raw_anon))] <- metadata$var_name

write_csv(raw_anon, "raw_anon.csv")
