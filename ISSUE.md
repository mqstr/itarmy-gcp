```
ubuntu@itarmy:~$ sudo journalctl -u google-shutdown-scripts.service
Sep 23 22:55:53 itarmy systemd[1]: Starting Google Compute Engine Shutdown Scripts...
Sep 23 22:55:56 itarmy systemd[1]: Finished Google Compute Engine Shutdown Scripts.
Sep 23 22:58:13 itarmy systemd[1]: Stopping Google Compute Engine Shutdown Scripts...
Sep 23 22:58:13 itarmy google_metadata_script_runner[1784]: Starting shutdown scripts (version 20220622.00-0ubuntu2~22.04.0).
Sep 23 22:58:13 itarmy google_metadata_script_runner[1784]: Found shutdown-script in metadata.
Sep 23 22:58:13 itarmy google_metadata_script_runner[1784]: shutdown-script: internal error, please report: running "google-cloud-cli.gcloud" failed: cannot create transient scope: DBus error "org.freedesktop.systemd1.TransactionIsDestructive": [Transaction for snap.google-cloud-cli.gcloud.cfa94b52-8be3-488a-839f-6ffb087981c1.scope/start is destructive (poweroff.target has 'start' job queued, but 'stop' is included in transaction).]
Sep 23 22:58:13 itarmy google_metadata_script_runner[1784]: shutdown-script: internal error, please report: running "google-cloud-cli.gcloud" failed: cannot create transient scope: DBus error "org.freedesktop.systemd1.TransactionIsDestructive": [Transaction for snap.google-cloud-cli.gcloud.d83db797-97b5-477c-a084-cbe4646fb721.scope/start is destructive (systemd-poweroff.service has 'start' job queued, but 'stop' is included in transaction).]
Sep 23 22:58:13 itarmy google_metadata_script_runner[1784]: shutdown-script exit status 46
Sep 23 22:58:13 itarmy google_metadata_script_runner[1784]: Finished running shutdown scripts.
Sep 23 22:58:13 itarmy systemd[1]: google-shutdown-scripts.service: Deactivated successfully.
Sep 23 22:58:13 itarmy systemd[1]: Stopped Google Compute Engine Shutdown Scripts.
```
