<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/meta">
	<h3>METADONNEES COPIE-ELEVE : <xsl:value-of select="id"/></h3>
	<p align="center">
	<xsl:for-each select="m">
		<b><xsl:value-of select="@type"/></b> : <xsl:value-of select="."/>
		<xsl:choose>
		<xsl:when test="@type='pere-csp-g2'"><br/></xsl:when>
		<xsl:otherwise><xsl:if test="not (@type='langues')"><xsl:text> | </xsl:text></xsl:if></xsl:otherwise>
		</xsl:choose>
	</xsl:for-each>
    </p>
</xsl:template>
</xsl:stylesheet>
