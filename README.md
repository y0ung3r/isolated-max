## isolated-max
Allows you to run MAX Messenger in an isolated Docker container!

### Supported modes
#### Browser
The current build only supports running MAX Messenger in a browser using the `noVNC` utility:
<img width="686" height="513" alt="Demonstration" src="https://github.com/user-attachments/assets/90a0caec-d584-492b-a3ff-b045d1fa4e71" />

#### Desktop (Linux)
We do not yet support the ability to launch MAX Messenger directly in the host system. 
However, there is an excellent alternative that inspired us to launch the application in a browser: https://github.com/Lumetas/max-docker. Thank you, @Lumetas!

### Run
Clone the repository:
```shell
git clone https://github.com/y0ung3r/isolated-max.git
```

Start the container via `docker-compose`:
```shell
docker-compose up -d
```
The latest image will be downloaded automatically from the `Package Registry`.

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
