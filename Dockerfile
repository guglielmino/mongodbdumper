FROM mongo:4.2

RUN apt-get update && \
    apt-get install -y cron && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ADD backup.sh /backup.sh
ADD start.sh /start.sh
RUN chmod +x /start.sh && chmod +x /backup.sh

VOLUME /backup

ENTRYPOINT ["/start.sh"]
CMD [""] 