noflo = require 'noflo'

exports.getComponent = ->
  c = new noflo.Component

  # Define a meaningful icon for component from http://fontawesome.io/icons/
  c.icon = 'chain'

  # Provide a description on component usage
  c.description = 'Composable string manipulation component. Plug an output to get the desired transformation. Disconnects each port after sending.'

  c.joining = ''

  # Add output ports
  c.outPorts.add 'uppercase', datatype: 'string'
  c.outPorts.add 'lowercase', datatype: 'string'
  c.outPorts.add 'trim', datatype: 'string'
  c.outPorts.add 'capitalize', datatype: 'string'
  c.outPorts.add 'quote', datatype: 'string'
  c.outPorts.add 'reverse', datatype: 'string'
  c.outPorts.add 'pad', datatype: 'string'
  c.outPorts.add 'parens', datatype: 'string'
  c.outPorts.add 'brackets', datatype: 'string'
  c.outPorts.add 'sbrackets', datatype: 'string'
  c.outPorts.add 'joined', datatype: 'string'
  
  # Add input ports
  c.inPorts.add 'in',
    datatype: 'string'
    process: (event, payload) ->
      switch event
        when 'disconnect'
          result = c.joining.slice(0)
          c.joining = ''
          c.outPorts.joined.send result
          c.outPorts.joined.disconnect()
        when 'data'
          if payload?
            copy = payload.slice(0) # clone the string
          else
            copy = ''
          c.joining = c.joining + copy
          c.outPorts.uppercase.send copy.toUpperCase()
          c.outPorts.uppercase.disconnect()
          c.outPorts.lowercase.send copy.toLowerCase()
          c.outPorts.lowercase.disconnect()
          c.outPorts.trim.send copy.trim()
          c.outPorts.trim.disconnect()
          c.outPorts.capitalize.send copy.substr(0,1).toUpperCase() + payload.substr(1).toLowerCase()
          c.outPorts.capitalize.disconnect()
          c.outPorts.quote.send "\"" + copy + "\""
          c.outPorts.quote.disconnect()
          c.outPorts.reverse.send copy.split('').reverse().join('')
          c.outPorts.reverse.disconnect()
          c.outPorts.pad.send " " + copy + " "
          c.outPorts.pad.disconnect()
          c.outPorts.parens.send "(" + copy + ")"
          c.outPorts.parens.disconnect()
          c.outPorts.sbrackets.send "[" + copy + "]"
          c.outPorts.sbrackets.disconnect()
          c.outPorts.brackets.send "{" + copy + "}"
          c.outPorts.brackets.disconnect()

  # Finally return the component instance
  c
