<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <title> exercice_5_Q3</title>
            </head>
            
            <body>
                
                <h1> Exercice 5 - Q3</h1>
                
                <xsl:apply-templates select="TEI/text/group/text/body/lg/lg"/>
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="lg">
        <p><xsl:value-of select="l[3]"/></p>
    </xsl:template>
    
</xsl:stylesheet>



