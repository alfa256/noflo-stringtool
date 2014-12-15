noflo = require 'noflo'
unless noflo.isBrowser()
  chai = require 'chai' unless chai
  Tool = require '../components/Tool.coffee'
else
  Tool = require 'noflo-stringtool/components/Tool.js'

describe 'Tool component', ->
  c = null
  ins = null
  out = null
  uppercase = null
  lowercase = null
  capitalize = null
  quote = null
  reverse = null
  trim = null
  parens = null
  brackets = null
  sbrackets = null
  pad = null
  joined = null

  beforeEach ->
    c = Tool.getComponent()
    ins = noflo.internalSocket.createSocket()
    uppercase = noflo.internalSocket.createSocket()
    lowercase = noflo.internalSocket.createSocket()
    capitalize = noflo.internalSocket.createSocket()
    quote = noflo.internalSocket.createSocket()
    reverse = noflo.internalSocket.createSocket()
    trim = noflo.internalSocket.createSocket()
    parens = noflo.internalSocket.createSocket()
    brackets = noflo.internalSocket.createSocket()
    sbrackets = noflo.internalSocket.createSocket()
    pad = noflo.internalSocket.createSocket()
    joined = noflo.internalSocket.createSocket()
    c.inPorts.in.attach ins
    c.outPorts.uppercase.attach uppercase
    c.outPorts.lowercase.attach lowercase
    c.outPorts.capitalize.attach capitalize
    c.outPorts.quote.attach quote
    c.outPorts.reverse.attach reverse
    c.outPorts.trim.attach trim
    c.outPorts.parens.attach parens
    c.outPorts.brackets.attach brackets
    c.outPorts.sbrackets.attach sbrackets
    c.outPorts.pad.attach pad
    c.outPorts.joined.attach joined


  describe 'when instantiated', ->
    it 'should join a stream of strings', (done) ->
      joined.once 'data', (res) ->
        chai.expect(res).to.equal 'hello world'
        done()
      ins.connect()
      ins.send 'hel'
      ins.send 'lo'
      ins.send ' wo'
      ins.send 'rld'
      ins.disconnect()

    it 'should uppercase string', (done) ->
      uppercase.once 'data', (res) ->
        chai.expect(res).to.equal 'HELLO WORLD'
        done()
      ins.send 'hello world'
   
    it 'should lowercase string', (done) ->
      lowercase.once 'data', (res) ->
        chai.expect(res).to.equal 'hello world'
        done()
      ins.send 'HELLO WORLD'
    
    it 'should capitalize word', (done) ->
      capitalize.once 'data', (res) ->
        chai.expect(res).to.equal 'Arnold'
        done()
      ins.send 'arnold'

    it 'should quote string', (done) ->
      quote.once 'data', (res) ->
        chai.expect(res).to.equal '\"Experience is what you get when you didn\'t get what you wanted.\"'
        done()
      ins.send 'Experience is what you get when you didn\'t get what you wanted.'

    it 'should reverse string', (done) ->
      reverse.once 'data', (res) ->
        chai.expect(res).to.equal 'esrever'
        done()
      ins.send 'reverse'

    it 'should trim spaces from a string', (done) ->
      trim.once 'data', (res) ->
        chai.expect(res).to.equal 'Some important phrase.'
        done()
      ins.send '  Some important phrase.  '

    it 'should pad a string', (done) ->
      pad.once 'data', (res) ->
        chai.expect(res).to.equal ' Some important phrase. '
        done()
      ins.send 'Some important phrase.'

    it 'should surround string with ( )', (done) ->
      parens.once 'data', (res) ->
        chai.expect(res).to.equal '(Some important phrase.)'
        done()
      ins.send 'Some important phrase.'

    it 'should surround string with { }', (done) ->
      brackets.once 'data', (res) ->
        chai.expect(res).to.equal '{Some important phrase.}'
        done()
      ins.send 'Some important phrase.'
    
    it 'should surround string with [ ]', (done) ->
      sbrackets.once 'data', (res) ->
        chai.expect(res).to.equal '[Some important phrase.]'
        done()
      ins.send 'Some important phrase.'
