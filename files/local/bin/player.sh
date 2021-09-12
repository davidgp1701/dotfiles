#!/bin/bash

systemctl --user start mpd
systemctl --user start mpd-notification
ncmpcpp
mpc stop
systemctl --user stop mpd-notification
systemctl --user stop mpd
