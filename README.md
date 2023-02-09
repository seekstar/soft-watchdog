# soft-watchdog

Watched host: The host that should reboot on exception. The soft watchdog should be deployed on the watched host and checks and removes `~/.soft-watchdog-food` periodically. If the watchdog finds that `~/.soft-watchdog-food` is missing several times continuously, it will reboot the OS.

Feeder host: The host that create `~/.soft-watchdog-food` periodically on the watched host watched by the watchdog. There can be one or more feeder hosts for a watched host. The watched host will reboot if all feeders can not feed the watchdog.

By default, the feeder feeds every 60 seconds, and the watchdog eats the food every 60 seconds.

## Usage

### Watchdog

Deploy watchdog on the watched host:

```shell
# interval: In seconds. Default: 60
# max_miss_cnt: The watchdog reboots the host if it finds that ~/soft-watchdog-food is missing for continuously <max_miss_cnt> times. Default: 3.
./deploy-soft-watchdog.sh [interval] [max_miss_cnt]
```

### Feeder

There are several types of feeders.

#### SSH

SSH feeders create `~/soft-watchdog-food` on the watched host via `ssh`. The watched host will reboot if the feeder can not connect to it via `ssh`.

Deploy on a feeder host:

```shell
cd feeders/ssh/
# interval: In seconds. Default: 60
./deploy-feeder.sh ssh-name-of-watched-host [interval]
```

The feeder can also be run manually:

```shell
./feeder ssh-name-of-watched-host interval(seconds)
```

#### ping

Ping feeders create `~/soft-watchdog-food` on the watched host if it pings the specified host successfully. Ping feeders should usually be deployed on the watched host, so that the watched host will reboot if it can not ping the specified host.

Deploy on a feeder host:

```shell
cd feeders/ping/
# interval: In seconds. Default: 60
./deploy-feeder.sh host-to-ping(e.g., baidu.com) [interval]
```

The feeder can also be run manually:

```shell
./feeder host-to-ping(e.g., baidu.com) interval(seconds)
```

## LICENSE

This software is licensed under GPL version 3 or any later version.
