function Optimize-Assemblies {
    param (
        [string]$assemblyFilter = "Microsoft.PowerShell.",
        [string]$activity = "Native Image Installation"
    )

    try {
       
        $ngenPath = Join-Path ([Runtime.InteropServices.RuntimeEnvironment]::GetRuntimeDirectory()) "ngen.exe"
        if (-Not (Test-Path $ngenPath)) {
            Write-Host "Error: ngen.exe not found at $ngenPath. Ensure .NET Framework is installed."
            return
        }
        $assemblies = [AppDomain]::CurrentDomain.GetAssemblies() |
                      Where-Object { $_.FullName -ilike "$assemblyFilter*" }
					  
        if ($assemblies.Count -eq 0) {
            Write-Host "No assemblies found matching filter: $assemblyFilter."
            return
        }
		
        foreach ($assembly in $assemblies) {
            $assemblyName = [System.IO.Path]::GetFileName($assembly.Location)
            Write-Progress -Activity $activity -Status "Optimizing $assemblyName"
            Start-Process -FilePath $ngenPath -ArgumentList "install `"$($assembly.Location)`"" -Wait -NoNewWindow
        }
        Write-Host "All specified assemblies have been optimized."
    } catch {
        Write-Host "An error occurred: $_"
    }
}

Optimize-Assemblies -assemblyFilter "Microsoft.PowerShell."
