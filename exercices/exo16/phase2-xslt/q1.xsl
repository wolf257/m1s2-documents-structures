<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    
<xsl:template match="//dico">
        <dico>
            <xsl:for-each select="./entry">
                
                <xsl:if test="( position() &gt;= 2000 ) and ( position() &lt;= 2201 )">
                    <xsl:copy-of select="."/> 
                </xsl:if>
            </xsl:for-each>
        </dico>
    </xsl:template>
</xsl:stylesheet>