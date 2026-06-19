## [1.0.0] - 2026-06-12

### Added
- Introduce `system_info.sh` script to display essential system information.
- Add `log_analyzer.sh` script for parsing and analyzing system logs.
- Include `backup.sh` script for performing system backups.
- Implement `disk_alert.sh` script for monitoring disk space and providing alerts, featuring color-coded output for notifications.

### Changed
- Update internal log descriptions for improved clarity and readability.
- Revise `README.md` to include comprehensive project information and detailed usage instructions.

---

**Migration Notes:**
This is the initial stable release of the project. No migration is required.

**Contributors:**
N/A

## [1.0.1] - 2026-06-17

### Added
- Added MIT License to the project.

### Changed
- Refactored `log_analyzer.sh` to improve error handling logic.
- Enhanced backup complete message output for better clarity.
- Updated `README.md` with information on future improvements and author details.

### Fixed
- Corrected an invalid log file path in `disk_alert.sh`.

## [1.0.2] - 2026-06-17

### Added
- Systemd unit file (`reporter.service`) for the reporter service.
- `reporter.sh` script to log service start times.
- Script for managing user-level systemd services.
- Documentation in the README for restarting services.

### Changed
- Updated `ExecStart` path in `reporter.service`.
- Enhanced `disk-alert.service` with descriptive comments.
- Updated the log file path in `disk_alert.sh`.
- Refined project structure for improved organization.

## [1.0.3] - 2026-06-19

### Added
- Automated network health checks via `network_check.sh`.
- Documentation for network health checks in the `README`.
- A new `system health report script` for comprehensive system summaries.
- Enhanced `README` with details on the system summary report.

### Changed
- Updated the `ExecStart` path for the reporter service.
- Improved error handling in `restart_service.sh`.
- Revised log file paths and enhanced output messages for better clarity.
- Refactored `disk_alert.sh` for improved clarity and logging.
- Enhanced `network_check.sh` with better output formatting.
- Revised header comments in `system_info.sh` for consistency.

### Fixed
- Corrected the path to `disk_alert.sh` script within the service file.