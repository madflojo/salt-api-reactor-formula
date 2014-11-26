salt-api - Reactor
===================

The `salt-api` directory contains template reactor config files for SaltStack's salt-api. These templates are designed to be used with [Runbook.io](https://runbook.io), however they can be used for general purpose salt-api configurations.

In order to utilize these files you must first [setup salt-api](http://bencane.com/2014/07/17/integrating-saltstack-with-other-services-via-salt-api/).

## Warning: Too much of a good thing

Be very cautious of the salt-api reactors that you are implementing, in this set of reactor configurations we include 3 reactors that could be considered dangerous `reactor/init.sls`, `reactor/cmd/run.sls`, & `reactor/cmd/script.sls`. If a malicious user was able to bypass your salt-api security measurements these reactions would allow that user to execute abritrary and potentially harmful commands across your infrastructure. The use of these reactor configurations are at your own risk, and you are responsible for securing these configurations.

## salt-api.conf

The `salt-api.conf` file is designed to be placed into the `/etc/salt/master.d` directory. This file contains basic configurations for the `salt-api` service. This file should be edited for your environment as paths and IP's may be different.

Once you put this file into `/etc/salt/master.d` directory you must restart the `salt-master` and `salt-api` services.

## Reactor.conf

The `reactor.conf` file is designed to be placed into the `/etc/salt/master.d` directory. This file contains all of the CloudRoutes based reactor configurations and sample url even tags to listen for. You may need to modify this file for your environment.

Once this file is in place you will need to restart the `salt-master` service for these reactions to take effect.

## reactor/

This directory and sub directory contains reactor `SLS` files to utilize with [Runbook.io](https://runbook.io). While these files are designed for a specific usage they can also be used as a template for general salt-api configurations and usage.

All of the reactor `SLS` files contain an API key used to authenticate requests. These keys should be changed in any implementation, below is the string to look for.

    {% if postdata.secretkey == "PICKSOMETHINGBETTERPLZKTHX" %}
