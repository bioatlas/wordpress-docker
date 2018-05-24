# wordpress-docker

This is a composition of services that provides a front-end web portal centered around the Wordpress publishing platform.

Using this composition, you can switch between a set of themes for Wordpress and also use it as a test-bed for developing or modifying themes.

## Usage

First install certs in the `/certs` folder, for example wildcart certs for bioatlas.se, commercial or self-signed that you generate yourself.

Then download the Atlas theme, use `make theme-dl`, then issue `make up` to do it in two steps or use the `make` default target to execute these two targets in one step.


## Wordpress intro

These are steps for getting started from scratch:

- Navigate to https://wordpress.bioatlas.se, set up initial credentials
- Upgrade Wordpress
- Install the Events plugin
- Activate the Atlas theme

Then add content in Wordpress, access the admin functionality with:

		firefox https://wordpress.bioatlas.se/wp-admin

## Backup and restore

For the wordpress instance, the state is kept in two places - the filesystem and in the database. A backup can be made from a running Wordpress instance. The backup archive files can then be migrated into a fresh instance and restored. 

There are two Makefile targets for backing up and restoring state:

		make backup
		make restore

The default latest backup files that are created at backup and used by default for restore use these names:

		wordpress-db-latest.sql.gz
		wordpress-files-latest.tgz

In addition, timestamped archives are created. 

You can adjust the Makefile if you need to use other filenames.
