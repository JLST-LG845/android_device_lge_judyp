TWRP device tree for LG V35 ThinQ

The LG V35 ThinQ (codenamed _"judyp"_) is a high-end smartphone from LG.
LG V35 was announced in May 2018 and released in June 2018.

## Device specifications

| Baisc                   | Specification Sheet                                                                                                                |
| ----------------------: |:---------------------------------------------------------------------------------------------------------------------------------- |
| SoC                     | Qualcomm SDM845 Snapdragon 845                                                                                                     |
| CPU                     | Octa-core (4x2.8 GHz Kryo 385 Gold & 4x1.8 GHz Kryo 385 Silver)                                                                    |
| GPU                     | Adreno 630                                                                                                                         |
| Memory                  | 6GB (LPDDR4X)                                                                                                                      |
| Shipped Android Version | 8.0 with LGUX                                                                                                                      |
| Last version of Android | 10.0 with LGUX                                                                                                                     |
| Storage                 | 64/128 UFS2.1                                                                                                                      |
| Battery                 | Non-removable Li-Poly 3300 mAh battery                                                                                             |
| Display                 | 1440 x 2880 pixels, 18:9 ratio, 6.0 inches, P-OLED, HDR10 (~538 ppi density)                                                       |
| Extras                  | IP68, NFC                                                                                                                          |

## Device picture

![LG V35](https://www.dhresource.com/webp/m/0x0/f2/albu/g9/M00/28/81/rBVaVV3nTjSAV1WIAAH7Fq8TBp0264.jpg)


## Kernel

Prebuilt kernel source:
https://github.com/EmanuelCN/android_kernel_lge_sdm845/tree/recovery

## Compile

First repo init the twrp-12.1 tree:
```
mkdir ~/android/twrp-12.1
cd ~/android/twrp-12.1
repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
mkdir -p .repo/local_manifests
```

Then add to a local manifest (if you don't have .repo/local_manifest then make that directory and make a blank file and name it something like twrp.xml):

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="osm0sis/twrp_abtemplate" path="bootable/recovery/installer" remote="github" revision="master"/>
  <project name="EAZYBLACK/recovery_device_lge_judy" path="device/lge/judyp" remote="github" revision="judyp"/>
</manifest>
```

Now you can sync your source:

```
repo sync
```

To automatically make the TWRP installer zip, you need to import this commit in the build/make path: https://gerrit.twrp.me/c/android_build/+/4964

Finally execute these:

```
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
lunch twrp_judyp-eng
make adbd bootimage
```
