FROM alpine:latest

#add curl for better handling
RUN apk add --no-cache curl

#every 15mins
#COPY script-15min-0 /etc/periodic/15min/15min

#every hour
#COPY script-hourly-0 /etc/periodic/hourly/hourly

#every day
COPY daily-0 /etc/periodic/daily/daily-0 
RUN chmod +x /etc/periodic/daily/daily-0 

#every week
#COPY script-weekly-0 /etc/periodic/weekly/script-weekly-0
#COPY script-weekly-1 /etc/periodic/weekly/script-weekly-1

#every month
#COPY script-monthly-0 /etc/periodic/monthly

#add fridays to standard busybox
RUN MKDIR /etc/periodic/friday
COPY friday-0 /etc/periodic/friday/friday-0
RUN chmod +x /etc/periodic/friday/friday-0

#RUN chmod +x /etc/periodic/15min/15min
#RUN chmod +x /etc/periodic/hourly/hourly
#RUN chmod +x /etc/periodic/daily/daily
#RUN chmod +x /etc/periodic/weekly/script-weekly-0
#RUN chmod +x /etc/periodic/weekly/script-weekly-1

RUN echo "0       8       *       *       5       run-parts /etc/periodic/friday" >> /var/spool/cron/crontabs/root

CMD crond -l 2 -f
