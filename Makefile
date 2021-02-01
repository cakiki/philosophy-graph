docker-build-vanilla-image:
	docker build -t wcm-image-vanilla:0.0.1 ./dockerfiles/vanilla/.
docker-build-gpu-image:
	docker build -t wcm-image-gpu:0.0.1 ./dockerfiles/gpu/.
docker-run-vanilla-jupyter:
	docker run --rm -ti -p 8888:8888 -p 6666:6666 \
		-v ${PWD}:/tf \
		-w /tf \
		wcm-image-vanilla:0.0.1
docker-run-gpu-jupyter:
	docker run --rm -ti -p 8888:8888 -p 6666:6666 \
		-v ${PWD}:/tf \
		-w /tf \
		wcm-image-gpu:0.0.1
docker-run-network-jupyter:
	docker run --rm -ti --network host \
		-v ${PWD}:/tf \
		-w /tf \
		wcm-image-vanilla:0.0.1
fix-permissions:
	sudo chown -R 1000:1000 .