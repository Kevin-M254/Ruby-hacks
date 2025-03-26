Web KungFu

For Digest authentication: gem install net-http-digest_auth

For NTLM authentication: gem install ruby-ntlm

For CGI, add the following to /etc/apache2/sites-enabled/[SITE] :
    <Directory /var/www/[CGI FOLDER]>
        AddHandler cgi-script .rb
        Options +ExecCGI
    </Directory>
Then put the cgi script in /var/www/[CGI FOLDER] and restart service: then use cgi-get script to execute command from web shell
