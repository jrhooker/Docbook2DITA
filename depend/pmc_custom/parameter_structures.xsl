<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:db="http://docbook.org/ns/docbook" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:svg="http://www.w3.org/2000/svg" xmlns:mml="http://www.w3.org/1998/Math/MathML"
    xmlns:dbx="http://sourceforge.net/projects/docbook/defguide/schema/extra-markup"
    xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/"
    xmlns:xi="http://www.w3.org/2001/XInclude" xmlns:html="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xsl db xlink svg mml dbx xi html">
    
    <xsl:template match="db:section[normalize-space(db:title) = 'Description'] | db:section[normalize-space(db:title) = 'Return Value']  | db:section[normalize-space(db:title) = 'Example'] | db:section[normalize-space(db:title) = 'Prototype']" priority="10">
        <xsl:element name="section">
            <xsl:element name="title"><xsl:value-of select="db:title"/></xsl:element>
            <xsl:apply-templates select="db:*[not(db:title)]"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="db:section[normalize-space(db:title) = 'Parameters']" priority="10">
        <xsl:element name="section">
            <xsl:element name="title"><xsl:value-of select="db:title"/></xsl:element>
            <xsl:choose>
                <xsl:when test="db:section">
                    <xsl:element name="parml">
                        <xsl:for-each select="db:section">
                            <xsl:element name="plentry">
                                <xsl:element name="pt">
                                    <xsl:value-of select="db:title"/>
                                </xsl:element>
                                <xsl:element name="pd">
                                    <xsl:apply-templates select="db:*[not(db:title)]"></xsl:apply-templates>
                                </xsl:element>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates></xsl:apply-templates>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
     
    
</xsl:stylesheet>