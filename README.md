# Setup Cassandra Action (Deprecated)

> :warning: **This GitHub action is deprecated and no longer maintained.**

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/fabasoad/setup-cassandra-action?include_prereleases)
![linting](https://github.com/fabasoad/setup-cassandra-action/actions/workflows/linting.yml/badge.svg)

This GitHub Action helps you to set up Cassandra schema.

## Inputs

<!-- prettier-ignore-start -->
| Name            | Required | Description                                                                  | Default       | Possible values |
|-----------------|----------|------------------------------------------------------------------------------|---------------|-----------------|
| host            | Yes      | Cassandra host.                                                              |               | &lt;String&gt;  |
| port            | No       | Cassandra port.                                                              | `9042`        | &lt;Number&gt;  |
| username        | No       | Cassandra username.                                                          | &lt;Empty&gt; | &lt;String&gt;  |
| password        | No       | Cassandra password.                                                          | &lt;Empty&gt; | &lt;String&gt;  |
| connect-timeout | No       | Connection timeout to Cassandra in seconds.                                  | `10`          | &lt;Number&gt;  |
| keyspace        | Yes      | Cassandra keyspace. Will be created automatically in case it does not exist. |               | &lt;String&gt;  |
| scripts_path    | Yes      | Path to the scripts folder.                                                  |               | &lt;Path&gt;    |
<!-- prettier-ignore-end -->

## Example usage

```yaml
name: Setup Cassandra

on: push

jobs:
  setup:
    name: Setup
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: fabasoad/setup-cassandra-action@v1
        with:
          host: "192.13.131.0"
          port: 9042
          username: ${{ secrets.CASSANDRA_USERNAME }}
          password: ${{ secrets.CASSANDRA_PASSWORD }}
          connect-timeout: 30
          keyspace: test
          scripts_path: "./scripts"
```
