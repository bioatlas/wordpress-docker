# wordpress-docker

This is a composition of services that provides a front-end web portal centered around the Wordpress publishing platform.

Using this composition, you can switch between a set of themes for Wordpress and also use it as a test-bed for developing or modifying themes.

## Usage

First install certs in the `/certs` folder, for example wildcart certs for bioatlas.se, commercial or self-signed that you generate yourself.

Then download the Atlas theme, use `make theme-dl`, then issue `make up` to do it in two steps or use the `make` default target to execute these two targets in one step.


## Wordpress

These are steps for getting started from scratch:

- Navigate to https://wordpress.bioatlas.se, set up initial credentials
- Upgrade Wordpress
- Install the Events plugin
- Activate the Atlas theme

Then add content in Wordpress, access the admin functionality with:

		firefox https://wordpress.bioatlas.se


