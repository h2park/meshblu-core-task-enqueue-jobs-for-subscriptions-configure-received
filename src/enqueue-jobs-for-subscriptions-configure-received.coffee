_    = require 'lodash'
http = require 'http'

class EnqueueJobsForSubscriptionsConfigureReceived
  constructor: (options={}) ->

  _doCallback: (request, code, callback) =>
    response =
      metadata:
        responseId: request.metadata.responseId
        code: code
        status: http.STATUS_CODES[code]
    callback null, response

  do: (request, callback) =>
    {uuid, messageType, options} = request.metadata
    message = JSON.parse request.rawData

    return @_doCallback request, 204, callback

module.exports = EnqueueJobsForSubscriptionsConfigureReceived
