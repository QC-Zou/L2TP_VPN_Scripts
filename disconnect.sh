
#!/bin/bash
echo "stop the connection..."
echo "d myvpn" > /var/run/xl2tpd/l2tp-control
echo "done!"
