FROM python:2.7.17-slim-buster

ENV CQLSH_VERSION 5.0.4
RUN pip install cqlsh==5.0.4

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]