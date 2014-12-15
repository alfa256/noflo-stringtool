test = require 'noflo-test'

test.component 'Tool'
    .describe 'Uppercase'
    .send.data 'in', 'hello world!'
    .it 'uppercases the thing'
    .receive.data 'out', 'HELLO WORLD!'
    .export module
