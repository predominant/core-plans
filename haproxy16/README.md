# haproxy

HAProxy is a free, very fast and reliable solution offering high availability, load balancing, and proxying for TCP and HTTP-based applications. It is particularly suited for very high traffic web sites and powers quite a number of the world's most visited ones.

## Maintainers

The Habitat Maintainers humans@habitat.sh

## Type of Package

This is a service package that will be run by the Habitat supervisor.

## Usage

You can start the service with:

```
$ hab start core/haproxy16
```

And bind another Habitat service to it - see "Binding" below for more details.

## Bindings

Consuming services can bind to HAProxy via:

```
hab svc load <origin>/<app> --bind port:haproxy16.default
```

## Topologies

*(This is only required for service packages, not [binary wrapper packages](https://www.habitat.sh/docs/best-practices/#binary-wrapper-packages))*

What topologies does this plan support?

### Standalone

Check out [the Habitat docs on standalone](https://www.habitat.sh/docs/using-habitat/#standalone) for more details on what the standalone topology is and what it does.

TODO: document how to use haproxy with the standalone topology.

Checkout [the core/postgresql](https://github.com/habitat-sh/core-plans/tree/master/postgresql) README for a good example of this.

### Leader-Follower

If this plan can be used with the leader/follower topology, how do you do it?

Check out [the Habitat docs on Leader-Follower](https://www.habitat.sh/docs/using-habitat/#leader-follower-topology) for more details on what the leader-follower topology is and what it does.

TODO: document how to use haproxy with the leader-follower topology.

Checkout [the core/postgresql](https://github.com/habitat-sh/core-plans/tree/master/postgresql) README for a good example of this (look under the Clustering heading)

## Update Strategies

TODO: Document what update strategies would work best for this plan.

Checkout [the update strategy documentation](https://www.habitat.sh/docs/using-habitat/#update-strategy) for information on the strategies Habitat supports.

### Configuration Updates

Checkout the [configuration update](https://www.habitat.sh/docs/using-habitat/#configuration-updates) documentation for more information on what configuration updates are and how they are executed.

Link to the plan's default.toml file to list all the configurable values of the plan.

If your plan has configuration values that require a complete rebuild when updated, note those here.

## Scaling

How would a user scale this service?

Can this service be run in a cluster and/or as high availability?

## Monitoring

How would a user monitor the health of this surface at the application layer?

This is separate from information about Habitat's HTTP API monitoring service.  This section should include some suggestions about how someone could monitor the application or service outside of Habitat - i.e. using something like sumologic, logstash, etc.  It does not need to be prescriptive, but should include some suggestions of where someone might start.

## Notes

(Optional)

Anything that does not fit in the above sections should go here - i.e. how does this fit into a user's development workflow?
