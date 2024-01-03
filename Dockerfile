FROM python:3.11-alpine3.19

ENV CQLSH_VERSION 6.1.2
ENV CQLSH_NO_BUNDLED true
RUN pip install --no-cache-dir cqlsh==${CQLSH_VERSION} cassandra-driver==3.29.0 \
    && echo "export CQLSH_NO_BUNDLED=${CQLSH_NO_BUNDLED}" >> ~/.bashrc

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
