# Linux Troubleshooting Scripts
![Linux Distribution](https://img.shields.io/badge/Linux-Ubuntu-%23E95420?logo=ubuntu)
![GNU Bash Version](https://img.shields.io/badge/Bash-4%2B-%234EAA25?logo=gnubash&logoColor=white)
[![License](https://img.shields.io/badge/license-MIT-orange)](LICENSE)
![Made By](https://img.shields.io/badge/Made%20By-Reginald%20Griffin%20II-%23E85C33)

A collection of Bash scripts to perform the following actions:
- Display system information.
- Analyze log files to display needed information.
- Logs when the disk space reaches the warning threshold.
- Backup existing txt files in the given source directory to the given destination directory.
- Start or restart a user-level systemd service.
- Automate a basic network health check.
- Performs a comprehensive system health check

## 🛠️ Prerequisites

- **Linux environment** (Ubuntu 20.04+, Debian 11+, or any distribution with Bash 4+)
- **Bash** (version 4+)

## 📁 Project Structure
```bash
linux-troubleshooting-scripts/
├── log/
│   ├── disk_alert.log
│   └── summary_report.log
├── scripts/
│   ├── backup.sh
│   ├── disk_alert.sh
│   ├── log_analyzer.sh
│   ├── network_check.sh
│   ├── reporter.sh
│   ├── restart_service.sh
│   ├── system_health_report.sh
│   └── system_info.sh
├── systemd/
│   ├── disk-alert.service
│   └── reporter.service
├── CHANGELOG.md
├── LICENSE
└── README.md
```

## 📦 Installation

1. Clone the repository:

```bash
git clone https://github.com/ReggieRay210/linux-troubleshooting-scripts.git
cd linux-troubleshooting-scripts
```
2. Make scripts executable:
```bash
chmod +x *.sh
```
3. Move scripts to `~/bin/` and add to PATH for global access (**Optional**):
```bash
mkdir -p ~/bin
cp *.sh ~/bin/
export PATH="$PATH:$HOME/bin/"
```

## 📖 Usage 
### System Info
```bash 
./system_info.sh
```
_Sample Output:_
```bash 
=== System Information ===
Date: Fri Jun 12 18:35:33 CDT 2026
Uptime: 15 hours, 27 minutes
User: ubuntu
Memory: 384Mi/891Mi
Disk: 3.0G/3.8G (80% used)
```
### File Backup
```bash
./backup.sh test_source test_dest
```
_Sample Output:_
```bash
'test_source/file1.txt' -> 'test_dest/file1.txt'
'test_source/file2.txt' -> 'test_dest/file2.txt'
Backup Complete
These files were backed up:

file1.txt
file2.txt
```
### Disk Space Alert
```bash  
./disk_alert.sh
```
_Sample Output:_
```bash 
 Fri Jun 12 18:49:40 CDT 2026 INFO: Disk OK at 80%.
```

### Log Analyzer
```bash 
./log_analyzer.sh server.log
```
_Sample Output:_
```bash 
=== Analyzing log: server.log ===
File Contains: 7 lines.
Reported: 3 error messages.
Reported: 2 warning messages.

=== Last five(5) lines ===
2025-05-12 10:12:45 ERROR Failed to connect to database
2025-05-12 10:15:10 INFO User login successful
2025-05-12 10:20:33 ERROR Timeout on API call
2025-05-12 10:25:59 WARN Retrying connection
2025-05-12 10:30:17 ERROR Disk space low
```

### Restart Systemd Service
```bash
./restart_service.sh <service-name>
```
_Sample Output:_ Listed in service_restarts.log
```bash
Wed Jun 17 17:30:08 CDT 2026: reporter.service is not running. Starting service...
Wed Jun 17 17:30:08 CDT 2026: reporter.service Started.
Wed Jun 17 17:30:34 CDT 2026: Restarting reporter.service...
```
### Network Health Check
```bash
./network_check.sh <URL>
```
_Sample Output:_
```bash
====== Network Health Check ======
Date: Thu Jun 18 13:32:24 CDT 2026
Public IP collected: ###.###.##.###
Ping test to pandora.com...
Ping successful
DNS resolution for pandora.com...
DNS resolution successful
Port 443 reachability for pandora.com...
Port 443 is reachable.

====== Network Check Complete ======
```

### System Summary Report
```bash
./system_health_report.sh <URL - optional>
```
_Sample Output in terminal:_
```bash
====== SYSTEM HEALTH CHECK ======
Fri Jun 19 17:09:50 CDT 2026

--- System Info ---
Uptime: 13 hours, 40 minutes
User: ubuntu
Memory: 202Mi/891Mi
Disk: 3.0G/3.8G (82% used)

--- Disk Usage ---
Copy of results will be saved: /home/ubuntu/linux-troubleshooting-scripts/log/disk_alert.log

WARNING: Disk Usage on / is 82%.

--- Network Health Check ---
Public IP collected: 104.189.79.139
Ping test to 8.8.8.8...
✅ Ping successful

DNS resolution for 8.8.8.8...
✅ DNS resolution successful

Port 443 reachability for 8.8.8.8...
✅ Port 443 is reachable.

--- Network Check Complete ---
✅ All network checks passed.

--- Service Status ---
✅ reporter.service: active (running)

====== REPORT SUMMARY ======
❌ One or more checks FAILED
Failed Checks:
        - Disk Usage over 80%
Copy of results will be saved: /home/ubuntu/linux-troubleshooting-scripts/log/summary_report.log
```
_Sample Output in log_
```bash
====== REPORT SUMMARY ======
Fri Jun 19 17:09:53 CDT 2026
Status: ❌ FAIL
Failed Checks:
        - Disk Usage over 80%
====== END OF REPORT ======
```
## 📜 License
MIT License — feel free to use, modify, and distribute.
See the `LICENSE` file for more information.

## 👤 Author
Reginald Griffin II — [@ReggieRay210](https://github.com/ReggieRay210)
