# emailextractor
a tcl code that extracts an email address from a PIV/CAC card, for F5 APM variableassign

To use the script in the APM policy's Variable Assign action, replace the first two lines with the following:

set lines [split [mcget {session.ssl.cert.x509extension}] "\n"];

The code posted here is a pure tcl script, and to test the script in the tclsh, a text file session.ssl.cert.x509extension has to be placed in the same directory where you run tclsh.
