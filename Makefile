name := neosapience/nvidia-exporter

build: build-91-cent7 build-90-cent7
#build-91 build-90

build-91:
	@docker build \
		-t ${name}:latest \
		-t ${name}:cuda9.1-ubuntu16.04 \
		--build-arg cuda_version=9.1 \
		cuda9.x-ubuntu16.04

build-90:
	@docker build \
		-t ${name}:cuda9.0-ubuntu16.04 \
		--build-arg cuda_version=9.0 \
		cuda9.x-ubuntu16.04

build-91-cent7:
	@docker build \
		-t ${name}:cuda9.1-centos7 \
		--build-arg cuda_version=9.1 \
		cuda9.x-centos7

build-90-cent7:
	@docker build \
		-t ${name}:cuda9.0-centos7 \
		--build-arg cuda_version=9.0 \
		cuda9.x-centos7

ls:
	@docker images ${name}

push:
	@docker push ${name}
