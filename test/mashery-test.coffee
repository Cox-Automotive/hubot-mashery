chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'mashery', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/mashery')(@robot)

  it 'registers a response listener for mashery services', ->
    expect(@robot.respond).to.have.been.calledWith(/mashery services/i)

  it 'registers a response listener for mashery endpoints', ->
    expect(@robot.respond).to.have.been.calledWith(/mashery endpoints (.*)/i)