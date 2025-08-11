# Prometheus Monitoring Lab

This project demonstrates a monitoring setup with **Prometheus**, **Alertmanager**, **Grafana**, and **Node Exporter**.  
It includes alerting rules, integrations with Slack, and stress testing scripts to trigger alerts for demo purposes.

---

## 📂 Project Structure

```
prometheus-monitoring-lab/
│
├── configs/
│   ├── prometheus.yml       # Prometheus main config
│   ├── node_alerts.yml      # Alert rules for CPU, Memory, Disk, Network
│   ├── alertmanager.yml     # Alertmanager configuration with Slack webhook
│
├── scripts/
│   ├── fire_all_stable.sh   # Trigger all alerts (except Node Down)
│   ├── stop_stable.sh       # Stop all stress tests
│
├── images/
│   ├── Alertmanager_notification.png
│   ├── Slack_notification.png
│   ├── Grafana_graphs.png
│   ├── Prometheus_firing.png
│
└── README.md
```

---

## 🚀 How to Run

1. **Start Prometheus, Alertmanager, and Node Exporter**
   ```bash
   prometheus --config.file=configs/prometheus.yml
   alertmanager --config.file=configs/alertmanager.yml
   node_exporter
   ```

2. **Start Grafana**
   - Import dashboards for Node Exporter CPU, Memory, Disk, and Network.
   - Connect Grafana to Prometheus.

3. **Trigger All Alerts for Testing**
   ```bash
   ./scripts/fire_all_stable.sh
   ```

4. **Stop All Tests**
   ```bash
   ./scripts/stop_stable.sh
   ```

---

## 📊 Sample Dashboards & Alerts

### Grafana Dashboard
![Grafana Graphs](images/Grafana_graphs.png)

### Prometheus Firing Alerts
![Prometheus Firing](images/Prometheus_firing.png)

### Alertmanager Notifications
![Alertmanager Notification](images/Alertmanager_notification.png)

### Slack Notifications
![Slack Notification](images/Slack_notification.png)

---

## 🛠 Notes
- The scripts use `stress-ng`, `dd`, and `iperf3` to generate CPU, Memory, Disk, and Network load.
- Network traffic tests require **iperf3** to be installed on both the Prometheus server and the monitored node.
- Adjust alert thresholds in `configs/node_alerts.yml` to suit your environment.
