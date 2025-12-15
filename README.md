# 🚀 PowerShell TCP Port Scanner

A simple yet fast TCP Port Scanner script written in PowerShell, using the `System.Net.Sockets.TcpClient` class for efficient connection testing.

## Features

* **Fast Scanning:** Utilizes asynchronous connection attempts with a short timeout.
* **Parameter-Driven:** Easily specify `TargetIP`, `StartPort`, and `EndPort`.
* **Help Support:** Includes built-in help documentation via `Get-Help` and the `-h` flag.

## 💾 Installation

1.  Clone this repository or download the `PortScanner.ps1` file.
2.  Ensure you have PowerShell (version 4.0 or higher) installed on your system.

## 🛠️ Usage

### 🔑 Execution Policy Note

Due to PowerShell's security restrictions, you might need to adjust the Execution Policy to run the script. This command allows the script to run only for the current session:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
