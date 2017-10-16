# emailextractor
a tcl code that extracts an email address from a PIV/CAC card, for F5 APM variableassign

To use the script in the APM policy's Variable Assign action, replace the first two lines with the following:

set lines [split [mcget {session.ssl.cert.x509extension}] "\n"];

Also consider replacing the function "puts" with "return" when using in an APM policy.

The code posted here is a pure tcl script, and to test the script in the tclsh, a text file session.ssl.cert.x509extension has to be placed in the same directory where you run tclsh.

Set "Custom Variable" to session.logon.last.username.
The script should be placed as "Custom Expression" box ov Variable Assign action.

**Other Things to Note:

0. A common practice is to implement basic check functions such as source IP addresses and AntiVirus/regkey checks before taking a user to the Disclaimer page (Decision Box).
1. The flow then should consist of: On-Demand Cert Auth --(Fallback)--> Variable Assign --(Fallback)-->AD Query--(Successful)--> Advanced Resource Assign. An additional Fallback path should be attached to the AD Query which leads to a Fail message then Deny.
2. When creating the On-Demand Cert Auth action item, it comes with two paths - Successful and fallback. Be sure to delete the *Successful* branch immediately, and be sure to add the next action item Variable Assign to the fallback branch.
3. In the AD Query action item, set the SearchFilter to: mail=%{session.logon.last.username}. Be sure to set the Successful branch rule to "Active Directory Query has Passed."
4. Advanced Resources to assign should be: Static ACLs, Network Access, and Webtop.
