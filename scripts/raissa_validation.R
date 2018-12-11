col_check <- 
  create_agent() %>%
  focus_on(
    tbl_name = "green_pwm") %>%
  col_exists(column = age) %>%
  col_is_numeric(column = age) %>%
    col_vals_between(
    column = age,
    left = 18,
    right = 100,
    notify_count = 1) %>%
  col_exists(column = household_size) %>%
  col_is_numeric(column = household_size) %>%
  col_vals_between(
    column = household_size,
    left = 18,
    right = 100,
    notify_count = 1) %>%
  col_exists(column = proto_caring) %>%
  col_is_numeric(column = proto_caring) %>%
  col_vals_between(
    column = proto_caring,
    left = 0,
    right = 1,
    notify_count = 1) %>%
  col_exists(column = proto_informed) %>%
  col_is_numeric(column = proto_informed) %>%
  col_vals_between(
    column = proto_informed,
    left = 0,
    right = 1,
    notify_count = 1) %>%
  col_exists(column = proto_dedicated) %>%
  col_is_numeric(column = proto_dedicated) %>%
  col_vals_between(
    column = proto_dedicated,
    left = 0,
    right = 1,
    notify_count = 1) %>%
  col_exists(column = proto_pushy) %>%
  col_is_numeric(column = proto_pushy) %>%
  col_vals_between(
    column = proto_pushy,
    left = 0,
    right = 1,
    notify_count = 1) %>%
  col_exists(column = proto_stubborn) %>%
  col_is_numeric(column = proto_stubborn) %>%
  col_vals_between(
    column = proto_stubborn,
    left = 0,
    right = 1,
    notify_count = 1) %>%
  col_exists(column = proto_arrogant) %>%
  col_is_numeric(column = proto_arrogant) %>%
  col_vals_between(
    column = proto_arrogant,
    left = 0,
    right = 1,
    notify_count = 1) %>%
  col_exists(column = proto_patriotic) %>%
  col_is_numeric(column = proto_patriotic) %>%
  col_vals_between(
    column = proto_patriotic,
    left = 0,
    right = 1,
    notify_count = 1) %>%
  col_exists(column = proto_responsible) %>%
  col_is_numeric(column = proto_responsible) %>%
  col_vals_between(
    column = proto_responsible,
    left = 0,
    right = 1,
    notify_count = 1) %>%
  col_exists(column = willingness_1) %>%
  col_is_numeric(column = willingness_1) %>%
  col_vals_between(
    column = willingness_1,
    left = 1,
    right = 5,
    notify_count = 1) %>%
  col_exists(column = willingness_2) %>%
  col_is_numeric(column = willingness_2) %>%
  col_vals_between(
    column = willingness_2,
    left = 1,
    right = 5,
    notify_count = 1) %>%
  col_exists(column = willingness_2) %>%
  col_is_numeric(column = willingness_2) %>%
  col_vals_between(
    column = willingness_2,
    left = 1,
    right = 5,
    notify_count = 1) %>%
  col_exists(column = att_1) %>%
  col_is_numeric(column = att_1) %>%
  col_vals_between(
    column = att_1,
    left = 1,
    right = 5,
    notify_count = 1) %>%
  col_exists(column = att_2) %>%
  col_is_numeric(column = att_2) %>%
  col_vals_between(
    column = att_2,
    left = 1,
    right = 5,
    notify_count = 1) %>%
  col_exists(column = att_3) %>%
      col_is_numeric(column = att_3) %>%
      col_vals_between(
      column = att_3,
      left = 1,
      right = 5,
      notify_count = 1) %>%
  col_exists(column = att_4) %>%
      col_is_numeric(column = att_4) %>%
      col_vals_between(
      column = att_4,
      left = 1,
      right = 5,
      notify_count = 1) %>%
  col_exists(column = att_5) %>%
      col_is_numeric(column = att_5) %>%
      col_vals_between(
      column = att_5,
      left = 1,
      right = 5,
      notify_count = 1) %>%
  col_exists(column = att_6) %>%
      col_is_numeric(column = att_6) %>%
      col_vals_between(
      column = att_6,
      left = 1,
      right = 5,
      notify_count = 1) %>%
  col_exists(column = sn_1) %>%
      col_is_numeric(column = sn_1) %>%
      col_vals_between(
      column = sn_1,
      left = 1,
      right = 5,
      notify_count = 1) %>%
  col_exists(column = sn_2) %>%
      col_is_numeric(column = sn_2) %>%
      col_vals_between(
      column = sn_2,
      left = 1,
      right = 5,
      notify_count = 1) %>%
  col_exists(column = sn_3) %>%
      col_is_numeric(column = sn_3) %>%
      col_vals_between(
      column = sn_3,
      left = 1,
      right = 5,
      notify_count = 1) %>%
  col_exists(column = sn_4) %>%
      col_is_numeric(column = sn_4) %>%
      col_vals_between(
      column = sn_4,
      left = 1,
      right = 5,
      notify_count = 1) %>%
  col_exists(column = sn_5) %>%
      col_is_numeric(column = sn_5) %>%
      col_vals_between(
      column = sn_5,
      left = 1,
      right = 5,
      notify_count = 1) %>%
  col_exists(column = int_1) %>%
      col_is_numeric(column = int_1) %>%
      col_vals_between(
      column = int_1,
      left = 1,
      right = 5,
      notify_count = 1) %>%
  col_exists(column = int_2) %>%
      col_is_numeric(column = int_2) %>%
      col_vals_between(
      column = int_2,
      left = 1,
      right = 5,
      notify_count = 1) %>%
  col_exists(column = int_3) %>%
      col_is_numeric(column = int_3) %>%
      col_vals_between(
      column = int_3,
      left = 1,
      right = 5,
      notify_count = 1) %>%
  col_exists(column = beh_1) %>%
      col_is_numeric(column = beh_1) %>%
      col_vals_between(
      column = beh_1,
      left = 10,
      right = 12,
      notify_count = 1) %>%
  col_exists(column = beh_2) %>%
  col_is_numeric(column = beh_2) %>%
  col_vals_between(
    column = beh_2,
    left = 10,
    right = 12,
    notify_count = 1) %>%
  col_exists(column = beh_3) %>%
  col_is_numeric(column = beh_3) %>%
  col_vals_between(
    column = beh_3,
    left = 10,
    right = 12,
    notify_count = 1) %>%
  interrogate()
get_html_summary(col_check)
