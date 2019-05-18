<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="iso-8859-1"/>
<xsl:template match="/table">
  <html>
  <body>
  <table border="2" align="center">
  <thead align="center">
    <tr>
      <th>Numéro</th>
      <th>Age</th>
      <th>Années d'étude</th>
      <th>Diplôme</th>
      <th>Ancienneté</th>
      <th>Service</th>
    </tr>
  </thead>
  <tbody>
  <xsl:for-each select="ligne">
    <xsl:if test="not(preceding-sibling::ligne/classe_anciennete=./classe_anciennete)">
      <tr><th colspan="6"><xsl:value-of select="./classe_anciennete"/></th></tr></xsl:if>
    <tr>
      <td><xsl:value-of select="./infirmiere"/></td>
      <td><xsl:value-of select="./age"/></td>
      <td><xsl:value-of select="./annees_etudes"/></td>
      <td><xsl:value-of select="./diplome"/></td>
      <td><xsl:value-of select="./anciennete_neonatalite"/></td>
      <td><xsl:value-of select="./service"/></td>
    </tr>
  </xsl:for-each>
  </tbody>
  </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
