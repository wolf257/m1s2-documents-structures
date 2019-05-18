<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/meta">
	<h3><xsl:value-of select="id"/></h3>
	<table align="center">
	<xsl:for-each select="m">
		<xsl:choose>
		<xsl:when test="@type='RUB'">
		<tr><th colspan="2"><b><xsl:value-of select="."/></b></th></tr>
		</xsl:when>
		<xsl:otherwise>
		<tr><td><xsl:value-of select="@type"/></td><td><xsl:value-of select="."/></td></tr>
		</xsl:otherwise>
		</xsl:choose>
		</xsl:for-each>
    </table>
	<br/>
</xsl:template>
</xsl:stylesheet>
