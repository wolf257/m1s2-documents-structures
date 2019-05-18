<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <title> exercice_5_Q9</title>
            </head>
            
            <body>
                <h1> Exercice 5 - Q9</h1>

                <xsl:for-each select="TEI/text/group/text/body/lg/lg">
                    
                    <xsl:choose>
                        
                        <!-- IF QUATRAIN-->
                        <xsl:when test="count(*)&gt;3">
                            <xsl:for-each select="l">
                                <b><xsl:value-of select="."/></b><br></br>
                            </xsl:for-each>
                        </xsl:when>
                        
                        <!-- IF TERCET -->
                        <xsl:otherwise>
                            <xsl:for-each select="l">
                                <i><xsl:value-of select="."/></i><br></br>
                            </xsl:for-each>
                        </xsl:otherwise>
                        
                    </xsl:choose>
                    <br/>
                    
                </xsl:for-each>
                
                
            </body>     
        </html>
    </xsl:template>

</xsl:stylesheet>

