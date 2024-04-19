#!/bin/sh
# Run fix iafter using stepconf to add the Men's Shed Router bits back in.
#
# Add the Subroutine Path

perl -p -i -e 's/\[RS274NGC\]/\[RS274NGC\]\nSUBROUTINE_PATH = macros/' Mens_Shed.ini
perl -p -i -e 's/sets spindle-at-speed true/#sets spindle-at-speed true/' pyvcp_options.hal
