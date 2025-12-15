# PortScanner.ps1

A simple and fast **TCP port scanning** tool written in PowerShell. It scans a specified port range on a target IP address and reports which TCP ports are open.

---

## Features

* TCP-based port scanning using `System.Net.Sockets.TcpClient`
* Customizable port range
* Fast scanning with configurable timeout
* Built-in PowerShell help support (`Get-Help`)

---

## Requirements

* Windows PowerShell 5.1 or newer
* Network access to the target host
* Appropriate authorization to scan the target system

---

## Installation

1. Clone or download this repository:

```bash
git clone https://github.com/h3rac1es/PS-PortScanner.git
```

2. Navigate to the script directory:

```powershell
cd PortScanner
```

3. (Optional) Allow script execution if restricted:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

---

## Usage

```powershell
.\PortScanner.ps1 -TargetIP <IP_ADDRESS> -StartPort <START_PORT> -EndPort <END_PORT>
```

### Parameters

| Parameter | Description                            | Required |
| --------- | -------------------------------------- | -------- |
| TargetIP  | Target IP address (e.g. `192.168.1.1`) | Yes      |
| StartPort | Starting port number (e.g. `1`)        | Yes      |
| EndPort   | Ending port number (e.g. `1024`)       | Yes      |

---

## Examples

### Example 1: Basic Scan

```powershell
.\PortScanner.ps1 -TargetIP 10.0.21.44 -StartPort 80 -EndPort 100
```

### Example 2: View Detailed Help

```powershell
Get-Help .\PortScanner.ps1 -Full
```

You can also use:

```powershell
.\PortScanner.ps1 -h
```

---

## Output

* Open ports are displayed in **cyan** during the scan
* A summary of all open ports is displayed at the end

Example output:

```text
--- TCP Port Scan Initiated ---
Target IP: 10.0.21.44
Port Range: 80 - 100
-------------------------------
80 is open
443 is open
-------------------------------
Scan Completed.
Found Open Ports: 80, 443
```

---

## Configuration

The connection timeout is defined in the script:

```powershell
$TimeoutMs = 100
```

* Increasing this value (e.g. `300`) may improve accuracy on slow networks
* Higher values will slow down the overall scan

---

## Notes

* This script performs a basic TCP connect scan
* Firewalls and IDS/IPS systems may block or log scan attempts
* Use responsibly and only on systems you own or have permission to test

---

## Disclaimer

This tool is intended for **educational and authorized security testing purposes only**. Unauthorized port scanning may be illegal in your jurisdiction.

---

## License

MIT License
