Pragpub
=======

Bash script for downloading the current (as in the month this script is started)
PragPub ([http://pragprog.com/magazines][1]) in mobi format and mailing the file
to your kindle.

Use your favorite scheduler (e.g. cron) in order to automate sending your
monthly PragPub to your kindle .



Prerequisites
-------------

-   The [mutt][2] E-mail client

[2]: <http://www.mutt.org>

-   The [wget][3] tool

[3]: <http://www.gnu.org/software/wget/>

-   Your system must be able to send mail to, in this case, Amazon



Settings
--------

Set the KINDLE_ADDRESS to an email address which is allowed to the receive your
content.



Command line options
--------------------

The script works without any parameters.

If you want to (re-)send the current pragpub magazine use **-m** as a paramter.

[1]: <http://pragprog.com/magazines>
