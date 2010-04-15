#!/bin/sh

name=clementine
url=`svn info | grep URL | head -n1 | awk '{print $2}' | sed 's/\/dist//'`
version=`grep Version $name.spec | head -n1 | awk '{print $2}'`

echo "Checking out $url into $name-$version..."

rm -rf $name-$version
svn export $url $name-$version
rm -rfv $name-$version/debian
tar -czf $name-$version.tar.gz $name-$version
cp $name-$version.tar.gz ${name}_${version}.orig.tar.gz
svn export $url/debian $name-$version/debian
