$ngenPath = Join-Path ([Runtime.InteropServices.RuntimeEnvironment]::GetRuntimeDirectory()) "ngen.exe"
$assemblies = [AppDomain]::CurrentDomain.GetAssemblies() |
              Where-Object { $_.GlobalAssemblyCache -and $_.Location }
foreach ($assembly in $assemblies) {
    Start-Process -FilePath $ngenPath -ArgumentList "install `"$($assembly.Location)`"" -Wait -NoNewWindow
}
