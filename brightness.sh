#!/bin/sh
echo to dim lcd
echo 0 > /sys/class/backlight/acpi_video0/brightness
echo to max lcd
echo 7 > /sys/class/backlight/acpi_video0/brightness
