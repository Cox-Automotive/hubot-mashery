
# Hubot Mashery [![npm version](https://badge.fury.io/js/hubot-mashery.svg)](http://badge.fury.io/js/hubot-mashery) [![Build Status](https://travis-ci.org/Cox-Automotive/hubot-mashery.png)](https://travis-ci.org/Cox-Automotive/hubot-mashery)

This script is designed to be used with a [Hubot](http://hubot.github.com) to interact with the Mashery API.

## Adding to Your Hubot

See full instructions [here](https://github.com/github/hubot/blob/master/docs/scripting.md#npm-packages).

1. `npm install hubot-mashery --save` (updates your `package.json` file)
2. Open the `external-scripts.json` file in the root directory (you may need to create this file) and add an entry to the array (e.g. `[ 'hubot-mashery' ]`).

## Commands

- `hubot mashery services` - Show list of services
- `hubot mashery endpoints <serviceId>` - Show list of endpoints for a given service

## Suggested Setup

* The form fields presented there are, in order, the following Hubot environment variables:
 * `MASHERY_UN`
 * `MASHERY_PW`
 * `MASHERY_API_KEY`
 * `MASHERY_SECRET`
 * `MASHERY_AREA_UUID`
* Register the five values as environment variables when starting your bot (as usual with Hubot scripts) using `export` or `heroku config:set` or whatever applies to your Hubot hosting environment.
