<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:db="http://docbook.org/ns/docbook" 
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:scroll="http://www.k15t.com/scroll-docbook/extensions"
    xmlns:oasis="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output indent="yes" method="xml" encoding="utf-8"  ></xsl:output>
    
    <xsl:template match="article">
        <article xmlns="http://docbook.org/ns/docbook" xmlns:xlink="http://www.w3.org/1999/xlink"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:scroll="http://www.k15t.com/scroll-docbook/extensions"
            xmlns:oasis="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
            xsi:schemaLocation="http://docbook.org/ns/docbook http://docbook.org/xml/5.0/xsd/docbook.xsd"            
            version="5.0" xml:id="scroll-bookmark-1">
            
            <xsl:apply-templates select="@* | node()"/>
            
        </article>
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:element name="{local-name()}" namespace="http://docbook.org/ns/docbook">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <!-- template to copy attributes -->
    <xsl:template match="@*">
        <xsl:attribute name="{local-name()}">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    
    <!-- template to copy the rest of the nodes -->
    <xsl:template match="comment() | text() | processing-instruction()">
        <xsl:copy/>
    </xsl:template>
    
    
</xsl:stylesheet>