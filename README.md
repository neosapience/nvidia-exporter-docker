# nvidia-exporter-docker
> Prometheus exporter for nvidia-smi. Image size is`122MB`.

## container sizes

| ubuntu16.04 | centos7 |
|-------------|---------|
| `122MB`     | `224MB` |


## Preparation
* docker
* nvidia docker2
* prometheus

## Run
```
docker run --runtime=nvidia --rm -d -p 9114:9114 neosapience/nvidia-exporter
```

## Sources
* base docker image: nvidia/cuda
* nvidia exporter: [tankbusta/nvidia_exporter](https://github.com/tankbusta/nvidia_exporter)
