Description
===========

This cookbook installs and configures FlexGet:

* **default**: Installs FlexGet via PIP
* **cron**: Schedules FlexGet using cron
* **config**: Configures FlexGet using data bag attributes

flexget Data Bag
=================

All FlexGet configuration is stored as JSON in a flexget data bag and emitted as YAML into .flexget/config.yml. (You can convert them easily using say [yamltojson.com](http://yamltojson.com/))

```
% knife data bag create flexget
% knife data bag from file flexget config.json
```

Here is an example of config.json:

```json
{
    "id": "config",
    "hash": {
      "templates": {
        "global": { },
        "tv": { }
      },
      "tasks": { }
    }
}
```
