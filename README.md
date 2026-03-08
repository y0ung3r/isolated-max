## isolated-max
Allows you to run MAX Messenger in an isolated Docker container!

### Motivation
For fun <3

### Features
| **Environment**   | **Feature**                        | **Implementation Status** |
|:------------------|------------------------------------|:-------------------------:|
| Browser           | Rendering in a browser             |             ✅            |
|                   | Downloading files and media        |             ✅            |
|                   | Audio streaming                    |             ❌            |
|                   | Preserving authorization sessions  |             ❌            |
| Desktop (Windows) | Rendering in a Windows host system |             ✅            |
|                   | Downloading files and media        |             ✅            |
|                   | Audio streaming                    |             ✅            |
|                   | Preserving authorization sessions  |             ✅            |
| Desktop (Linux)   | Rendering in a Linux host system   |             ❌            |

### Browser
The current build only supports rendering MAX Messenger in a browser using the `noVNC` utility:

![Demonstration](https://github.com/user-attachments/assets/90a0caec-d584-492b-a3ff-b045d1fa4e71)

#### Prerequisites
* Docker
* 2 GB+ of free RAM

#### Run
Clone the repository:
```shell
git clone https://github.com/y0ung3r/isolated-max.git
```

Start the container via `docker-compose`:
```shell
cd browser
docker-compose up -d
```
The latest image will be downloaded automatically from the [Package Registry](https://github.com/y0ung3r/isolated-max/pkgs/container/isolated-max).

Go to the browser at the URL:
```
https://localhost:8080/
```

### Desktop (Windows)
#### Prerequisites
* Windows 11
* Docker
* WSL
* PowerShell
* 2 GB+ of free RAM

#### Run
Clone the repository:
```shell
git clone https://github.com/y0ung3r/isolated-max.git
```

Install MAX Messenger:
```shell
cd windows
pwsh install.ps1
```
This will automatically download Ubuntu (WSL) to your computer, create a shortcut on your desktop and in the Start menu, and launch MAX Messenger.

Uninstall MAX Messenger:
```shell
cd windows
pwsh install.ps1
```
This will automatically delete the shortcuts.

### Desktop (Linux)
Currently, the image for Linux is not implemented. However, you can use an excellent alternative: https://github.com/Lumetas/max-docker. Thank you, [@Lumetas](https://github.com/Lumetas)!

### Notes
1. After launching the application, you will be prompted to create a password for the secure storage. You can skip this step by leaving the fields blank. Alternatively, you can create a password that will be requested each time you open the application.
2. Downloading files and media. All files are placed in the `Downloads` folder, which is located with `docker-compose.yml`

### Licence
The project is distributed under the MIT license.
MAX Messenger is a product of Communication Platform LLC (ООО «Коммуникационная платформа»).
