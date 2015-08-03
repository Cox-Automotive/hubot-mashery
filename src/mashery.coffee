# Description:
#   Mashery API Browser
#
# Dependencies:
#   "mashery-client": "0.0.4"
#
# Configuration:
#  MASHERY_UN
#  MASHERY_PW
#  MASHERY_API_KEY
#  MASHERY_SECRET
#  MASHERY_AREA_UUID
#
# Commands:
#   hubot mashery services - Show list of services
#   hubot mashery endpoints <serviceId> - Show list of endpoints for a given service
#
# Author:
#   brianantonelli <brian.antonelli@autotrader.com>

module.exports = (robot) ->
  config =
    user: process.env.MASHERY_UN,
    pass: process.env.MASHERY_PW,
    key:   process.env.MASHERY_API_KEY,
    secret: process.env.MASHERY_SECRET,
    areaUuid: process.env.MASHERY_AREA_UUID

  mashery = require('mashery-client').init(config)

  # List Services 
  robot.respond /mashery services/i, (msg) ->
    if missingEnvironmentForApi msg then return

    mashery.methods.fetchAllServices {}, (serviceData) ->
      if serviceData.errorCode?
        msg.send JSON.stringify(serviceData.errors)
        return

      services = []
      serviceData.forEach (service, idx) ->
        services.push "- #{service.name} (#{service.id})"

      msg.send services.join "\n"

  # List Endpoints
  robot.respond /mashery endpoints (.*)/i, (msg) ->
    if missingEnvironmentForApi msg then return

    mashery.methods.fetchAllServiceEndpoints { path: { id: msg.match[1] } }, (epData) ->      
      if epData.errorCode?
        msg.send JSON.stringify(epData.errors)
        return

      eps = []
      epData.forEach (ep, idx) ->
        eps.push "- #{ep.name} (#{ep.id})"

      msg.send eps.join "\n"

  # Check for required config
  missingEnvironmentForApi = (msg) ->
    missingAnything = false
    unless process.env.MASHERY_UN?
      msg.send "Ensure that MASHERY_UN is set."
      missingAnything |= true
    unless process.env.MASHERY_PW?
      msg.send "Ensure that MASHERY_PW is set."
      missingAnything |= true
    unless process.env.MASHERY_API_KEY?
      msg.send "Ensure that MASHERY_API_KEY is set."
      missingAnything |= true
    unless process.env.MASHERY_SECRET?
      msg.send "Ensure that MASHERY_SECRET is set."
      missingAnything |= true
    unless process.env.MASHERY_AREA_UUID?
      msg.send "Ensure that MASHERY_AREA_UUID is set."
      missingAnything |= true

    missingAnything