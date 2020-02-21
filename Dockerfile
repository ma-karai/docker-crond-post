FROM alpine:3.5

#every 15mins
#COPY script-15min-0 /etc/periodic/15min/15min

#every hour
#COPY script-hourly-0 /etc/periodic/hourly/hourly

#every day
COPY script-daily-0 /etc/periodic/daily/daily

#every week
#COPY script-weekly-0 /etc/periodic/weekly/script-weekly-0
#COPY script-weekly-1 /etc/periodic/weekly/script-weekly-1

#every month
#COPY script-monthly-0 /etc/periodic/monthly

#RUN chmod +x /etc/periodic/15min/15min
#RUN chmod +x /etc/periodic/hourly/hourly
RUN chmod +x /etc/periodic/daily/daily
#RUN chmod +x /etc/periodic/weekly/script-weekly-0
#RUN chmod +x /etc/periodic/weekly/script-weekly-1

CMD crond -l 2 -f
