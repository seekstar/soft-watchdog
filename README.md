# soft-watchdog

One or more Feeders create `~/.soft-watchdog-food` periodically using `ssh` on the host watched by the watchdog. The watchdog checks and removes `~/.soft-watchdog-food` periodically. If the watchdog finds that `~/.soft-watchdog-food` is missing several times continuously, it will reboot the OS.

## Usage

On the host that is going to be watched:

```shell
./deploy-soft-watchdog.sh
```

On another host that is going to be a feeder:

```shell
./deploy-feeder.sh ssh-name-of-watched-host
```

The feeder can also be run manually:

```shell
./feeder ssh-name-of-watched-host interval
```
