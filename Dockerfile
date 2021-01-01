FROM python:2.7.17-slim-buster

ENV CQLSH_VERSION 3.4.4
ENV CQLSH_NO_BUNDLED true
RUN pip install --no-cache-dir cqlsh==5.0.4 cassandra-driver==3.22.0

RUN echo 'export CQLSH_NO_BUNDLED=true' >> ~/.bashrc

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
