# noflo-stringtool

String manipulation component.

### Inports :

 *IN* : Expects a stream of strings.

### Outports:

 *UPPERCASE* : Uppercase of IN.

 *LOWERCASE* : Lowercase of IN.

 *PARENS* : Surrounds IN with ( ).

 *BRACKETS* : Surrounds IN with { }.

 *SBRACKETS* : Surrounds IN with [ ].

 *TRIM* : Trims surrounding spaces from IN.

 *PAD* : Surrounds IN with ' '.

 *CAPITALIZE* : Uppercases first character and lowercases the rest.

 *QUOTE* : Surrounds IN with ".

 *JOINED* : Joins all strings in a stream.

### Design goal :
The main goal of this component is to showcase a useful pattern for component implementation, which consists of a component that can provide many outputs from a single stream, allowing the graph designer to pick which outputs to use. In this particular case all outputs generate strings so the component can be chained with several instances of itself.

Contributions are welcome, and if you need help with that just ask.

By Alfredo Consebola.
