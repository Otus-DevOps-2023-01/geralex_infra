cat <<EOF> puma.service
[Unit]
Description=Puma HTTP Server
After=network.target

[Service]
# Puma supports systemd's `Type=notify` and watchdog service
# monitoring, as of Puma 5.1 or later.
# On earlier versions of Puma or JRuby, change this to `Type=simple` and remove
# the `WatchdogSec` line.
Type=simple

# The path to your application code root directory.
# Also replace the "<YOUR_APP_PATH>" placeholders below with this path.
# Example /home/username/myapp
WorkingDirectory=/home/ubuntu/reddit

# SystemD will not run puma even if it is in your path. You must specify
# an absolute URL to puma. For example /usr/local/bin/puma
# Alternatively, create a binstub with `bundle binstubs puma --path ./sbin` in the WorkingDirectory
ExecStart=/usr/local/bin/puma

Restart=always

[Install]
WantedBy=multi-user.target
EOF
