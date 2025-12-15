<#
.SYNOPSIS
Scans a specified port range on a target IP address for TCP connections.

.DESCRIPTION
This script uses the System.Net.Sockets.TcpClient class to attempt connections
to a range of ports (StartPort to EndPort) on a target IP and lists the open ones.
To view this script's help: Get-Help .\PortScanner.ps1

.PARAMETER TargetIP
The target IP address to scan (e.g., 192.168.1.1).
This parameter is mandatory.

.PARAMETER StartPort
The starting port number for the scan (e.g., 1).
This parameter is mandatory.

.PARAMETER EndPort
The ending port number for the scan (e.g., 1024).
This parameter is mandatory.

.EXAMPLE
# Example 1: Basic Scan
.\PortScanner.ps1 -TargetIP 10.0.21.44 -StartPort 80 -EndPort 100

.EXAMPLE
# Example 2: Getting Detailed Help
Get-Help .\PortScanner.ps1 -Full

.NOTES
The connection timeout is set to 100 milliseconds using the BeginConnect method.
Increasing this value (e.g., to 300) may yield more accurate results on slow networks,
but will slow down the overall scan.
#>
param(
    [Parameter(Mandatory=$true, HelpMessage="The target IP address (e.g., 192.168.1.1)")]
    [string]$TargetIP,

    [Parameter(Mandatory=$true, HelpMessage="The starting port number for the scan (e.g., 1)")]
    [int]$StartPort,

    [Parameter(Mandatory=$true, HelpMessage="The ending port number for the scan (e.g., 1024)")]
    [int]$EndPort
)

# Custom check for -h or -? to display full help using the built-in Get-Help cmdlet
if ($args -contains "-h" -or $args -contains "-?") {
    Get-Help $MyInvocation.MyCommand.Path -Full
    exit
}

## Header
Write-Host "--- TCP Port Scan Initiated ---" -ForegroundColor Green
Write-Host "Target IP: $TargetIP"
Write-Host "Port Range: $StartPort - $EndPort"
Write-Host "-------------------------------"

$OpenPorts = @()
$TimeoutMs = 100 # Timeout duration in milliseconds

# Loop through the port range
$StartPort..$EndPort | ForEach-Object {
    $port = $_
    
    # Error handling to suppress connection errors
    try {
        # Create a new TcpClient object
        $tcpClient = New-Object System.Net.Sockets.TcpClient
        
        # Start asynchronous connection attempt
        $connectionResult = $tcpClient.BeginConnect($TargetIP, $port, $null, $null)
        
        # Wait for the result with a timeout
        $wait = $connectionResult.AsyncWaitHandle.WaitOne($TimeoutMs, $false)
        
        # Check if the wait timed out AND if the connection was successful
        if ($wait -and $tcpClient.Connected) {
            $OpenPorts += $port
            Write-Host "$port is open" -ForegroundColor Cyan
        }
    }
    catch {
        # Error handling (e.g., host unreachable)
    }
    finally {
        # Close the connection and release resources
        if ($tcpClient -ne $null) {
            $tcpClient.Close()
        }
    }
}

Write-Host "-------------------------------"
Write-Host "Scan Completed." -ForegroundColor Green
Write-Host "Found Open Ports: $($OpenPorts -join ', ')" -ForegroundColor Yellow
