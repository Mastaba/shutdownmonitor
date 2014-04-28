#! /bin/sh
### BEGIN INIT INFO
# Provides:         bootmail
# Required-Start:   $exim4
# Required-Stop:    $exim4
# Default-Start:    2 3 4 5
# Default-Stop:     0 1 6
# Short-Description: Send an email at boot and at shutdown
# Description:
### END INIT INFO
 
shutdownmsg="$(hostname) is shutting down at $(date)"
bootmsg="$(hostname) is booting at $(date)"
emailto=root
 
stop()
{
echo $shutdownmsg | mail -s "$shutdownmsg" $emailto
}
 
start()
{
echo $bootmsg | mail -s "$bootmsg" $emailto
}
 
status()
{
#always considered running
echo "bootmail enabled. Emails are sent to $emailto"
exit 0
}
 
case "$1" in
start)
echo "sending bootmail"
start
;;
stop)
echo "sending shutdown mail"
stop
;;
restart|reload)
echo "can only start or stop, exiting"
exit 0
;;
status)
status
;;
*)
echo "Usage: $0 {start|stop|status}"
exit 1
esac
 
exit 0
