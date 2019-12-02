set PATHTOPROJECT=%1
set FILENAME=%2
set DITAMAPNAME=%3

cd ..\

set WORKINGDIR=%CD%

cd %WORKINGDIR%\batchfiles

rd /s /q %WORKINGDIR%\out\

mkdir %WORKINGDIR%\out\

xcopy %WORKINGDIR%\%PATHTOPROJECT% %WORKINGDIR%\out\ /S /Y

java -jar %WORKINGDIR%\saxonhe9-3-0-4j\saxon9he.jar   -o:%WORKINGDIR%\in\saxon_temporary1.xml %WORKINGDIR%\%PATHTOPROJECT%\%FILENAME% %WORKINGDIR%\depend\pmc_custom\xinclude_resolver.xsl

echo Xincludes integrated

java -jar %WORKINGDIR%\saxonhe9-3-0-4j\saxon9he.jar   -o:%WORKINGDIR%\in\saxon_temporary2.xml %WORKINGDIR%\in\saxon_temporary1.xml %WORKINGDIR%\depend\isosts2cals\lib\strip-namespace.xsl

java -jar %WORKINGDIR%\saxonhe9-3-0-4j\saxon9he.jar   -o:%WORKINGDIR%\in\saxon_temporary3.xml %WORKINGDIR%\in\saxon_temporary2.xml %WORKINGDIR%\depend\isosts2cals\isosts2cals.xsl

java -jar %WORKINGDIR%\saxonhe9-3-0-4j\saxon9he.jar   -o:%WORKINGDIR%\in\saxon_temporary4.xml %WORKINGDIR%\in\saxon_temporary3.xml %WORKINGDIR%\depend\isosts2cals\remove_oasis_ns.xsl

java -jar %WORKINGDIR%\saxonhe9-3-0-4j\saxon9he.jar   -o:%WORKINGDIR%\in\saxon_temporary5.xml %WORKINGDIR%\in\saxon_temporary4.xml %WORKINGDIR%\depend\isosts2cals\lib\return-namespace.xsl

java -jar %WORKINGDIR%\saxonhe9-3-0-4j\saxon9he.jar   -o:%WORKINGDIR%\in\saxon_temporary6.xml %WORKINGDIR%\in\saxon_temporary5.xml %WORKINGDIR%\depend\pmc_custom\generate_ids.xsl

java -jar %WORKINGDIR%\saxonhe9-3-0-4j\saxon9he.jar   -o:%WORKINGDIR%\in\saxon_temporary7.xml %WORKINGDIR%\in\saxon_temporary6.xml %WORKINGDIR%\depend\pmc_custom\rewrite_links.xsl

echo Docbook IDs generated

java -jar %WORKINGDIR%\saxonhe9-3-0-4j\saxon9he.jar   -o:%WORKINGDIR%\in\saxon_temporary8.xml %WORKINGDIR%\in\saxon_temporary7.xml %WORKINGDIR%\depend\pmc_custom\unique-ify_ids.xsl

echo IDs ensure unique

java -jar %WORKINGDIR%\saxonhe9-3-0-4j\saxon9he.jar   -o:%WORKINGDIR%\out\%DITAMAPNAME% %WORKINGDIR%\in\saxon_temporary8.xml %WORKINGDIR%\depend\pmc_custom\generate_bookmap.xsl

echo Bookmap Generated

java -jar %WORKINGDIR%\saxonhe9-3-0-4j\saxon9he.jar   -o:%WORKINGDIR%\out\trashme.xml %WORKINGDIR%\in\saxon_temporary8.xml %WORKINGDIR%\depend\pmc_custom\generate_topics_docbook_1.0.xsl

echo Topics Generated


mkdir %WORKINGDIR%\in\

cd %WORKINGDIR%\batchfiles