Salt-API and Reactor Formula
===================

## Purpose

The purpose of this formula is to allow you to call Saltstack via simple HTTP webhooks. You can use this formula for complicated setups like integrating your own application into Saltstack or for simple day to day tasks like having a provisioning script send a webhook to accept a new minion key. 

### A bit of background

This repo was/is the basis behind the Saltstack integration of [Runbook.io](https://runbook.io). Runbook is a SaaS service that monitors infrastructure and applications and if they are down or in an unhealthy state, it will perform automated actions to correct them. By implementing the contents of this repository a user can use Runbook to initiate salt executions when monitors fail. For example: running `service.restart nginx` when port 443 is no longer responding.

While everything included is designed to work with Runbook, all of the configurations and reactor end points are generic enough that they can be used by anyone.

## Some setup required

Before utilizing this formula you will first need to [setup salt-api](http://bencane.com/2014/07/17/integrating-saltstack-with-other-services-via-salt-api/) after salt-api is installed and configured you can simply copy a few files in place.

    # cp reactor.conf /etc/salt/master.d
    # cp -R reactor /srv/salt/
    # service salt-master restart
    # service salt-api restart

### Replacing the default secretkey

This system uses a specific key for authenticating requests, the key is defined in eash reactor `SLS` file and must be updated there.

**Replace this with something better:**

    {% if postdata.secretkey == "PICKSOMETHINGBETTERPLZKTHX" %}

## Usage

After setup you can use web requests to perform Saltstack actions.

**Restarting nginx:**

    # curl -H "Accept: application/json" -d tgt='*' -d service="nginx" \
    -d secretkey="replacethiswithsomethingbetter" \
    -k https://10.0.0.2:8080/hook/services/restart
    {"success": true}


## Warning: Too much of a good thing

Be very cautious of the salt-api reactors that you are implementing, in this set of reactor configurations we include 3 reactors that could be considered dangerous `reactor/init.sls`, `reactor/cmd/run.sls`, & `reactor/cmd/script.sls`. If a malicious user was able to bypass your salt-api security measurements these reactions would allow that user to execute abritrary and potentially harmful commands across your infrastructure. The use of these reactor configurations are at your own risk, and you are responsible for securing these configurations.
