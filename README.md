# Setup Cassandra action

![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/fabasoad/setup-cassandra-action?include_prereleases) ![YAML Lint](https://github.com/fabasoad/setup-cassandra-action/workflows/YAML%20Lint/badge.svg) ![Dockerfile Lint](https://github.com/fabasoad/setup-cassandra-action/workflows/Dockerfile%20Lint/badge.svg) ![Shell Lint](https://github.com/fabasoad/setup-cassandra-action/workflows/Shell%20Lint/badge.svg)

This GitHub action helps you to setup Cassandra schema.

## Inputs

| Name            | Required | Description                                                                  | Default       | Possible values |
|-----------------|----------|------------------------------------------------------------------------------|---------------|-----------------|
| host            | Yes      | Cassandra host.                                                              |               | &lt;String&gt;  |
| port            | No       | Cassandra port.                                                              | `9042`        | &lt;Number&gt;  |
| username        | No       | Cassandra username.                                                          | &lt;Empty&gt; | &lt;String&gt;  |
| password        | No       | Cassandra password.                                                          | &lt;Empty&gt; | &lt;String&gt;  |
| connect-timeout | No       | Connection timeout to Cassandra in seconds.                                  | `10`          | &lt;Number&gt;  |
| keyspace        | Yes      | Cassandra keyspace. Will be created automatically in case it does not exist. |               | &lt;String&gt;  |
| scripts_path    | Yes      | Path to the scripts folder.                                                  |               | &lt;Path&gt;    |

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
          connect-timeout: 30
          keyspace: test
          scripts_path: './scripts'
```

### Result

![Result](https://raw.githubusercontent.com/fabasoad/setup-cassandra-action/main/screenshot.png)
