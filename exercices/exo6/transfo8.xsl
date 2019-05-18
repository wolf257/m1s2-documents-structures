<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        
        <xsl:apply-templates select="TEI/text/group/text/body/lg/lg/l[contains(text(),';') or contains(text(),':')]"> </xsl:apply-templates>
        
    </xsl:template>
    
    <xsl:template match="l">
        
        <xsl:value-of select="."/> 
        <xsl:text> </xsl:text>
        
    </xsl:template>

</xsl:stylesheet>