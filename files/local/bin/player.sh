#!/bin/bash

systemctl --user start mpd
ncmpcpp
systemctl --user stop mpd
