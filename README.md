### PowerShell Assembly Optimizer

---

Optimize-Assemblies is designed to optimize .NET assemblies, particularly those related to PowerShell, using the Native Image Generator (NGEN). This process improves the startup time and performance of .NET applications by generating and caching native images of the assemblies.

### Features

---

- **Automatic Detection of NGEN:** Locates and utilizes ngen.exe from the .NET Framework for optimization.
- **Assembly Filtering:** Targets specific assemblies for optimization, defaulting to those related to Microsoft.PowerShell.
- **Progress Display:** Provides real-time feedback on the optimization process.
- **Error Handling:** Catches and reports any issues during the optimization process.


### Prerequisites

---

- .NET Framework (required for ngen.exe)
- PowerShell

### Usage

---

**Clone the Repository:**
`git clone https://github.com/luke-beep/ps-optimize-assemblies.git`

**Navigate to the Script Directory:**
`cd PowerShell-Assembly-Optimizer`

**Run the Script:**
`.\Optimize-Assemblies.ps1`
