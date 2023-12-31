#!/bin/sh

echo This is a test build
echo **For developers.**
echo It links the game files and preserves the source code.

echo Start BuildLinux ...

if [ ! -e minorGems ]
then
	git clone https://github.com/selb/YumLifeMinorGems.git	
fi

if [ ! -e OneLife ]
then
	git clone git@github.com:is52hertz/YumWorld.git
fi

if [ ! -e OneLifeData7 ]
then
	git clone https://github.com/jasonrohrer/OneLifeData7.git	
fi


# cd minorGems
# git fetch --tags
# latestTaggedVersion=`git for-each-ref --sort=-creatordate --format '%(refname:short)' --count=1 refs/tags/OneLife_v* | sed -e 's/OneLife_v//'`
# git checkout -q OneLife_v$latestTaggedVersion


# cd OneLife
# git fetch --tags
# latestTaggedVersionA=`git for-each-ref --sort=-creatordate --format '%(refname:short)' --count=1 refs/tags/OneLife_v* | sed -e 's/OneLife_v//'`
# git checkout -q OneLife_v$latestTaggedVersionA


cd OneLifeData7
git fetch --tags
# remove translated objects
git checkout .
latestTaggedVersionB=`git for-each-ref --sort=-creatordate --format '%(refname:short)' --count=1 refs/tags/OneLife_v* | sed -e 's/OneLife_v//'`
git checkout -q OneLife_v$latestTaggedVersionB

rm */cache.fcz


latestVersion=$latestTaggedVersionB

# if [ "$latestTaggedVersionA" -gt "$latestTaggedVersionB" ]
# then
# 	latestVersion=$latestTaggedVersionA
# fi



cd ..


if [ ! -h animations ]
then
	ln -s OneLifeData7/animations .	
fi


if [ ! -h categories ]
then
	ln -s OneLifeData7/categories .	
fi


if [ ! -h ground ]
then
	ln -s OneLifeData7/ground .	
fi


if [ ! -h music ]
then
	ln -s OneLifeData7/music .	
fi


if [ ! -h objects ]
then
	ln -s OneLifeData7/objects .	
fi


if [ ! -h sounds ]
then
	ln -s OneLifeData7/sounds .	
fi


if [ ! -h sprites ]
then
	ln -s OneLifeData7/sprites .	
fi


if [ ! -h transitions ]
then
	ln -s OneLifeData7/transitions .	
fi


if [ ! -h dataVersionNumber.txt ]
then
	ln -s OneLifeData7/dataVersionNumber.txt .	
fi




cp OneLife/build/source/runToBuild .
cp OneLife/scripts/skps2010Scripts/cleanOldBuilds.sh .
cp OneLife/scripts/skps2010Scripts/makeWindows.sh .
cp OneLife/scripts/skps2010Scripts/makeMacOSX.sh .
cp OneLife/scripts/skps2010Scripts/translator.py .


./runToBuild 1



echo
echo
echo "Done building v$latestVersion"
