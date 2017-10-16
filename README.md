# emailextractor
a tcl code that extracts an email address from a PIV/CAC card, for F5 APM variableassign

To use the script in the APM policy's Variable Assign action, replace the first two lines with the following:

set lines [split [mcget {session.ssl.cert.x509extension}] "\n"];

Also consider replacing the function "puts" with "return" when using in an APM policy.

The code posted here is a pure tcl script, and to test the script in the tclsh, a text file session.ssl.cert.x509extension has to be placed in the same directory where you run tclsh.

Set "Custom Variable" to session.logon.last.username.
The script should be placed as "Custom Expression" box ov Variable Assign action.
