# Prometheus Monitoring Lab

This project sets up Prometheus alerts for CPU, memory, disk I/O, and network traffic using Node Exporter.

## Files

- **fire_all_stable.sh** — Generates high CPU, memory, disk, and network usage for testing alerts.
- **stop_stable.sh** — Stops all load-generating processes.
- **node_alerts.yml** — Prometheus alerting rules for system metrics.

## Usage

1. Copy `node_alerts.yml` to your Prometheus rules directory (e.g., `/etc/prometheus/rules/`).
2. Reload Prometheus configuration.
3. Run the load generator:
   ```bash
   chmod +x fire_all_stable.sh stop_stable.sh
   ./fire_all_stable.sh
   ```
4. Stop all load generators:
   ```bash
   ./stop_stable.sh
   ```

## Alerts

Alerts will trigger when:
- CPU usage > 80% for 2 minutes
- Memory usage > 85% for 2 minutes
- Disk I/O > 5 MB/s for 2 minutes
- Network traffic > 5 MB/s for 2 minutes

## Requirements
- Prometheus
- Node Exporter
- stress-ng
- iperf3
- netcat (nc)
