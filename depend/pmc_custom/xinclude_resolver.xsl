<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:ng="http://docbook.org/docbook-ng" xmlns:db="http://docbook.org/ns/docbook" xmlns:xi="http://www.w3.org/2001/XInclude" xmlns:xml="http://www.w3.org/XML/1998/namespace" exclude-result-prefixes="db ng exsl" version="1.0">
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="processing-instruction()">
        <xsl:copy/>
    </xsl:template>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="xi:include">     
        <xsl:variable name="id_value">          
            <xsl:value-of select="@xpointer"/>
        </xsl:variable>
        <xsl:for-each select="document(@href,/)">
            <xsl:apply-templates select="//*[@xml:id=$id_value]"/>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Add default footers -->    

</xsl:stylesheet>