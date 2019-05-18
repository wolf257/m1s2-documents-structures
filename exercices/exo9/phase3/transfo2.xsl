<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="1.0">
    
        
    <!-- @*|node() is a shortcut for attribute::* | child::node() -->
    <xsl:template match="@*|node()">
        <xsl:copy> <xsl:apply-templates select="@*|node()" /> </xsl:copy>
    </xsl:template>
    
    <xsl:template match="u">
        <xsl:for-each select=".">
            
            <!-- On reconstruit l'élement u-->
            <xsl:element name="u">
                
                <xsl:attribute name="who">
                    <xsl:value-of select="@who"/>
                </xsl:attribute>
                
                <xsl:attribute name="n">
                    <xsl:value-of select="@n"/>
                </xsl:attribute>
                
                <xsl:variable name="trouvaille"/>
                
                <!-- Ici, on fait nos transformations -->
                <xsl:choose>

                    <xsl:when test="contains(text(),'ah bon')">
                        <xsl:value-of select="substring-before(text(),'ah bon')"/>
                        <interj>ah bon</interj>
                        <xsl:value-of select="substring-after(text(),'ah bon')"/>
                    </xsl:when>
                    
                    <xsl:when test="contains(text(),'ah oui')">
                        <xsl:value-of select="substring-before(text(),'ah oui')"/>
                        <interj>ah oui</interj>
                        <xsl:value-of select="substring-after(text(),'ah oui')"/>
                    </xsl:when>
                    
                    <xsl:when test="contains(text(),'ah')">
                        <xsl:value-of select="substring-before(text(),'ah')"/>
                        <interj>ah oui</interj>
                        <xsl:value-of select="substring-after(text(),'ah')"/>
                    </xsl:when> 
                    
                    <xsl:otherwise>
                        <xsl:value-of select="."/>
                    </xsl:otherwise>
                    
                </xsl:choose>
                
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>