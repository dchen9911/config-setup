import pexpect 
from pathlib import Path
import dotenv
import os
import sys 

envfile = Path.home() / ".env"
dotenv.load_dotenv(envfile)
password = os.getenv("NEARMAP_PASSWORD")

status = pexpect.run('openvpn3 sessions-list')
if 'No sessions available' in str(status):

    child = pexpect.spawn('openvpn3 session-start --config /home/dennis/.config/client.ovpn', encoding='utf-8')
    child.logfile_read = sys.stdout
    child.expect('Auth User name:')
    child.sendline('dennis.chen')
    child.expect('Auth Password:')
    child.sendline(password)

    status = pexpect.run('openvpn3 sessions-list', encoding='utf-8')
    print(status)
else:
    print("VPN already running")
