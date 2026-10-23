Nginx configuration failure

Initial test:Failed

Final test :Syntax OK and  Test Successful


What broke?

An isolated Nginx test configuration contained an invalid directive: invalid_directive on;. This caused the configuration test to fail.

How was it diagnosed?

I ran:
nginx -t -c "$HOME/devOps/day26/config/nginx.conf"


Nginx reported unknown directive, which pointed directly to the invalid line.

Root cause

The configuration included a directive that Nginx does not recognize. After removing that line, the syntax became valid.

Additional observation

After fixing the syntax, the test still failed with:
open() "/run/nginx.pid" failed (13: Permission denied)

This was not another syntax error. It happened because I ran nginx -t as a normal user, and Nginx attempted to access its default PID-file location in /run/. Running the same test with sudo gave Nginx the required permissions.

How was it fixed?
1. Removed the invalid directive from the test configuration.
2. Ran the configuration test again with sudo.
sudo nginx -t -c "$HOME/devOps/day26/config/nginx.conf"


How was the fix verified?

The final output showed:
- syntax is ok
- test is successful
