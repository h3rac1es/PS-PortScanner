# 🚀 PowerShell Port Scanner

A simple yet fast TCP Port Scanner script written in PowerShell, using the `System.Net.Sockets.TcpClient` class for efficient connection testing.

## Features

* **Fast Scanning:** Utilizes asynchronous connection attempts with a short timeout.
* **Parameter-Driven:** Easily specify `TargetIP`, `StartPort`, and `EndPort`.
* **Help Support:** Includes built-in help documentation via `Get-Help` and the `-h` flag.
* **Integrity Check:** `MD5SUMS` file is provided to verify the script's integrity.

## 💾 Installation

1.  Clone this repository or download the `PortScanner.ps1` file.
2.  (Optional but recommended) Verify the file integrity using the `MD5SUMS` file.

## 🧐 Integrity Verification

To ensure the script hasn't been tampered with, you can compare the hash of your downloaded file against the hash provided in `MD5SUMS`.

**In PowerShell, run:**

```powershell
# Compare the hash of your downloaded file
$DownloadedHash = (Get-FileHash -Path .\PortScanner.ps1 -Algorithm MD5).Hash

# Compare this with the hash in the MD5SUMS file
# Note: This is a manual check. A proper verification process should be used.
Write-Host "Downloaded Hash: $DownloadedHash"
