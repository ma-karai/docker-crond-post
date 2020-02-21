FROM alpine:3.5

#every 15mins
COPY script-15min-0 /etc/periodic/15min/15min

#every hour
COPY script-hourly-0 /etc/periodic/hourly/hourly

#every day
COPY script-daily-0 /etc/periodic/daily

#every week
COPY script-weekly-0 /etc/periodic/weekly/script-weekly-0
COPY script-weekly-1 /etc/periodic/weekly/script-weekly-1

#every month
COPY script-monthly-0 /etc/periodic/monthly


CMD crond -l 2 -f
