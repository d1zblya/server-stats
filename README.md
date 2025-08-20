# Server Performance Stats

## Task
You are required to write a script `server-stats.sh` that can analyze basic server performance stats. The script should be runnable on any Linux server and provide the following information:

- **Total CPU usage**
- **Total memory usage** (Free vs Used including percentage)
- **Total disk usage** (Free vs Used including percentage)
- **Top 5 processes by CPU usage**
- **Top 5 processes by memory usage**

---

## How to Run

1. **Clone or copy the repository** (if using GitHub):
   ```bash
   git clone <repository_url>
   cd <repository_directory>
   ```

2. Make the script executable:
    ```bash
    chmod +x server-stats.sh
    ```

3. Run the script:
    ```bash
    ./server-stats.sh
    ```

4. Expected Output:
- CPU data
- Memory data
- Disk data
- Top 5 processes by CPU
- Top 5 processes by memory

## Optional: Run without changing permissions
```bash
bash server-stats.sh
```

## Example Output
```bash
================ CPU DATA =================
CPU name : AMD EPYC Processor
CPU usage: 12%

================ MEMORY DATA =================
Mem total : 980396 kB
Mem free  : 178580 kB, 18%
Mem usage : 801816 kB, 82%

================ DISK DATA =================
Total     : 15G
Used      : 5.4G
Used%     : 37%
Available : 9.3G

================ Top 5 processes by CPU usage =================
USER           | PID    | CPU% | COMMAND
---------------|--------|------|------------------------
root           | 1644699 | 0.8  | [kworker/0:2-wg-crypt-wg0]
root           | 289922  | 0.1  | /usr/bin/containerd
root           | 1       | 0.0  | /sbin/init
root           | 2       | 0.0  | [kthreadd]
root           | 3       | 0.0  | [rcu_gp]

================ Top 5 processes by MEMORY usage =================
USER           | PID    | MEM% | COMMAND
---------------|--------|------|------------------------
root           | 289922  | 2.0  | /usr/bin/containerd
root           | 1       | 1.0  | /sbin/init
root           | 1644699 | 0.8  | [kworker/0:2-wg-crypt-wg0]
root           | 3       | 0.0  | [rcu_gp]
root           | 4       | 0.0  | [rcu_par_gp]
```