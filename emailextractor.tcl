# Step1: Grab the line that contains Subject Alternative Names (SANs_all)

set a [open session.ssl.cert.x509extension]
set lines [split [read $a] "\n"]
set SANs_all "";
foreach LINE $lines {
    set _line [string tolower $LINE];
    set line [string trim $_line " "];
    if {[string match *email:* $line] == 1 || [string match *rfc822:* $line] == 1 } then {
        append SANs_all $line;
    } else {
        continue;
    };
};

# Step2: Choose/extract an email address from the SAN list (SANs)

set email_addr "";
set SANs [split $SANs_all ","];
set SANs [string trim $SANs " "];
foreach san $SANs {
    set N [string length $san];
    if {[string match *email:* $san] == 1 || [string match *rfc822:* $san] == 1 } then {
        append email_addr [string range $san [expr { [string first ":" $san] + 1 } ] [expr $N-1 ] ]; 
    } else {
        continue;
    };
};
puts $email_addr
