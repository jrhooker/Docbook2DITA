<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:scroll="http://www.k15t.com/scroll-docbook/extensions"
    xsi:schemaLocation="http://docbook.org/ns/docbook http://docbook.org/xml/5.0/xsd/docbook.xsd">

    <xsl:import href="lib/xhtml2cals.xsl"/>

    <xsl:template match="/*">
        <xsl:copy>
            <xsl:namespace name="oasis" select="'-//OASIS//DTD XML Exchange Table Model 19990315//EN'"/>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="*">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="processing-instruction() | comment()">
        <xsl:copy/>
    </xsl:template>

    <xsl:template match="table[descendant::td] | informaltable[descendant::td]">
        <xsl:apply-templates select="." mode="xhtml2cals"/>
    </xsl:template>    
   

</xsl:stylesheet>