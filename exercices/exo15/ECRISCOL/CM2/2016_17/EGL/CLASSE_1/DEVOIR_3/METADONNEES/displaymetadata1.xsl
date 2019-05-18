<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/meta">
	<table align="center">
	<tr><th colspan="2"><b><xsl:value-of select="id"/></b></th></tr>
	<xsl:for-each select="m">
		<tr><td><xsl:value-of select="@type"/></td><td><xsl:value-of select="."/></td></tr>
	</xsl:for-each>
    </table>
	<br/>
</xsl:template>
</xsl:stylesheet>
