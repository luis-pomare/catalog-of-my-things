require 'date'

now = Date.today
before = Date.civil(2000, 1, 1)
difference_in_days = (now - before).to_i
p difference_in_days / 365
