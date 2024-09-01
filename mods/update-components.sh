#/bin/bash

source ./tools/config.sh

CAMERA_REPO_URL="https://github.com/espressif/esp32-camera.git"
DL_REPO_URL="https://github.com/espressif/esp-dl.git"
RMAKER_REPO_URL="https://github.com/espressif/esp-rainmaker.git"
INSIGHTS_REPO_URL="https://github.com/espressif/esp-insights.git"
DSP_REPO_URL="https://github.com/espressif/esp-dsp.git"
LITTLEFS_REPO_URL="https://github.com/joltwallet/esp_littlefs.git"
TINYUSB_REPO_URL="https://github.com/hathach/tinyusb.git"

#
# CLONE/UPDATE ARDUINO
#
echo "Cloning ESP32 Arduino..."
git clone $AR_REPO_URL "$AR_COMPS/arduino" && \
	git -C "$AR_COMPS/arduino" reset --hard d75795f5 && \
	git -C "$AR_COMPS/arduino" submodule update --init --recursive
if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE ESP32-CAMERA
#
echo "Cloning ESP32 Camera..."
git clone $CAMERA_REPO_URL "$AR_COMPS/esp32-camera" && \
	git -C "$AR_COMPS/esp32-camera" reset --hard f0bb429 && \
	git -C "$AR_COMPS/esp32-camera" submodule update --init --recursive
if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE ESP-DL
#
echo "Updating ESP-DL..."
git clone $DL_REPO_URL "$AR_COMPS/esp-dl" && \
	git -C "$AR_COMPS/esp-dl" reset --hard 0632d24 && \
	git -C "$AR_COMPS/esp-dl" submodule update --init --recursive
if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE ESP-LITTLEFS
#
echo "Cloning ESP-LITTLEFS..."
git clone $LITTLEFS_REPO_URL "$AR_COMPS/esp_littlefs" && \
	git -C "$AR_COMPS/esp_littlefs" reset --hard 41873c2 && \
	git -C "$AR_COMPS/esp_littlefs" submodule update --init --recursive
if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE ESP-RAINMAKER
#
echo "Cloning ESP-RainMaker..."
git clone $RMAKER_REPO_URL "$AR_COMPS/esp-rainmaker" && \
	git -C "$AR_COMPS/esp-rainmaker" reset --hard d8e9345 && \
	git -C "$AR_COMPS/esp-rainmaker" submodule update --init --recursive
if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE ESP-DSP
#
echo "Cloning ESP-DSP..."
git clone $DSP_REPO_URL "$AR_COMPS/espressif__esp-dsp" && \
	git -C "$AR_COMPS/espressif__esp-dsp" reset --hard 9b4a8b4 && \
	git -C "$AR_COMPS/espressif__esp-dsp" submodule update --init --recursive
if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE TINYUSB
#
echo "Cloning TinyUSB..."
git clone $TINYUSB_REPO_URL "$AR_COMPS/arduino_tinyusb/tinyusb" && \
	git -C "$AR_COMPS/arduino_tinyusb/tinyusb" reset --hard a0e5626bc && \
	git -C "$AR_COMPS/arduino_tinyusb/tinyusb" submodule update --init --recursive
if [ $? -ne 0 ]; then exit 1; fi

