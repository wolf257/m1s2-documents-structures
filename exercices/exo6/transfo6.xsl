<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <title> exercice_5_Q6</title>
            </head>
            
            <body>
                
                <h1> Exercice 5 - Q6</h1>
                
                <xsl:apply-templates select="TEI/text/group/text/body/lg/lg"/>
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="lg">
        <h3> Strophe <xsl:value-of select="position()"/> </h3>
        <p>
            <xsl:for-each select="l">
                <b> <xsl:value-of select="position()"/> - </b> <xsl:value-of select="."/> <br/>
            </xsl:for-each>
        </p>
    </xsl:template>
    
</xsl:stylesheet>

