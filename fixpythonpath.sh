#!/bin/sh
# Fix pybombs paths
python=python3
maj=$($python -V 2>&1 |tr . ' '|cut -d ' ' -f 2)
min=$($python -V 2>&1 |tr . ' '|cut -d ' ' -f 3)
echo -n "export PYTHONPATH="
for ver in $maj $maj.$min ; do
for lib in lib lib64 ; do
for pkg in site dist ; do
echo -n $(pwd)/${lib}/python${ver}/${pkg}-packages:
done
done
done
echo '${PYTHONPATH}'
echo 'PATH=/usr/lib/ccache:${PATH}'
