<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <title> exercice_5_Q7</title>
            </head>
            
            <body>
                
                <h1> Exercice 5 - Q7</h1>
                <xsl:apply-templates select="TEI/text/group/text/body"/> 
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="body">
        <table border="10" align="center" style="width:40%; text-align:left;">
            
            <xsl:for-each select="lg/lg">
                <tr>
                    <td bgcolor="white" style="text-align:center;">
                        <xsl:text> - </xsl:text>
                    </td>
                </tr>
                
                <xsl:for-each select="l">
                    <tr>
                        <td>
                            <xsl:value-of select="."/>
                        </td>
                    </tr>
                </xsl:for-each>
                
            </xsl:for-each>   

        </table>
    </xsl:template>
    
</xsl:stylesheet>

