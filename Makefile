.PHONY: build build-rpi run clean install uninstall

include openwrt.conf
export

build:
	wget -q https://downloads.openwrt.org/releases/${OPENWRT_SOURCE_VER}/targets/x86/64/openwrt-${OPENWRT_SOURCE_VER}-x86-64-generic-rootfs.tar.gz
	docker build \
		--build-arg ROOT_PW \
		--build-arg OPENWRT_SOURCE_VER \
		-t ${BUILD_TAG} .
	rm openwrt-${OPENWRT_SOURCE_VER}-x86-64-generic-rootfs.tar.gz

build-rpi:
	./build-rpi.sh ${RPI_SOURCE_IMG}

run:
	./run.sh

clean:
	docker rm ${CONTAINER} || true
	docker network rm ${LAN_NAME} ${WAN_NAME} || true

install:
	install -Dm644 openwrt.service /usr/lib/systemd/system/openwrt.service
	sed -i -E "s#(ExecStart=).*#\1`pwd`/run.sh#g" /usr/lib/systemd/system/openwrt.service
	systemctl daemon-reload
	systemctl enable openwrt.service
	@echo "OpenWRT service installed and will be started on next boot automatically."
	@echo "To start it now, run 'systemctl start openwrt.service'."

uninstall:
	systemctl stop openwrt.service
	systemctl disable openwrt.service
	rm /usr/lib/systemd/system/openwrt.service
	systemctl daemon-reload