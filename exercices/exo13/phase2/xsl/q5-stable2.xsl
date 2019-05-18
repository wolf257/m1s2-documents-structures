<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <!-- Transfo1 : TITRE -->
        <xsl:result-document method="text" href="./extraction-q5/titres.txt">
            <xsl:text> Extraction (au format TXT) d'items en relation de dépendance syntaxique de type OBJ (les classer et les compter) dans titres.</xsl:text> <xsl:text>
        </xsl:text>
            <xsl:apply-templates select="//file[contains(@type, 'titre')]" mode="titre"/>
        </xsl:result-document>
        
        <!-- Transfo2 : DESC -->    
        <xsl:result-document  method="text" href="./extraction-q5/desc.txt">
            <xsl:text> Extraction (au format TXT) d'items en relation de dépendance syntaxique de type OBJ (les classer et les compter) dans description.</xsl:text>
            <xsl:apply-templates select="//file[contains(@type, 'description')]" mode="description"/>
        </xsl:result-document>  
        
        <xsl:apply-templates select="//file"/>
    </xsl:template>
    
    <!-- TEMPLATE -->    
<xsl:template match="file" mode="titre">

    <xsl:variable name="compteurDesc" select="count(//titre/p/item/a[8][text()='obj'])" />
    
    <xsl:text> 
            
Nous avons </xsl:text> <xsl:value-of select="$compteurDesc"/> <xsl:text> items répondant à ce critère. </xsl:text>
    
    <xsl:for-each select="./titre/p/item">
                
        <!-- si la dep est obj -->
        <xsl:if test="./a[8][text()='obj']">
        
            <!-- Creation des variables -->
            <xsl:variable name="numGov" select="./a[7]"/> <xsl:variable name="numDep" select="./a[1]"/>
            <xsl:variable name="dep" select="./a[2]/text()"/>
            <xsl:variable name="diffDepGouv" select="abs($numDep - $numGov)"/> 

            <xsl:text> 

</xsl:text>
            
<xsl:text> - Phrase concernée : </xsl:text>
            <xsl:for-each select="../item/a[2]"> <xsl:value-of select="."/> <xsl:text> </xsl:text> </xsl:for-each>
<xsl:text> 
</xsl:text>                                          
<!-- Calcul -->

<xsl:text> Gouverneur : </xsl:text> <xsl:value-of select="preceding-sibling::item[$diffDepGouv]/a[2]/text()"/> <xsl:text>
</xsl:text>
<xsl:text> Dépendant : </xsl:text> <xsl:value-of select="$dep"/>



        </xsl:if>
                
    </xsl:for-each>
</xsl:template>
    
    
<!-- TEMPLATE -->
    <xsl:template match="file" mode="description">
        
        <xsl:variable name="compteurDesc" select="count(//description/p/item/a[8][text()='obj'])" />
        
        <xsl:text> 
            
Nous avons </xsl:text> <xsl:value-of select="$compteurDesc"/> <xsl:text> items répondant à ce critère. </xsl:text>
        
        <xsl:for-each select="./description/p/item">
            
            <!-- si la dep est obj -->
            <xsl:if test="./a[8][text()='obj']">
                
                <!-- Creation des variables -->
                <xsl:variable name="numGov" select="./a[7]"/> <xsl:variable name="numDep" select="./a[1]"/>
                <xsl:variable name="dep" select="./a[2]/text()"/>
                <xsl:variable name="diffDepGouv" select="abs($numDep - $numGov)"/> 
                
                <xsl:text> 

</xsl:text>
                
                <xsl:text> - Phrase concernée : </xsl:text>
                <xsl:for-each select="../item/a[2]"> <xsl:value-of select="."/> <xsl:text> </xsl:text> </xsl:for-each>
                <xsl:text> 
</xsl:text>                                          
                <!-- Calcul -->
                
                <xsl:text> Gouverneur : </xsl:text> <xsl:value-of select="preceding-sibling::item[$diffDepGouv]/a[2]/text()"/> <xsl:text>
</xsl:text>
                <xsl:text> Dépendant : </xsl:text> <xsl:value-of select="$dep"/>
                 
            </xsl:if>
        </xsl:for-each>
        
     </xsl:template>




</xsl:stylesheet>

