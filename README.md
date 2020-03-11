# Setup Cassandra action
![Dockerfile Lint](https://github.com/fabasoad/setup-cassandra-action/workflows/Dockerfile%20Lint/badge.svg)

This GutHub action helps you to setup Cassandra schema.

## Inputs

### `host`

_[Required]_ Cassandra host.

### `port`

_[Optional]_ Cassandra port. Default `9042`.

### `username`

_[Required]_ Cassandra username.

### `password`

_[Required]_ Cassandra password.

### `keyspace`

_[Required]_ Cassandra keyspace. Will be created automatically in case it does not exist.

### `scripts_path`

_[Required]_ Path to the scripts folder.

## Example usage

### Workflow configuration

```yaml
name: Setup Cassandra

on: push

jobs:
  setup:
    name: Setup
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: fabasoad/setup-cassandra-action@v1.0.0
        with:
          host: '192.13.131.0'
          port: 9042
          username: ${{ secrets.CASSANDRA_USERNAME }}
          password: ${{ secrets.CASSANDRA_PASSWORD }}
          keyspace_name: test
          scripts_path: './scripts'
```

### Result
![Result](https://raw.githubusercontent.com/fabasoad/setup-cassandra-action/master/screenshot.png)