<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="//dico">
        <dico>
            <xsl:for-each select="./entry">
                
                   <xsl:if test="(./pos/@name = 'verb')">
- Lemme : <xsl:copy-of select="./lemma"/> 
<xsl:text>
    
</xsl:text>
                       
<xsl:for-each select="./inflected/form">
<xsl:copy-of select="."/> <xsl:text> </xsl:text> 
</xsl:for-each>  
                       
<xsl:text>
</xsl:text>

                   </xsl:if>
                
            </xsl:for-each>
        </dico>
    </xsl:template>
</xsl:stylesheet>