docker-build-vanilla-image:
	docker build -t wcm-image-vanilla:0.0.2 ./dockerfiles/vanilla/.
docker-build-gpu-image:
	docker build -t wcm-image-gpu:0.0.2 ./dockerfiles/gpu/.
docker-run-vanilla-jupyter:
	docker run --rm -ti -p 8888:8888 -p 6666:6666 \
		-v ${PWD}:/tf \
		-w /tf \
		wcm-image-vanilla:0.0.2
docker-run-gpu-jupyter:
	docker run --rm -ti -p 8888:8888 -p 6666:6666 \
		-v ${PWD}:/tf \
		-w /tf \
		wcm-image-gpu:0.0.2
docker-run-network-jupyter:
	docker run --rm -ti --network host \
		-v ${PWD}:/tf \
		-w /tf \
		wcm-image-vanilla:0.0.2
fix-permissions:
	sudo chown -R 1000:1000 .
docker-start-elastic:
	docker run --rm -it --mount type=bind,source=./ES,target=/usr/share/elasticsearch/data \
		--network host --env discovery.type=single-node \
		docker.elastic.co/elasticsearch/elasticsearch:7.10.1


						