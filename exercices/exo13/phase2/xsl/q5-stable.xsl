<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="utf-8"/>
    <xsl:template match="/">
        <xsl:text>Construire une feuille de styles pour extraire (au format TXT) les items en relation de dépendance syntaxique de type OBJ (les classer et les compter). Essayer de tenir compte de la différence titre/description</xsl:text> <xsl:text>
        
        </xsl:text>
        
        
        <xsl:apply-templates select="//file"/>
    </xsl:template>
    
    <xsl:template match="file">
        <xsl:if test="./@type='titre'">
            <!-- Pour chaque titre du bloc -->
            <xsl:for-each select="./titre">
                <!-- Pour chaque paragraphe de ce titre -->
                <xsl:for-each select="./p/item">

                        <!-- si la dep est obj -->
                        <xsl:if test="./a[8][text()='obj']">
                             
                            <!-- Creation des variables -->
                            <xsl:variable name="numGov" select="./a[7]"/>
                            <xsl:variable name="numDep" select="./a[1]"/>
                            <xsl:variable name="dep" select="./a[2]/text()"/>
                            <xsl:variable name="diffDepGouv" select="$numDep - $numGov"/>
                            
                            <!-- TEST : Affichage des variables -->
                            numGov : <xsl:value-of select="$numGov"/>#
                            numDep : <xsl:value-of select="$numDep"/>#
                            dep : <xsl:value-of select="$dep"/>#
                            num : <xsl:value-of select="$diffDepGouv"/>#
                            
                            
                            <!-- Calcul -->
                            <xsl:if test="$diffDepGouv &gt; 0">
                                <xsl:value-of select="preceding-sibling::item[$diffDepGouv]/a[2]/text()"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="$dep"/>
                                <xsl:text> </xsl:text>
                            </xsl:if>
                            
                            <!-- Calcul -->
                            <xsl:if test="$diffDepGouv &lt; 0">
                                <xsl:value-of select="$dep"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="following-sibling::item[-$diffDepGouv]/a[2]/text()"/>
                                <xsl:text> </xsl:text>
                            </xsl:if>
                        </xsl:if>

                </xsl:for-each>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>

