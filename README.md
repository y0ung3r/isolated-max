## isolated-max
Allows you to run MAX Messenger in an isolated Docker container!

### Features
| **Environment**   | **Feature**                        | **Implementation Status** |
|:------------------|------------------------------------|:-------------------------:|
| Browser           | Rendering in a browser             |            ✅             |
|                   | Downloading files and media        |            ✅             |
|                   | Audio streaming                    |            ❌             |
|                   | Preserving authorization sessions  |            ❌             |
| Desktop (Linux)   | Rendering in a Linux host system   |            ❌             |
| Desktop (Windows) | Rendering in a Windows host system |            ❌             |

### Environments
#### Browser
The current build only supports rendering MAX Messenger in a browser using the `noVNC` utility:

![Demonstration](https://github.com/user-attachments/assets/90a0caec-d584-492b-a3ff-b045d1fa4e71)

#### Desktop
We do not yet support the ability to render isolated MAX Messenger directly in the host system. 
However, there is an excellent alternative that inspired us to launch the application in a browser: https://github.com/Lumetas/max-docker. Thank you, @Lumetas!

### Prerequisites
* Docker
* 2 GB+ of free RAM

### Run
Clone the repository:
```shell
git clone https://github.com/y0ung3r/isolated-max.git
```

Start the container via `docker-compose`:
```shell
docker-compose up -d
```
The latest image will be downloaded automatically from the [Package Registry](https://github.com/y0ung3r/isolated-max/pkgs/container/isolated-max).

Go to the browser at the URL:
```
https://localhost:8080/
```

### Build
If you want to build your own image, follow the steps below.

Clone the repository:
```shell
git clone https://github.com/y0ung3r/isolated-max.git
```

Build image and start the container via `docker-compose`:
```shell
docker-compose up -d --build
```

Go to the browser at the URL:
```
https://localhost:8080/
```

### Licence
The project is distributed under the MIT license.
MAX Messenger is a product of Communication Platform LLC (ООО «Коммуникационная платформа»).