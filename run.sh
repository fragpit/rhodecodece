#!/bin/sh
PYTHONPATH=$(for dir in $(ls /opt/rhodecode/store/); do echo -n /opt/rhodecode/store/$dir/lib/python2.7/site-packages:; done) /opt/rhodecode/store/k6v3cfsgj868b5bazyg67filfw4gqi48-python-2.7.11/bin/python2.7 /opt/rhodecode/store/p7jgba5nckm2zkwymfh2k31fl638xhr2-python2.7-supervisor-3.3.1/bin/.supervisord-wrapped -c /root/.rccontrol/supervisor/supervisord.ini
