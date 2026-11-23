Nginx service failure

Initial state: Inactive (dead)

Final state: Active (running)

HTTP verification: 200 OK


What broke?

The Nginx service was stopped, making it unavailable to handle web requests.

How was it diagnosed?

systemctl status nginx showed inactive (dead). The journal logs confirmed that the service had been stopped.

Root cause

The service was stopped intentionally during our exercise. The evidence does not establish who stopped it or whether an actual operational incident caused the stop.

How was it fixed?

Ran sudo systemctl start nginx.

How was the fix verified?

The service returned to active (running), and curl -I http://localhost returned 200 OK.

